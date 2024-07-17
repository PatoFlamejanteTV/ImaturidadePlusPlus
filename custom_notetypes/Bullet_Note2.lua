function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an desviation note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet_Note2' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bullet_Note'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
	function noteMiss(id, i, noteType, isSustainNote)
		if noteType == 'Bullet_Note2' then
			playSound('shot', 1)
			setProperty('health', -0.1);
		characterPlayAnim('boyfriend', 'hurt', true);
		characterPlayAnim('pico', 'down', true);

	end
end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Bullet_Note2' then
		playSound('shot', 1)
		characterPlayAnim('boyfriend', 'dodge', true);
		characterPlayAnim('pico', 'down', true);
	end
end