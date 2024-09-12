function onStepHit()
	if curStep == 1 then
		callScript('scripts/noopenvid', 'makeVideoSprite', {'Vidin', 'name', 0, 0, 'camHud', false}) 
		setProperty('Vidin.scale.x', 1) 
		setProperty('Vidin.scale.y', 1) 
		end
end