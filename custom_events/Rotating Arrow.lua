function onEvent(name, value1, value2)
	if name == 'Rotating Arrow' then
	
    if value1 == 'all' then
	function onStepHit()
	if curStep >= 0 and curStep <= 999999999999999999999999999999  then
	if curStep % 32 == 0 then
			setPropertyFromGroup('playerStrums', 0, 'angle', 22.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 22.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 22.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 22.5);
            
			setPropertyFromGroup('opponentStrums', 0, 'angle', 22.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 22.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 22.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 22.5);
		elseif curStep % 32 == 2 then 

			setPropertyFromGroup('playerStrums', 0, 'angle', 45);
			setPropertyFromGroup('playerStrums', 1, 'angle', 45);
			setPropertyFromGroup('playerStrums', 2, 'angle', 45);
			setPropertyFromGroup('playerStrums', 3, 'angle', 45);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 45);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 45);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 45);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 45);
		elseif curStep % 32 == 4 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 67.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 67.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 67.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 67.5);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 67.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 67.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 67.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 67.5);
		elseif curStep % 32 == 6 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 90);
			setPropertyFromGroup('playerStrums', 1, 'angle', 90);
			setPropertyFromGroup('playerStrums', 2, 'angle', 90);
			setPropertyFromGroup('playerStrums', 3, 'angle', 90);
			
            setPropertyFromGroup('opponentStrums', 0, 'angle', 90);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 90);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 90);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 90);
		elseif curStep % 32 == 8 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 112.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 112.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 112.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 112.5);
			
			setPropertyFromGroup('opponentStrums', 0, 'angle', 112.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 112.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 112.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 112.5);
		elseif curStep % 32 == 10 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 135);
			setPropertyFromGroup('playerStrums', 1, 'angle', 135);
			setPropertyFromGroup('playerStrums', 2, 'angle', 135);
			setPropertyFromGroup('playerStrums', 3, 'angle', 135);
			
			setPropertyFromGroup('opponentStrums', 0, 'angle', 135);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 135);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 135);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 135);
		elseif curStep % 32 == 12 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 157.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 157.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 157.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 157.5);
			
			setPropertyFromGroup('opponentStrums', 0, 'angle', 157.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 157.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 157.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 157.5);
		elseif curStep % 32 == 14 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 180);
			setPropertyFromGroup('playerStrums', 1, 'angle', 180);
			setPropertyFromGroup('playerStrums', 2, 'angle', 180);
			setPropertyFromGroup('playerStrums', 3, 'angle', 180);
			
            setPropertyFromGroup('opponentStrums', 0, 'angle', 180);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 180);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 180);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 180);
		elseif curStep % 32 == 16 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 202.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 202.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 202.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 202.5);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 202.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 202.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 202.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 202.5);
		elseif curStep % 32 == 18 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 225);
			setPropertyFromGroup('playerStrums', 1, 'angle', 225);
			setPropertyFromGroup('playerStrums', 2, 'angle', 225);
			setPropertyFromGroup('playerStrums', 3, 'angle', 225);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 222);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 225);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 225);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 225);
		elseif curStep % 32 == 20 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 247.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 247.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 247.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 247.5);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 247.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 247.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 247.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 247.5);
		elseif curStep % 32 == 22 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 270);
			setPropertyFromGroup('playerStrums', 1, 'angle', 270);
			setPropertyFromGroup('playerStrums', 2, 'angle', 270);
			setPropertyFromGroup('playerStrums', 3, 'angle', 270);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 270);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 270);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 270);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 270);
		elseif curStep % 32 == 24 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 292.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 292.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 292.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 292.5);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 292.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 292.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 292.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 292.5);
		elseif curStep % 32 == 26 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 315);
			setPropertyFromGroup('playerStrums', 1, 'angle', 315);
			setPropertyFromGroup('playerStrums', 2, 'angle', 315);
			setPropertyFromGroup('playerStrums', 3, 'angle', 315);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 315);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 315);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 315);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 315);
		elseif curStep % 32 == 28 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 337.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 337.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 337.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 337.5);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 337.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 337.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 337.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 337.5);
		elseif curStep % 32 == 30 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 0);
			setPropertyFromGroup('playerStrums', 1, 'angle', 0);
			setPropertyFromGroup('playerStrums', 2, 'angle', 0);
			setPropertyFromGroup('playerStrums', 3, 'angle', 0);

            setPropertyFromGroup('opponentStrums', 0, 'angle', 0);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 0);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 0);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 0);
	        end
		end
	end
