local finalAlphaValue = 0;
local triggered = false;
function onEvent(name, value1, value2)
	if name == 'Force Middlescroll' then
		duration = tonumber(value1);
		if duration == nil then
			duration = 0.35;
		end
	
		ease = value2;
		if ease == '' then
			ease = 'sineOut';
		end

		diff = defaultPlayerStrumX2 - defaultPlayerStrumX1;
		for i = 0, 3 do
			if triggered then
				noteTweenX('Force Middlescroll Tween 1-'..i, i, _G['defaultOpponentStrumX'..i], duration, ease);
				if not middlescroll then
					noteTweenX('Force Middlescroll Tween 2-'..i, i + 4, _G['defaultPlayerStrumX'..i], duration, ease);
					noteTweenAlpha('Force Middlescroll Alpha '..i, i, 1, duration, 'linear');
				else
					noteTweenAlpha('Force Middlescroll Alpha '..i, i, 0.5, duration, 'linear');
				end
				setPropertyFromGroup('opponentStrums', i, 'visible', true);
			else
				if not middlescroll then
					noteTweenX('Force Middlescroll Tween 1-'..i, i, 412 + (i * diff), duration, ease);
					noteTweenX('Force Middlescroll Tween 2-'..i, i + 4, 412 + (i * diff), duration, ease);
				else
					noteTweenX('Force Middlescroll Tween 1-'..i, i, _G['defaultPlayerStrumX'..i], duration, ease);
				end
				noteTweenAlpha('Force Middlescroll Alpha '..i, i, finalAlphaValue, duration, 'linear');
			end
		end
		triggered = not triggered;
	end
end

function onTweenCompleted(tag)
	if triggered then
		for i = 0, 3 do
			if tag == 'Force Middlescroll Tween 1-'..i then
				setPropertyFromGroup('opponentStrums', i, 'visible', false);
			end
		end
	end
end