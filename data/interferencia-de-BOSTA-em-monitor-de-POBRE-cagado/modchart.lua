function onUpdate(elapsed)songPos = getSongPosition()

local currentBeat = (songPos/5000)*(curBpm/24)*10

	noteTweenY('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.cos((currentBeat) + 0) * 60), 0.05)
	noteTweenY('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.cos((currentBeat) + 1) * 60), 0.05)
	noteTweenY('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.cos((currentBeat) + 2) * 60), 0.05)
	noteTweenY('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.cos((currentBeat) + 3) * 60), 0.05)

	noteTweenAngle('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.cos((currentBeat) + 0) * 160), 0.05)
	noteTweenAngle('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.cos((currentBeat) + 1) * 160), 0.05)
	noteTweenAngle('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.cos((currentBeat) + 2) * 160), 0.05)
	noteTweenAngle('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.cos((currentBeat) + 3) * 160), 0.05)

	noteTweenDirection('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.cos((currentBeat) + 0) * currentBeat), 0.05)
	noteTweenDirection('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.cos((currentBeat) + 1) * currentBeat), 0.05)
	noteTweenDirection('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.cos((currentBeat) + 2) * currentBeat), 0.05)
	noteTweenDirection('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.cos((currentBeat) + 3) * currentBeat), 0.05)


	noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.tan((currentBeat) + 0) * 60), 0.05)
	noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.tan((currentBeat) + 1) * 60), 0.05)
	noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.tan((currentBeat) + 2) * 60), 0.05)
	noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.tan((currentBeat) + 3) * 60), 0.05)
	end