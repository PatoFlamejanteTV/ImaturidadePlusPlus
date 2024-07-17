function onCreate()
	makeLuaSprite('real_stage', 'real_stage', -1475, -775);
	scaleObject('real_stage', 1.75, 1.75);
	addLuaSprite('real_stage', false)
end

function onSongStart()
	doTweenColor('darkbf', 'boyfriend', '949494', 1, 'linear')
	doTweenColor('darkbamb', 'dad', '949494', 1, 'linear')
	doTweenColor('darkgf', 'gf', '949494', 1, 'linear')
end

function onStartCountdown()
	doTweenAngle('anglelele', 'real_stage', 14040, 205, 'linear');
end