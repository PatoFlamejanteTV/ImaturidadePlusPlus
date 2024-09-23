function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	doTweenY('opponentmove', 'dad', -100 - 100*math.sin((currentBeat*2.75)*math.pi), 0.005) -- doTweenY('opponentmove', 'dad', -100 - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	--if difficulty == 1 then
			noteTweenX('PlayerStrumX0', 4, defaultPlayerStrumX0 + (math.sin((currentBeat) + 0) * 40), 0.05)
			noteTweenX('PlayerStrumX1', 5, defaultPlayerStrumX1 + (math.sin((currentBeat) + 16) * 40), 0.05)
			noteTweenX('PlayerStrumX2', 6, defaultPlayerStrumX2 + (math.sin((currentBeat) + 0) * 40), 0.05)
			noteTweenX('PlayerStrumX3', 7, defaultPlayerStrumX3 + (math.sin((currentBeat) + 16) * 40), 0.05)
			noteTweenY('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.cos((currentBeat) + 0) * 40), 0.05)
			noteTweenY('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.cos((currentBeat) + 16) * 40), 0.05)
			noteTweenY('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.cos((currentBeat) + 0) * 40), 0.05)
			noteTweenY('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.cos((currentBeat) + 16) * 40), 0.05)
			noteTweenX('OpponentStrumX0', 0, defaultOpponentStrumX0 * (math.tan((currentBeat) + 0) * 1), 1)
			noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumX1 * (math.tan((currentBeat) + 16) * 1), 1)
			noteTweenX('OpponentStrumX2', 2, defaultOpponentStrumX2 * (math.tan((currentBeat) + 0) * 1), 1)
			noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumX3 * (math.tan((currentBeat) + 16) * 1), 1)
			noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 * (math.tan((currentBeat) + 0) * 1), 1)
			noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 * (math.tan((currentBeat) + 16) * 1), 1)
			noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 * (math.tan((currentBeat) + 0) * 1), 1)
			noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 * (math.tan((currentBeat) + 16) * 1), 1)
	--end
end