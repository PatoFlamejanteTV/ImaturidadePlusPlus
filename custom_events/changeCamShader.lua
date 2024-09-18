local shaders = {'bnw', 'chromaticAbber', 'chromaticPincush', 'flip', 'warping', 'invert', 'rainbow', 'chromaticRadialBlur'}
local cams = {'camHUD', 'camGame', 'camOther'}
local time = 0

function onEvent(n, v1, v2)
    if n == "changeCamShader" then
        if v2 == 'none' then
            runHaxeCode([[
                game.]].. v1 ..[[.setFilters([]);
            ]])
        else
            shaderCoordFix()

            setSpriteShader(v1, v2)

            runHaxeCode([[
                game.initLuaShader(game.getLuaObject(']].. v1 ..[[').shader);

                game.]].. v1 ..[[.setFilters([new ShaderFilter(game.getLuaObject(']].. v1 ..[[').shader)]);
            ]])
        end
    end
end

function createCamSprites()
    for i=1, #cams do
        if not luaSpriteExists(cams[i]) then
            makeLuaSprite(cams[i], nil, 0, 0)
            makeGraphic(cams[i], 1280, 720)
        end
    end
end

function onCreate()
    createCamSprites()
    shaderCoordFix()
    for i=1, #shaders do
        initLuaShader(shaders[i])
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end

function onUpdatePost(elapsed)
    time = time + elapsed
    for i=1, #cams do
        setShaderFloat(cams[i], 'iTime', time)
    end
end