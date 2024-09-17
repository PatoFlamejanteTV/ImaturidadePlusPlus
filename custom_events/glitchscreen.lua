--[[script by CorvisFreemont/TM-44 Music]]

Chromashit = 0;
function onCreatePost() 

    initLuaShader("vcr")
    makeLuaSprite("temporaryShader1")
    setSpriteShader("temporaryShader1", "vcr")
		runHaxeCode([[

			trace(ShaderFilter);

			game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader)]);
			game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader)]);
			game.camOther.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader)]);
		]])
		addHaxeLibrary("ShaderFilter1", "openfl.filters")
end

function onEvent(name, value1, value2)
if name == 'glitchscreen' then
Chromashit = Chromashit + value1

end
end

function boundTo(value, min, max)
return math.max(min, math.min(max, value))
end

function math.lerp(from,to,i)
return from+(to-from)*i
end

function setChrome(chromeOffset)
    setShaderFloat("temporaryShader1", "bOffset", chromeOffset * getRandomFloat(-2, 2));
    setShaderFloat("temporaryShader1", "rOffset", chromeOffset * getRandomFloat(-2, 2));
    setShaderFloat("temporaryShader1", "gOffset", chromeOffset * getRandomFloat(-2, 2));
end

function onUpdate(elapsed)
   Chromashit = math.lerp(Chromashit, 0 / 300, boundTo(elapsed * 10, 0, 5000));
setChrome(Chromashit)
end