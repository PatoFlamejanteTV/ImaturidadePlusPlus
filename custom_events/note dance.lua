function onUpdate(elapsed)
    songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
local currentBeat2 = (songPos/200)*(curBpm/200)
setProperty('camFollowPos.x',getProperty('camFollowPos.x') + (math.sin(currentBeat2) * 0.2))
setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat2) * 0.2))

noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)

noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 100*math.cos((currentBeat2*0.25)*math.pi), 0.5)
end