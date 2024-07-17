function onUpdate(elapsed)songPos = getSongPosition()

local currentBeat = (songPos/5000)*(curBpm/24)
local delay = (math.sin(currentBeat) * (currentBeat * 5)) -- "segura" o modchart e não deixa ele mega rapido.

	noteTweenY('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.tan((currentBeat) + 0) * (currentBeat / delay)), 0.05)
	noteTweenY('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.tan((currentBeat) + 1) * (currentBeat / delay)), 0.05)
	noteTweenY('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.tan((currentBeat) + 2) * (currentBeat / delay)), 0.05)
	noteTweenY('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.tan((currentBeat) + 3) * (currentBeat / delay)), 0.05)
	noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.tan((currentBeat) + 0) * currentBeat / delay), 0.05)
	noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.tan((currentBeat) + 1) * currentBeat / delay), 0.05)
	noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.tan((currentBeat) + 2) * currentBeat / delay), 0.05)
	noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.tan((currentBeat) + 3) * currentBeat / delay), 0.05)
	end