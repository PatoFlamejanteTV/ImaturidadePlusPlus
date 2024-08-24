---------------------- DONT CHANGE THE NAME OF THIS LUA OR THE SONG WILL CRASH ----(TROLOX)
local useOnGame = true      
local useOnHUD = true

local defaultX = 0
local defaultY = 0
local defaultAngle = 0
local defaultZoom = 1

local effect = 0
local strength = 1
local contrast = 1
local brightness = 0

local scale = 0

function onCreatePost()
    makeLuaSprite('mosaicEffect', '', scale,0)

    runHaxeCode('game.variables["mosaicEffect"] = game.createRuntimeShader("mosaicEffect");')

    if useOnGame then
        runHaxeCode('game.camGame.setFilters([new ShaderFilter(game.variables["mosaicEffect"]), new ShaderFilter(game.variables["bloomEffect"]), new ShaderFilter(game.variables["greyScale"])]);')
    end
    if useOnHUD then
        runHaxeCode('game.camHUD.setFilters([new ShaderFilter(game.variables["mosaicEffect"]), new ShaderFilter(game.variables["bloomEffect"]), new ShaderFilter(game.variables["greyScale"])]);')
    end
    updateShader()
end

function updateShader()
    runHaxeCode('game.variables["mosaicEffect"].setFloat("strength", '..(getProperty('mosaicEffect.x'))..');')

end

function onUpdate(elapsed)
    updateShader()
end

function onEvent(eventName, value1, value2)
    if eventName == 'mosaicEffect' then
        doTweenX('mosaicEffect', 'mosaicEffect', value1, value2, 'linear')
    end
end

