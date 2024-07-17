--colors
phillyLightsColors = {'0xFF31A2FD', '0xFF31FD8C', '0xFFFB33F5', '0xFFFD4531', '0xFFFBA633'}

--some options
windowBG = true --if true forces the windows from the philly stage into any other stage (looks cool)
blackBG = true
gradient = true
particles = true

bgTransparency = 1 --how transparent the black bg will be


--variables
local curLightEvent = 1

local gradientOrY = 0
local gradientOrH = 0
local gradientIntendedA = 1

local partArray = {}

local active = false

local orBfOrder = 0
local orGfOrder = 0
local orDadOrder = 0

function onCreate()

	makeLuaSprite('phillyGlowBlack', '', screenWidth * -0.5, screenHeight * -0.5)
	makeGraphic('phillyGlowBlack', screenWidth * 2, screenHeight * 2, '000000')
	setProperty('phillyGlowBlack.visible', false)
	setScrollFactor('phillyGlowBlack', 0, 0)
	setProperty('phillyGlowBlack.alpha', bgTransparency)
	addLuaSprite('phillyGlowBlack')
	
	makeLuaSprite('phillyGlowGradient', 'phillyy/gradient', -400, 225)
	setGraphicSize('phillyGlowGradient', 2000, 400)
	setScrollFactor('phillyGlowGradient', 0, 0.75)
	updateHitbox('phillyGlowGradient')
	setProperty('phillyGlowGradient.visible', false)
	addLuaSprite('phillyGlowGradient')

	if getPropertyFromClass('ClientPrefs', 'flashing') == false then
		gradientIntendedA = 0.7
	end
	
	
	--gradient offsets (add your offsets here if the event looks weird)
	local curStage = getPropertyFromClass('PlayState', 'curStage')
	
	if curStage == 'limo' then
		setProperty('phillyGlowGradient.y', getProperty('phillyGlowGradient.y') + 200)
	end
	
	if curStage == 'customstagehere' then
		setProperty('phillyGlowGradient.y', getProperty('phillyGlowGradient.y') + 0)
	end
	
	gradientOrY = getProperty('phillyGlowGradient.y')
	gradientOrH = getProperty('phillyGlowGradient.height')
	
	
	--for philly stage (background windows)
	makeLuaSprite('phillyWindowEvent', 'phillyy/window', 10, 0)
	setProperty('phillyWindowEvent.scale.x', 0.85)
	setProperty('phillyWindowEvent.scale.y', 0.85)
	setScrollFactor('phillyWindowEvent', 0.3, 0.3)
	updateHitbox('phillyWindowEvent')
	setProperty('phillyWindowEvent.visible', false)
	addLuaSprite('phillyWindowEvent')

end

