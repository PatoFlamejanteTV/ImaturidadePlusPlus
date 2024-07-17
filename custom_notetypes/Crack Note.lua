rng = 0

function onCreatePost()

	for i = 0, getProperty('unspawnNotes.length') - 1 do

		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Crack Note' then

			setPropertyFromGroup('unspawnNotes', i, 'texture', 'crackarrow');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);

		end

	end

end

function goodNoteHit(id, noteData, noteType, isSustainNote)

	if noteType == 'Crack Note' then

		rng = getRandomInt(1,4);

		if rng == 4 then

			setHealth(getHealth() - 0.35);

		end

		runTimer('effect', 5, 1);

	end

end

function onUpdate(elapsed)

	if rng == 0 then

		for i = 0, getProperty('unspawnNotes.length') - 1 do

			if getPropertyFromGroup('unspawnNotes', i, 'noteType') ~= 'Crack Note' then

				setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023');
				setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.0475');
				setPropertyFromGroup('unspawnNotes', i, 'scrollSpeedMult', '1');

			end

		end


	elseif rng == 1 then

		for i = 0, getProperty('unspawnNotes.length') - 1 do

			if getPropertyFromGroup('unspawnNotes', i, 'noteType') ~= 'Crack Note' then

				setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.08');

			end

		end

	elseif rng == 2 then

		for i = 0, getProperty('unspawnNotes.length') - 1 do

			if getPropertyFromGroup('unspawnNotes', i, 'noteType') ~= 'Crack Note' then

				setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.01');

			end

		end

	elseif rng == 3 then

		for i = 0, getProperty('unspawnNotes.length') - 1 do

			if getPropertyFromGroup('unspawnNotes', i, 'noteType') ~= 'Crack Note' then

				setPropertyFromGroup('unspawnNotes', i, 'scrollSpeedMult', '1.25');

			end

		end

	end

end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'effect' then

		rng = 0

	end

end