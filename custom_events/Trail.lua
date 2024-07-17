function onEvent(name, value1, value2)
	if name == "Trail" then
		local trail = true

		if value1 == '1' then
			trail = true
		else
			trail = false
		end
				function getIconColor(chr)
					if trail == true then
						return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
					end
				end

				function rgbToHex(array)
					if trail == true then
						return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
					end
				end

				function makeSmth(ea, ae, alph)
					if trail == true then
						local thing = 0
						thing = ae
						if not string.match(getProperty(ea..'.animation.curAnim.name'), 'sing') then
							thing = -1
						end
						for i = 1, 2 do
							ghostTrail(ea, {getProperty(ea..'.animation.frameName'), getProperty(ea..'.offset.x'), getProperty(ea..'.offset.y'), thing, getProperty(ea..'.animation.curFrame')}, alph)
							thing = -1
						end
					end
				end

				local chars = {}

				function goodNoteHit(id, direction, noteType, isSustainNote)
					if trail == true then
						chars['boyfriend'] = direction
						makeSmth('boyfriend', direction, 1)
					end
				end

				function noteMiss(membersIndex, noteData, noteType, isSustainNote)
					if trail == true then
						chars['boyfriend'] = noteData
						makeSmth('boyfriend', direction, 1)
					end
				end

				function opponentNoteHit(id, direction, noteType, isSustainNote)
					if trail == true then
						if dadName ~= 'black' and noteType ~= 'Both Opponents Sing' then
							if getPropertyFromGroup('notes', id, 'gfNote') then
								chars['gf'] = direction
								makeSmth('gf', direction, 1)
							elseif noteType ~= 'Opponent 2 Sing' then
								chars['dad'] = direction
								makeSmth('dad', direction, 1)
							else
								chars['mom'] = direction
								makeSmth('mom', direction, 1)
							end
						end
					end
				end

				function onStepHit()
					if trail == true then
						for ea, ae in pairs(chars) do
							makeSmth(ea, ae, 0.25)
						end
					end
				end

				local ghostNum = 0
				local funniDis = 75
				function ghostTrail(char, noteData, alph)
					if trail == true then
						-- debugPrint(char)
						local ghost = char..'Ghost'..ghostNum
						local group = char
						if char == 'mom' then
							group = 'dad'
						end

						makeAnimatedLuaSprite(ghost, getProperty(char..'.imageFile'), getProperty(char..'.x'), getProperty(char..'.y'))
						addAnimationByPrefix(ghost, 'idle', noteData[1], 0, false)
						setProperty(ghost..'.antialiasing', getProperty(char..'.antialiasing'))
						setProperty(ghost..'.offset.x', noteData[2])
						setProperty(ghost..'.offset.y', noteData[3])
						setProperty(ghost..'.scale.x', getProperty(char..'.scale.x'))
						setProperty(ghost..'.scale.y', getProperty(char..'.scale.y'))
						setProperty(ghost..'.flipX', getProperty(char..'.flipX'))
						setProperty(ghost..'.flipY', getProperty(char..'.flipY'))
						setProperty(ghost..'.visible', getProperty(char..'.visible'))
						setProperty(ghost..'.color', getIconColor(char))
						setProperty(ghost..'.alpha', 0.75 * getProperty(char..'.alpha') * alph)
						setBlendMode(ghost, 'add')
						addLuaSprite(ghost)
						playAnim(ghost, 'idle', true, false, noteData[5])
						setObjectOrder(ghost, getObjectOrder(group..'Group') - 0.1)
						cancelTween(ghost)
						doTweenAlpha(ghost, ghost, 0, crochet*0.001, 'linear')

						if noteData[4] == 0 then
							doTweenX(ghostNum..'', ghost, getProperty(char..'.x') - funniDis, crochet*0.001, 'sineout')
						elseif noteData[4] == 1 then
							doTweenY(ghostNum..'', ghost, getProperty(char..'.y') + funniDis, crochet*0.001, 'sineout')
						elseif noteData[4] == 2 then
							doTweenY(ghostNum..'', ghost, getProperty(char..'.y') - funniDis, crochet*0.001, 'sineout')
						elseif noteData[4] == 3 then
							doTweenX(ghostNum..'', ghost, getProperty(char..'.x') + funniDis, crochet*0.001, 'sineout')
						end

						ghostNum = ghostNum + 1
					end
				end

				function onTweenCompleted(tag)
					if trail == true then
						if string.match(tag, 'Ghost') then
							removeLuaSprite(tag, true)
						end
					end
				end
	end
end