function makePhillyParticle(x, y, color)

	local obj = 'phillyParticle'..(#partArray + 1)
	
	makeLuaSprite(obj, 'phillyy/particle', x, y)
	setProperty(obj..'.color', getColorFromHex(color))
	addLuaSprite(obj)
	
	setObjectOrder(obj, getObjectOrder('phillyGlowGradient') + 1)
	
	local orScale = getRandomFloat(0.75, 1)
	setProperty(obj..'.scale.x', orScale)
	setProperty(obj..'.scale.y', orScale)
	
	setScrollFactor(obj, getRandomFloat(0.3, 0.75), getRandomFloat(0.65, 0.75))
	setProperty(obj..'.velocity.x', getRandomFloat(-40, 40))
	setProperty(obj..'.velocity.y', getRandomFloat(-175, -250))
	setProperty(obj..'.acceleration.x', getRandomFloat(-10, 10))
	setProperty(obj..'.acceleration.y', 25)

	partArray[#partArray + 1] = {name = obj, lifeTime = getRandomFloat(0.6, 0.9), decay = getRandomFloat(0.8, 1), scale = orScale}
	
	if getPropertyFromClass('ClientPrefs', 'flashing') == false then
		partArray[#partArray].decay = partArray[#partArray].decay * 0.5
		setProperty(obj..'.alpha', 0.5)
	end
	
end

function onUpdate(elapsed)

	if active then

		--gradient height
		local newHeight = math.ceil(getProperty('phillyGlowGradient.height') - 1000 * elapsed)
		if newHeight > 0 then
			setProperty('phillyGlowGradient.alpha', gradientIntendedA)
			setGraphicSize('phillyGlowGradient', 2000, newHeight)
			updateHitbox('phillyGlowGradient')
			setProperty('phillyGlowGradient.y', gradientOrY + (gradientOrH - getProperty('phillyGlowGradient.height')))
		else
			setProperty('phillyGlowGradient.alpha', 0)
			setProperty('phillyGlowGradient.y', -5000)
		end
		
		--particle stuff
		for i, j in pairs(partArray) do
		
			if luaSpriteExists(partArray[i].name) then
			
				partArray[i].lifeTime = partArray[i].lifeTime - elapsed
				
				if partArray[i].lifeTime <= 0 then
				
					partArray[i].lifeTime = 0
					setProperty(partArray[i].name..'.alpha', getProperty(partArray[i].name..'.alpha') - (partArray[i].decay * elapsed))
					
					if getProperty(partArray[i].name..'.alpha') > 0 then
						setProperty(partArray[i].name..'.scale.x', partArray[i].scale * getProperty(partArray[i].name..'.alpha'))
						setProperty(partArray[i].name..'.scale.y', partArray[i].scale * getProperty(partArray[i].name..'.alpha'))
					end
					
				end
				
				--remove the particle
				if getProperty(partArray[i].name..'.alpha') <= 0 then
					removeLuaSprite(partArray[i].name, true)
					partArray[i] = nil
				end
				
			end
			
		end
	
	end

end

function onEvent(tag, value1, value2)
	
	if tag == 'Philly Glow Recreation' then
	
		local lightId = tonumber(value1)
		if lightId == nil then lightId = 0 end
		
		local chars = {'boyfriend', 'gf', 'dad'}
		
		if lightId == 0 then
			
			if active then
			
				setObjectOrder('gfGroup', orGfOrder)
				setObjectOrder('dadGroup', orDadOrder)
				setObjectOrder('boyfriendGroup', orBfOrder)
			
				cameraFlash('camGame', 'FFFFFF', 0.15)
				
				if getPropertyFromClass('ClientPrefs', 'camZooms') then
					setPropertyFromClass('flixel.FlxG', 'camera.zoom', getPropertyFromClass('flixel.FlxG', 'camera.zoom') + 0.5)
					setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.1)
				end
				
				setProperty('phillyGlowBlack.visible', false)
				setProperty('phillyGlowGradient.visible', false)
				setProperty('phillyWindowEvent.visible', false)
				
				for i, j in pairs(partArray) do
		
					if luaSpriteExists(partArray[i].name) then
						removeLuaSprite(partArray[i].name, true)
					end
					
				end
				
				partArray = {}
				
				for i = 1, #chars do
					setProperty(chars[i]..'.color', getColorFromHex('FFFFFF'))
				end
				
				active = false
				
			end
			
		end
		
		if lightId == 1 then
		
			curLightEvent = getRandomInt(1, #phillyLightsColors, tostring(curLightEvent))
			local color = phillyLightsColors[curLightEvent]
			
			if active == false then
			
				--fix for sprites not working correctly on some stages
				orBfOrder = getObjectOrder('boyfriendGroup')
				orGfOrder = getObjectOrder('gfGroup')
				orDadOrder = getObjectOrder('dadGroup')

				setObjectOrder('phillyGlowBlack', 10000)
				setObjectOrder('phillyWindowEvent', 10001)
				setObjectOrder('phillyGlowGradient', 10002)
				
				setObjectOrder('gfGroup', 10003)
				setObjectOrder('dadGroup', 10004)
				setObjectOrder('boyfriendGroup', 10004)
				
				setProperty('camZooming', true)
			
				cameraFlash('camGame', 'FFFFFF', 0.15)
				
				if getPropertyFromClass('ClientPrefs', 'camZooms') then
					setPropertyFromClass('flixel.FlxG', 'camera.zoom', getPropertyFromClass('flixel.FlxG', 'camera.zoom') + 0.5)
					setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.1)
				end
				
				if blackBG then
					setProperty('phillyGlowBlack.visible', true)
				end
				
				if gradient then
					setProperty('phillyGlowGradient.visible', true)
				end
				
				if getPropertyFromClass('PlayState', 'curStage') == 'philly' or windowBG then
					setProperty('phillyWindowEvent.visible', true)
				end
			
				active = true
			
			end
			
			for i = 1, #chars do
				setProperty(chars[i]..'.color', getColorFromHex(color))
			end

			setProperty('phillyGlowGradient.color', getColorFromHex(color))
			setProperty('phillyWindowEvent.color', getColorFromHex(color))
			
			for i, j in pairs(partArray) do

				if luaSpriteExists(partArray[i].name) then
					setProperty(partArray[i].name..'.color', getColorFromHex(color))
				end
				
			end
			
		end
		
		if lightId == 2 then
		
			if active then
		
				if getPropertyFromClass('ClientPrefs', 'lowQuality') == false and particles then
				
					--spawn partArray
					local partArrayNum = getRandomInt(8, 12)
					local width = (2000 / partArrayNum)
					local color = phillyLightsColors[curLightEvent]
					
					for j = 0, 3 do
						
						for i = 0, partArrayNum do
							makePhillyParticle(-400 + width * i + getRandomFloat(-width / 5, width / 5), gradientOrY + 200 + (getRandomFloat(0, 125) + j * 40), color)
						end
						
					end
					
				end
				
				gradientBop()
			
			end
			
		end
	
	end
	
end

function gradientBop()
	setGraphicSize('phillyGlowGradient', 2000, gradientOrH)
	updateHitbox('phillyGlowGradient')
	setProperty('phillyGlowGradient.alpha', gradientIntendedA)
	setProperty('phillyGlowGradient.y', gradientOrY)
end