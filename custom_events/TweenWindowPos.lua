local tweenTime = 1
local tweenType = 'linear'
local defScaleX = 1280
local defScaleY = 720

local useDefScale = false

function onCreatePost()
	addHaxeLibrary('FlxTween', 'flixel.tweens')
	addHaxeLibrary('Application', 'lime.app')

	wasFull = getPropertyFromClass('openfl.Lib', 'application.window.fullscreen')

	setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)
	screenX = getPropertyFromClass('openfl.Lib', 'application.window.width')
	screenY = getPropertyFromClass('openfl.Lib', 'application.window.height')
	setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
	setPropertyFromClass('openfl.Lib', 'application.window.resizable', false)
	setPropertyFromClass('openfl.Lib', 'application.window.borderless', true)
	setPropertyFromClass('openfl.Lib', 'application.window.width', screenX/2)
	setPropertyFromClass('openfl.Lib', 'application.window.height', screenY/2)
	runHaxeCode([[
		FlxTween.tween(Application.current.window, { x: ]].. screenX / 2 - (getPropertyFromClass('openfl.Lib', 'application.window.width') / 2) ..[[, y: ]].. screenY / 2 - (getPropertyFromClass('openfl.Lib', 'application.window.height') / 2) ..[[}, ]].. 60000/curBpm/1000*2 ..[[, {ease: FlxEase.quadInOut});
	]])
end

function onUpdatePost(elapsed)
	if getPropertyFromClass('openfl.Lib', 'application.window.fullscreen') then
		setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
	end
end

function onEvent(name, value1, value2)
	if name == 'TweenWindowPos' then
		if value1 == 'time' then
			tweenTime = value2
		elseif value1 == 'type' then
			tweenType = value2
		elseif value1 == 'defScaleX' then
			useDefScale = true
			if value2 == 'false' then
				useDefScale = false
			else
				defScaleX = value2
			end
		elseif value1 == 'defScaleY' then
			useDefScale = true
			if value2 == 'false' then
				useDefScale = false
			else
				defScaleY = value2
			end
		else
			if useDefScale then
				runHaxeCode([[
					FlxTween.tween(Application.current.window, { x: ]].. screenX * (value1/100) - defScaleX / 2 ..[[, y: ]].. screenY * (value2/100) - defScaleY / 2 ..[[}, ]].. tweenTime ..[[, {ease: FlxEase.]].. tweenType ..[[});
				]])
			else
				runHaxeCode([[
					FlxTween.tween(Application.current.window, { x: ]].. screenX * (value1/100) - getPropertyFromClass('openfl.Lib', 'application.window.width') / 2 ..[[, y: ]].. screenY * (value2/100) - getPropertyFromClass('openfl.Lib', 'application.window.height') / 2 ..[[}, ]].. tweenTime ..[[, {ease: FlxEase.]].. tweenType ..[[});
				]])
			end
		end
	end
end

function onDestroy()
	setPropertyFromClass('openfl.Lib', 'application.window.width', screenX-screenX/4)
	setPropertyFromClass('openfl.Lib', 'application.window.height', (screenX-screenX/4)/16*9)
	setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', wasFull)
	setPropertyFromClass('openfl.Lib', 'application.window.resizable', true)
	setPropertyFromClass('openfl.Lib', 'application.window.borderless', false)

	if not wasFull then
		runHaxeCode([[
			FlxTween.tween(Application.current.window, { x: ]].. screenX / 2 - (getPropertyFromClass('openfl.Lib', 'application.window.width') / 2) ..[[, y: ]].. screenY / 2 - (getPropertyFromClass('openfl.Lib', 'application.window.height') / 2) ..[[}, ]].. 0.5 ..[[, {ease: FlxEase.quadInOut});
		]])
	end
end