end
    if value2 == '3' then
	function onStepHit()		
	end
	-- player note
	    noteTweenAngle("r5", 4, 0, 0.395, "quartInOut");
		noteTweenAngle("r6", 5, 0, 0.395, "quartInOut");
		noteTweenAngle("r7", 6, 0, 0.395, "quartInOut");
		noteTweenAngle("r8", 7, 0, 0.395, "quartInOut");
		
	-- opponent note
	
	    noteTweenAngle("r1", 0, 0, 0.395, "quartInOut");
		noteTweenAngle("r2", 1, 0, 0.395, "quartInOut");
		noteTweenAngle("r3", 2, 0, 0.395, "quartInOut");
		noteTweenAngle("r4", 3, 0, 0.395, "quartInOut");
        end		


	
    if value2 == '0' or value2 == '2' then
	function onStepHit()
    end
end


    if value1 == 'bf' then
	function onStepHit()
	if curStep >= 0 and curStep <= 999999999999999999999999999999  then
	if curStep % 32 == 0 then
			setPropertyFromGroup('playerStrums', 0, 'angle', 22.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 22.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 22.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 22.5);
		elseif curStep % 32 == 2 then 

			setPropertyFromGroup('playerStrums', 0, 'angle', 45);
			setPropertyFromGroup('playerStrums', 1, 'angle', 45);
			setPropertyFromGroup('playerStrums', 2, 'angle', 45);
			setPropertyFromGroup('playerStrums', 3, 'angle', 45);
		elseif curStep % 32 == 4 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 67.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 67.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 67.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 67.5);
		elseif curStep % 32 == 6 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 90);
			setPropertyFromGroup('playerStrums', 1, 'angle', 90);
			setPropertyFromGroup('playerStrums', 2, 'angle', 90);
			setPropertyFromGroup('playerStrums', 3, 'angle', 90);
		elseif curStep % 32 == 8 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 112.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 112.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 112.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 112.5);
		elseif curStep % 32 == 10 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 135);
			setPropertyFromGroup('playerStrums', 1, 'angle', 135);
			setPropertyFromGroup('playerStrums', 2, 'angle', 135);
			setPropertyFromGroup('playerStrums', 3, 'angle', 135);
		elseif curStep % 32 == 12 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 157.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 157.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 157.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 157.5);
		elseif curStep % 32 == 14 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 180);
			setPropertyFromGroup('playerStrums', 1, 'angle', 180);
			setPropertyFromGroup('playerStrums', 2, 'angle', 180);
			setPropertyFromGroup('playerStrums', 3, 'angle', 180);
		elseif curStep % 32 == 16 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 202.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 202.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 202.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 202.5);
		elseif curStep % 32 == 18 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 225);
			setPropertyFromGroup('playerStrums', 1, 'angle', 225);
			setPropertyFromGroup('playerStrums', 2, 'angle', 225);
			setPropertyFromGroup('playerStrums', 3, 'angle', 225);
		elseif curStep % 32 == 20 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 247.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 247.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 247.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 247.5);
		elseif curStep % 32 == 22 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 270);
			setPropertyFromGroup('playerStrums', 1, 'angle', 270);
			setPropertyFromGroup('playerStrums', 2, 'angle', 270);
			setPropertyFromGroup('playerStrums', 3, 'angle', 270);
		elseif curStep % 32 == 24 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 292.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 292.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 292.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 292.5);
		elseif curStep % 32 == 26 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 315);
			setPropertyFromGroup('playerStrums', 1, 'angle', 315);
			setPropertyFromGroup('playerStrums', 2, 'angle', 315);
			setPropertyFromGroup('playerStrums', 3, 'angle', 315);
		elseif curStep % 32 == 28 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 337.5);
			setPropertyFromGroup('playerStrums', 1, 'angle', 337.5);
			setPropertyFromGroup('playerStrums', 2, 'angle', 337.5);
			setPropertyFromGroup('playerStrums', 3, 'angle', 337.5);
		elseif curStep % 32 == 30 then

			setPropertyFromGroup('playerStrums', 0, 'angle', 0);
			setPropertyFromGroup('playerStrums', 1, 'angle', 0);
			setPropertyFromGroup('playerStrums', 2, 'angle', 0);
			setPropertyFromGroup('playerStrums', 3, 'angle', 0);
	        end
		end
	end
