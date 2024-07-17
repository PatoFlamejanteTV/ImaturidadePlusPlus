--credits
--I Used toggle trail from Psychic mod but fixed it.

-- variables
trailEnabledDad = false;
trailEnabledBF = false;
timerStartedDad = false;
timerStartedBF = false;
startTrailDad = true

trailLength = 6;
trailDelay = 0.05;
trailAlpha = 0.6
trailObjectOrder = -1
function onEvent(name, value1, value2)
	if name == "Toggle Ghost Trail" then
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'stopTrailDad' then
				numberDad = 0
				trailEnabledDad = false
			end

			if tag == 'stopTrailBF' then
				trailEnabledBF = false
				numberBF = 0
				createTrailFrameBF('BF');
			end
			
			if tag == 'timerTrailBF' then
				createTrailFrameBF('BF');
			end
			if tag == 'timerTrailDad' then
				createTrailFrameDad('Dad');
			end
		end
		
		-- toggle dad trail
		if not (value1 == '0' or value1 == '') then
			numberDad = trailAlpha
			trailEnabledDad = true
			
			curTrailDad = 0;
			function createTrailFrameDad(tag)
				num = 0;
				color = -1;
				image = '';
				frameDad = 'BF idle dance';
				x = 0;
				y = 0;
				x2 = 0;
				y2 = 0;
				offsetX = 0;
				offsetY = 0;
			
				if tag == 'Dad' then
					num = curTrailDad;
					curTrailDad = curTrailDad + 1;
					if trailEnabledDad and startTrailDad == true then
						-- get color from health bar thingy
						r = getProperty('dad.healthColorArray[0]')
						g = getProperty('dad.healthColorArray[1]')
						b = getProperty('dad.healthColorArray[2]')
						color = (r * 0x10000) + (g * 0x100) + b
						-- stuff
						doIT = true
						flip = getProperty('dad.flipX')
						image = getProperty('dad.imageFile')
						frameDad = getProperty('dad.animation.frameName');
						scaleX = getProperty('dad.scale.x')
						scaleY = getProperty('dad.scale.y')
						x = getProperty('dad.x');
						y = getProperty('dad.y');
						x2 = getProperty('dad.x');
						y2 = getProperty('dad.y');
						offsetX = getProperty('dad.offset.x');
						offsetX2 = getProperty('dad.offset.x');
						offsetY = getProperty('dad.offset.y');
						offsetY2 = getProperty('dad.offset.y');
					end
				end
			
				if num - trailLength + 1 >= 0 then
					for i = (num - trailLength + 1), (num - 1) do
						setProperty('psychicTrail'..tag..i..'.alpha', getProperty('psychicTrail'..tag..i..'.alpha') - (0.6 / (trailLength - 1)));
					end
				end
				removeLuaSprite('psychicTrail'..tag..(num - trailLength));
			
				if not (image == '') then
					trailTag = 'psychicTrail'..tag..num;
					makeAnimatedLuaSprite(trailTag, image, x, y);
					setProperty(trailTag..'.offset.x', offsetX);
					setProperty(trailTag..'.offset.y', offsetY);
					setProperty(trailTag..'.scale.x', scaleX)
					setProperty(trailTag..'.scale.y', scaleY)
					setProperty(trailTag..'.flipX', flip)
					setObjectOrder(trailTag, trailObjectOrder)
					setProperty(trailTag..'.alpha', numberDad);
					setProperty(trailTag..'.color', color);
					addAnimationByPrefix(trailTag, 'stuff', frameDad, 0, false);
					addLuaSprite(trailTag, false);
				end
				if dadName == 'agoti-mad' then
					function opponentNoteHit(id, noteData, noteType, isSustainNote)
						if not isSustainNote then
							trailTag = 'psychicTrail'..tag..num;
							if noteData == 2 or noteData == 3 then
								doTweenX('trail', trailTag, offsetX2 + 50, 0.08 , linear)
							end
			
							if noteData == 0 or noteData == 2 then
								doTweenX('trail', trailTag, offsetX2 - 100, 0.08 , linear)	
							end
						end
					end
				end
			end
			--number = 0.4
			if not timerStartedDad then
			runTimer('timerTrailDad', trailDelay, 0);
			timerStartedDad = true;
			trailEnabledDad = true
			dadColorPervious = (value1)
			dadColor = value1
		end
	else
		trailEnabledDad = false
		numberDad = 0
		--runTimer('stopTrailDad', 0.2)
		--number = 0
	end

	-- toggle bf trail
	if not (value2 == '0' or value2 == '') then
		numberBF = trailAlpha
		trailEnabledBF = true

		curTrailBF = 0;
		function createTrailFrameBF(tag)
			num = 0;
			color = -1;
			image = '';
			frame = 'BF idle dance';
			x = 0;
			y = 0;
			offsetX = 0;
			offsetY = 0;
		
			if tag == 'BF' then
				num = curTrailBF;
				curTrailBF = curTrailBF + 1;
				if trailEnabledBF then
						-- get color from health bar thingy
						r = getProperty('boyfriend.healthColorArray[0]')
						g = getProperty('boyfriend.healthColorArray[1]')
						b = getProperty('boyfriend.healthColorArray[2]')
						color = (r * 0x10000) + (g * 0x100) + b
						-- stuff					
					flip = getProperty('boyfriend.flipX')
					image = getProperty('boyfriend.imageFile')
					frame = getProperty('boyfriend.animation.frameName');
					scaleX = getProperty('boyfriend.scale.x')
					scaleY = getProperty('boyfriend.scale.y')
					x = getProperty('boyfriend.x');
					y = getProperty('boyfriend.y');
					offsetX = getProperty('boyfriend.offset.x');
					offsetY = getProperty('boyfriend.offset.y');
				end
			end
		
			if num - trailLength + 1 >= 0 then
				for i = (num - trailLength + 1), (num - 1) do
					setProperty('psychicTrail'..tag..i..'.alpha', getProperty('psychicTrail'..tag..i..'.alpha') - (0.6 / (trailLength - 1)));
				end
			end
			removeLuaSprite('psychicTrail'..tag..(num - trailLength));
		
			if not (image == '') then
				trailTag = 'psychicTrail'..tag..num;
				makeAnimatedLuaSprite(trailTag, image, x, y);
				setProperty(trailTag..'.offset.x', offsetX);
				setProperty(trailTag..'.offset.y', offsetY);
				setProperty(trailTag..'.flipX', flip)
				setProperty(trailTag..'.scale.x', scaleX)
				setProperty(trailTag..'.scale.y', scaleY)
				setObjectOrder(trailTag, trailObjectOrder)
				setProperty(trailTag..'.alpha', numberBF);
				setProperty(trailTag..'.color', color);
				--setBlendMode(trailTag, 'add');
				addAnimationByPrefix(trailTag, 'stuff', frame, 0, false);
				addLuaSprite(trailTag, false);
			end
		end
		--number = 0.4
		if not timerStartedBF then
		runTimer('timerTrailBF', trailDelay, 0);
		timerStartedBF = true;
		trailEnabledBF = true
		bfColorPervious = (value2)
		bfColor = value2
	end
else
	trailEnabledBF = false
	numberBF = 0
	--runTimer('stopTrailBF', 0.2)
	setProperty(trailTag..'.alpha', numberBF);
	--number = 0
end

function onUpdate()

end




		--if not (value1 == nil or value1 == '') and tonumber(value1) > 0 then
		--	if not timerStartedDad then
		--		runTimer('timerTrailDad', trailDelay, 0);
		--		timerStartedDad = true;
		--	end
		--	trailEnabledDad = true;
		--else
		--	trailEnabledDad = false;
		--end

		--if not (value2 == nil or value2 == '') and tonumber(value2) > 0 then
		--	if not timerStartedBF then
		--		runTimer('timerTrailBF', trailDelay, 0);
		--		timerStartedBF = true;
		--	end
		--	trailEnabledBF = true;
		--else
	--		trailEnabledBF = false;
	--	end



	--function onTweenCompleted(name)
	--	if name == 'trail' then
	--		doIT = true
	--	end
		
	--end


	end
end