-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Opponent Fade' then
		duration = tonumber(value1);
		if duration > 0 then
			makeLuaSprite('overlays', 'overlay', -800, -300)
			addLuaSprite('overlays', true)
			setBlendMode('overlays','multiply');
			setGraphicSize('overlays', 0.7, 0.7)
			setScrollFactor('overlays',0,0)
		end

	
	end
end