end
    if value1 == 'dad' then
	function onStepHit()
	if curStep >= 0 and curStep <= 999999999999999999999999999999  then
	if curStep % 32 == 0 then            
			setPropertyFromGroup('opponentStrums', 0, 'angle', 22.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 22.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 22.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 22.5);
		elseif curStep % 32 == 2 then 

            setPropertyFromGroup('opponentStrums', 0, 'angle', 45);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 45);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 45);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 45);
		elseif curStep % 32 == 4 then

            setPropertyFromGroup('opponentStrums', 0, 'angle', 67.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 67.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 67.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 67.5);
		elseif curStep % 32 == 6 then

            setPropertyFromGroup('opponentStrums', 0, 'angle', 90);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 90);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 90);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 90);
		elseif curStep % 32 == 8 then

			setPropertyFromGroup('opponentStrums', 0, 'angle', 112.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 112.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 112.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 112.5);
		elseif curStep % 32 == 10 then

			setPropertyFromGroup('opponentStrums', 0, 'angle', 135);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 135);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 135);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 135);
		elseif curStep % 32 == 12 then
			
			setPropertyFromGroup('opponentStrums', 0, 'angle', 157.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 157.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 157.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 157.5);
		elseif curStep % 32 == 14 then
			
            setPropertyFromGroup('opponentStrums', 0, 'angle', 180);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 180);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 180);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 180);
		elseif curStep % 32 == 16 then


            setPropertyFromGroup('opponentStrums', 0, 'angle', 202.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 202.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 202.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 202.5);
		elseif curStep % 32 == 18 then


            setPropertyFromGroup('opponentStrums', 0, 'angle', 222);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 225);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 225);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 225);
		elseif curStep % 32 == 20 then


            setPropertyFromGroup('opponentStrums', 0, 'angle', 247.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 247.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 247.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 247.5);
		elseif curStep % 32 == 22 then


            setPropertyFromGroup('opponentStrums', 0, 'angle', 270);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 270);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 270);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 270);
		elseif curStep % 32 == 24 then


            setPropertyFromGroup('opponentStrums', 0, 'angle', 292.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 292.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 292.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 292.5);
		elseif curStep % 32 == 26 then

            setPropertyFromGroup('opponentStrums', 0, 'angle', 315);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 315);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 315);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 315);
		elseif curStep % 32 == 28 then

            setPropertyFromGroup('opponentStrums', 0, 'angle', 337.5);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 337.5);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 337.5);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 337.5);
		elseif curStep % 32 == 30 then

            setPropertyFromGroup('opponentStrums', 0, 'angle', 0);
			setPropertyFromGroup('opponentStrums', 1, 'angle', 0);
			setPropertyFromGroup('opponentStrums', 2, 'angle', 0);
			setPropertyFromGroup('opponentStrums', 3, 'angle', 0);
	        end
		end
	end
end
end
end