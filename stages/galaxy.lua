function onCreate()
	makeLuaSprite('galaxy', 'galaxy', -1475, -775);
	scaleObject('galaxy', 1.75, 1.75);
	addLuaSprite('galaxy', false)
end

function onSongStart()
	doTweenColor('darkbf', 'boyfriend', '949494', 1, 'linear')
	doTweenColor('darkbamb', 'dad', '949494', 1, 'linear')
	doTweenColor('darkgf', 'gf', '949494', 1, 'linear')
end

function onStartCountdown()
	doTweenAngle('anglelele', 'galaxy', 14040, 205, 'linear');
end