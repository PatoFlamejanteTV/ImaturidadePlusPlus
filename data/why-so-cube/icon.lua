function onCreate()
	if boyfriendName == 'joker-gif' then
		makeAnimatedLuaSprite('animatedBFicon', 'icons/joker-cube', getProperty('iconP1.x'), getProperty('iconP1.y'))
		addAnimationByPrefix('animatedBFicon', 'normal', 'idle', 24, true)
		setScrollFactor('animatedBFicon', 0, 0)
		setObjectCamera('animatedBFicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('animatedBFicon', true)
		objectPlayAnimation('animatedBFicon', 'normal', false)
	end
	
end

function onUpdate(elapsed)
	if boyfriendName == 'joker-gif' then
			objectPlayAnimation('animatedBFicon', 'normal', false)
	end
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('animatedBFicon.x', getProperty('iconP1.x'))
	setProperty('animatedBFicon.angle', getProperty('iconP1.angle'))
	setProperty('animatedBFicon.y', getProperty('iconP1.y') + 0)
	setProperty('animatedBFicon.scale.x', getProperty('iconP1.scale.x'))
	setProperty('animatedBFicon.scale.y', getProperty('iconP1.scale.y'))
end