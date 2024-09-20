function onCreate()
	if dadName == 'chart_guy' then
		makeAnimatedLuaSprite('animatedDadicon', 'icons/gif_guy', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedDadicon', 'normal', 'normal', 24, true)
		setScrollFactor('animatedDadicon', 0, 0)
		setObjectCamera('animatedDadicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('animatedDadicon', true)
		objectPlayAnimation('animatedDadicon', 'normal', false)
	end
	
end

function onUpdate(elapsed)
	if dadName == 'chart_guy' then
			objectPlayAnimation('animatedDadicon', 'normal', false)
	end
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('animatedDadicon.x', getProperty('iconP1.x'))
	setProperty('animatedDadicon.angle', getProperty('iconP1.angle'))
	setProperty('animatedDadicon.y', getProperty('iconP1.y') + 0)
	setProperty('animatedDadicon.scale.x', getProperty('iconP1.scale.x'))
	setProperty('animatedDadicon.scale.y', getProperty('iconP1.scale.y'))
end