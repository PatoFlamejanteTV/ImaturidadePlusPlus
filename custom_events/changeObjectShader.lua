local shaders = {'bnw', 'chromaticAbber', 'chromaticPincush', 'flip', 'warping', 'invert', 'rainbow', 'chromaticRadialBlur'}
local objects = {}
local time = 0

function onEvent(n, v1, v2)
    if n == "changeObjectShader" then
        if v1 == 'none' then
            removeSpriteShader(v2)
        else
            setSpriteShader(v2, v1)
        end
        if not checkInserted(v2) then
            table.insert(objects, v2)
        end
    end
end

function onCreate()
    for i=1, #shaders do
        initLuaShader(shaders[i])
    end
end

function checkInserted(object)
    local isInserted = false
    if #objects >= 1 then
        for i=1, #objects do
            if objects[i] == object then
                isInserted = true
            end
        end
    end
    return isInserted
end

function onUpdatePost(elapsed)
    time = time + elapsed
    if #objects >= 1 then
        for i=1, #objects do
            setShaderFloat(objects[i], 'iTime', time)
        end
    end
end