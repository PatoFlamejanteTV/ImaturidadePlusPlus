function onEvent(name, value1, value2)
	if name == "ScreenStuff" then
		if value2 == nil then
			value2 = 0.005
		else
			value2 = value2 / 100
		end
		
		doTweenAngle('turn', 'camGame', value1, stepCrochet*value2, 'elasticInOut')
		doTweenAngle('turn2', 'camHUD', value1, stepCrochet*value2, 'elasticInOut')	
	end
end