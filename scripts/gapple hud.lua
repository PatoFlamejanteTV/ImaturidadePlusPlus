local updateText = true

function onCreatePost()

	 singduration = getProperty('boyfriend.singDuration')
	 setProperty('timeBar.visible', false)
	 setProperty('timeTxt.borderSize', getProperty('scoreTxt.borderSize'))

	 makeLuaText('songText', ''..songName..'',0,0,0)
	 setTextSize('songText', 17)
	 setObjectOrder('songText', getObjectOrder('scoreTxt')+ 1)
	 setProperty('songText.y', getProperty('scoreTxt.y')+ 17)
	 setProperty('songText.borderSize', getProperty('scoreTxt.borderSize'))
	 addLuaText('songText', true)

	 setTextSize('botplayTxt', 50)
	 setProperty('botplayTxt.borderSize', 3.3)
	 setProperty('botplayTxt.y', 170)
	 if not downscroll then
	    setProperty('botplayTxt.y', 470)
	 end
end
function onUpdatePost()
           accuracy = math.floor(rating * 10000) / 100
	 if botPlay then
	    setProperty('boyfriend.singDuration', 100000)
	 else
	    setProperty('boyfriend.singDuration', singduration)
	 end
if updateText then
	 if ratingName == '?' then
	    setTextString('scoreTxt', 'Score: 0 | Misses: 0 | Accuracy: 0%')
	    updateText = false
	 else
	    setTextString('scoreTxt', 'Score: '..score..' | Misses: '..misses..' | Accuracy: '..accuracy..'%')
	    updateText = false
	 end
end

	for i = 0, getProperty('notes.length') - 1 do
		sus = getPropertyFromGroup('notes', i, 'isSustainNote');
		susEnd = getPropertyFromGroup('notes', i, 'animation.curAnim.name'):find('holdend');
		if sus and susEnd and not getPropertyFromClass('PlayState', 'isPixelStage') then
		setPropertyFromGroup('notes', i, 'scale.y', 0.7);
		setPropertyFromGroup('notes', i, 'offset.y', downscroll and -10 or 10);
	end
    end
end
function goodNoteHit()
	    updateText = true
end
function onUpdateScore()
	    updateText = true
end
function onCountdownTick(counter)
  if counter == 0 then
     playAnim('dad', 'idle', true)

     playAnim('boyfriend', 'idle', true)
  end
  if counter == 1 then
     playAnim('dad', 'idle', true)

     playAnim('boyfriend', 'idle', true)
  end
  if counter == 2 then
     playAnim('dad', 'idle', true)

     playAnim('boyfriend', 'idle', true)
  end
  if counter == 3 then
     playAnim('dad', 'singUP', true)
     playAnim('dad', 'hey', true)

     playAnim('boyfriend', 'singUP', true)
     playAnim('boyfriend', 'hey', true)
  end
  if counter == 4 then
     playAnim('dad', 'idle', true)

     playAnim('boyfriend', 'idle', true)
  end
end