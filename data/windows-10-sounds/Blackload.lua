function onCreate()
makeLuaSprite('Start', 'loading/blackload', 0, 0);
		scaleObject('Start', 1.0, 1.0);
		setObjectCamera('Start', 'other');
		addLuaSprite('Start', true);

end

function onUpdate()
if curStep == 0 then

        started = true

    end
end
function onSongStart()
	doTweenAlpha('graphicAlpha', 'Start', 0, 2, 'quintOut');
 
end
