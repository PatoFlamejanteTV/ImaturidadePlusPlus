function onCreate()
makeLuaSprite('screen','zBar/LEMON',-170, 0); -- mudei o arquivo original do zBar e troquei pelo red.png
scaleObject('screen',1,1);
addLuaSprite('screen',true);
setObjectCamera('screen', 'other')
setProperty('screen.antialiasing', false);
setProperty('screen.alpha', 0)
end
function onStepHit()
if curStep == 3 then
doTweenAlpha('bar', 'screen', 1,0.2, 'linear')
end
end