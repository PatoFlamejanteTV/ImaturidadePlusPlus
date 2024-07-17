-- Event notes hooks
function onEvent(name,value1,value2)
	reversed = tonumber(value1);
	speed = tonumber(value2);
	if name == 'Arrow flip' then
		if reversed == 1 then
			noteTweenX('', 4, defaultPlayerStrumX0, speed, 'smoothStepOut')
			noteTweenX('plz', 7, defaultPlayerStrumX3, speed, 'smoothStepOut')
			noteTweenX('help', 6, defaultPlayerStrumX2, speed, 'smoothStepOut')
			noteTweenX('me', 5, defaultPlayerStrumX1 , speed, 'smoothStepOut')
		else
			noteTweenX('', 4, defaultPlayerStrumX3, speed, 'smoothStepOut')
			noteTweenX('aaaaaaaaaa', 7, defaultPlayerStrumX0, speed, 'smoothStepOut')
			noteTweenX('these are pointless', 5, defaultPlayerStrumX2 , speed, 'smoothStepOut') 
			noteTweenX('whywhywhywhywhy', 6, defaultPlayerStrumX1 , speed, 'smoothStepOut') -- for some reason these stupid lines wont work unless I put the strings there, I spent 15 minutes trying to fix this when all I needed to do was add rnadom strings to the code, i dont know why this hapenned but honestly i dont care at this point im tired and want to go to bed	
		end
	end
end


