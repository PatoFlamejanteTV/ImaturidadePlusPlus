local shakeX = 40;
local shakeY = 30;
local shakeX2 = 40;
local shakeY2 = 30;


function onUpdate()
	setPropertyFromClass('openfl.Lib','application.window.x', getRandomFloat(shakeX,shakeX2))
    setPropertyFromClass('openfl.Lib','application.window.y', getRandomFloat(shakeY,shakeY2))
end
function onEvent(name,value1,value2)
	if name == 'WindowShake' then 
		
		if value1 == 'normal' then
			shakeX = 45;
            shakeY = 35;
			shakeX2 = 50;
			shakeY2 = 40;
		end
		if value1 == 'little' then
            shakeX = 35;
            shakeY = 25;
			shakeX2 = 40;
			shakeY2 = 30;
        end
            if value1 == 'medium' then
                shakeX = 25;
                shakeY = 15;
        		shakeX2 = 45;
		        shakeY2 = 35;
            end
                if value1 == 'large' then
                    shakeX = 15;
                    shakeY = 5;
					shakeX2 = 55;
			        shakeY2 = 45;
		end
	end
end
