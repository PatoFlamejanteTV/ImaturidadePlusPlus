function onCreatePost()
 if noteSkin ~= 'optimizedBox' then
  close();
 end 
 if noteSkin == 'optimizedBox' then 
  for i = 0, getProperty('playerStrums.length') - 1 do
	setProperty('playerStrums.members['..i..'].scale.x', 7.5) 
	setProperty('playerStrums.members['..i..'].scale.y', 7.5) 	
	setProperty('playerStrums.members['..i..'].x', getProperty('playerStrums.members['..i..'].x')+ 57.5) 
	setProperty('playerStrums.members['..i..'].y', getProperty('playerStrums.members['..i..'].y')+ 57.5) 		
	setProperty('playerStrums.members['..i..'].antialiasing', false) 	
	setProperty('opponentStrums.members['..i..'].scale.x', 7.5) 
	setProperty('opponentStrums.members['..i..'].scale.y', 7.5) 	
	setProperty('opponentStrums.members['..i..'].x', getProperty('opponentStrums.members['..i..'].x')+ 57.5) 
	setProperty('opponentStrums.members['..i..'].y', getProperty('opponentStrums.members['..i..'].y')+ 57.5) 	
	setProperty('opponentStrums.members['..i..'].antialiasing', false) 		
  end	
  for i = 0, getProperty("unspawnNotes.length") - 1 do
    setPropertyFromGroup("unspawnNotes", i, "scale.x", 7.5)
    setPropertyFromGroup("unspawnNotes", i, "scale.y", 7.5)
    setPropertyFromGroup("unspawnNotes", i, "antialiasing", false)	
  end
 end  
end

function onUpdate(elapsed)
 --debugPrint('Amongus')
end