function onEvent(name, value1, value2)
	if name == 'Bopping HUD' then

		v1 = value1
		v2 = value2
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		setProperty('camHUD.angle', v1*12)
		doTweenAngle('hudTween', 'camHUD', 0, 0.5, 'backOut')
	else
		setProperty('camHUD.angle', v1*-12)
		doTweenAngle('hudTween', 'camHUD', 0, 0.5, 'backOut')
	end
end