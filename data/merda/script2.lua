local Camthing = 1;
local CamThingy = 1;
local HudBop = true;

function onUpdate(elapsed)
    songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
local currentBeat2 = (songPos/200)*(curBpm/200)
setProperty('camFollowPos.x',getProperty('camFollowPos.x') + (math.sin(currentBeat2) * 0.2))
setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat2) * 0.2))


noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)

noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 250 *math.cos((currentBeat2  *0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)
noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 250 *math.cos((currentBeat2*0.25)*math.pi), 0.5)



end

function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
doTweenZoom('camerazoom','camGame',0.775,0.15,'quadInOut')
cameraSetTarget('dad')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.0015, 0.15)
doTweenZoom('camerazoom','camGame',0.725,0.15,'quadInOut')
cameraSetTarget('boyfriend')
end

function onBeatHit()
    if curBeat % 2 == 0 then
        Camthing = -CamThingy;
    else
        Camthing = CamThingy;
    end

    if HudBop == true then
        setProperty('camHUD.angle', Camthing);
        doTweenAngle('TheFunny', 'camHUD', Camthing*4, stepCrochet*0.005, 'quadOut')
        setProperty('camHUD.zoom', 1.06)
        doTweenZoom('Bop', 'camHUD', 0.9, 1, 'cubeOut')
        setProperty('camZoom', 1.03)
        doTweenZoom('Bopin', 'camGame', 0.9, 1, 'cubeOut')
    end
end
    