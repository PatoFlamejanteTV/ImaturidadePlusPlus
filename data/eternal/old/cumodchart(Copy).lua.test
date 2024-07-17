function onUpdate(elapsed)songPos = getSongPosition()

local currentBeat = (songPos/5000)*(curBpm/24)
local speed = 5

	noteTweenY('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.cos((currentBeat) + 0) * speed * (currentBeat / 4)), 0.05)
	noteTweenY('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.cos((currentBeat) + 1) * speed * (currentBeat / 4)), 0.05)
	noteTweenY('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.cos((currentBeat) + 2) * speed * (currentBeat / 4)), 0.05)
	noteTweenY('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.cos((currentBeat) + 3) * speed * (currentBeat / 4)), 0.05)
	noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 0) * speed * 2), 0.05)
	noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 1) * speed * 2), 0.05)
	noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 2) * speed * 2), 0.05)
	noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 3) * speed * 2), 0.05)
	noteTweenX('PlayerStrumX0', 4, defaultPlayerStrumY0 + (math.sin((currentBeat) + 0) * speed * currentBeat + (screenHeight)), 0.05)
	noteTweenX('PlayerStrumX1', 5, defaultPlayerStrumY1 + (math.sin((currentBeat) + 1) * speed * currentBeat + (screenHeight)), 0.05)
	noteTweenX('PlayerStrumX2', 6, defaultPlayerStrumY2 + (math.sin((currentBeat) + 2) * speed * currentBeat + (screenHeight)), 0.05)
	noteTweenX('PlayerStrumX3', 7, defaultPlayerStrumY3 + (math.sin((currentBeat) + 3) * speed * currentBeat + (screenHeight)), 0.05)
	noteTweenAngle('PlayerStrumX0', 4, defaultPlayerStrumY0 + (math.sin((currentBeat) + 0) * speed * currentBeat + (screenHeight)), 0.05)
	noteTweenAngle('PlayerStrumX1', 5, defaultPlayerStrumY1 + (math.sin((currentBeat) + 1) * speed * currentBeat + (screenHeight)), 0.05)
	noteTweenAngle('PlayerStrumX2', 6, defaultPlayerStrumY2 + (math.sin((currentBeat) + 2) * speed * currentBeat + (screenHeight)), 0.05)
	noteTweenAngle('PlayerStrumX3', 7, defaultPlayerStrumY3 + (math.sin((currentBeat) + 3) * speed * currentBeat + (screenHeight)), 0.05)
   noteTweenX('OpponentStrumX0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 0) * speed * 5), 0.05)
	noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 1) * speed * 5), 0.05)
	noteTweenX('OpponentStrumX2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 2) * speed * 5), 0.05)
	noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 3) * speed * 5), 0.05)

	end