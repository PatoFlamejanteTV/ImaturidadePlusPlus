--[[
    Version: 1.2.0
    Author: Ralsi (https://gamebanana.com/members/1939328)
    GB Page: https://gamebanana.com/tools/12694
    Crediting: If used in a mod, crediting is not necessary but very much appreciated. Do not remove or edit all this info tho.
--]]

local addStageZoom, addHudZoom = 0, 0
local stageZoomMult, hudZoomMult = 1, 1
local stageZoomSpeed, hudZoomSpeed = 3.1, 3.1
local lerpStageCam, lerpHUDCam = true, true
local stageBumpEvery, hudBumpEvery = 4, 4
local function lerp(s, e, t)
    return s + (e - s) * math.min(t, 1)
end
local eventHandlers = {
    ['toggleLerp'] = function(v1, v2)
        if v1 == 'game' or v1 == 'stage' then
            lerpStageCam = not lerpStageCam
        elseif v1 == 'hud' then
            lerpHUDCam = not lerpHUDCam
        else
            lerpStageCam = not lerpStageCam
            lerpHUDCam = not lerpHUDCam
        end
    end,
    ['setBumping'] = function(v1, v2)
        if v1 == 'game' or v1 == 'stage' then
            stageBumpEvery = v2
        elseif v1 == 'hud' then
            hudBumpEvery = v2
        else
            stageBumpEvery = v2
            hudBumpEvery = v2
        end
    end,
    ['setZoom'] = function(v1, v2)
        local args = stringSplit(v2, '/')
        if v1 == 'game' or v1 == 'stage' then
            runHaxeCode(('FlxTween.num(%s, %s, %s, {ease: FlxEase.%s}, function (num) {game.setOnLuas("RCZStageZoom", num);});')
                :format(RCZStageZoom, args[1], args[2], args[3]))
        elseif v1 == 'hud' then
            runHaxeCode(('FlxTween.num(%s, %s, %s, {ease: FlxEase.%s}, function (num) {game.setOnLuas("RCZhudZoom", num);});')
                :format(RCZhudZoom, args[1], args[2], args[3]))
        end
    end,
    ['addZoom'] = function(v1, v2)
        local args = stringSplit(v2, '/')
        if v1 == 'game' or v1 == 'stage' then
            runHaxeCode(('FlxTween.num(%s, %s, %s, {ease: FlxEase.%s}, function (num) {game.setOnLuas("RCZStageZoom", num);});')
                :format(RCZStageZoom, RCZStageZoom + tonumber(args[1]), args[2], args[3]))
        elseif v1 == 'hud' then
            runHaxeCode(('FlxTween.num(%s, %s, %s, {ease: FlxEase.%s}, function (num) {game.setOnLuas("RCZhudZoom", num);});')
                :format(RCZhudZoom, RCZhudZoom + tonumber(args[1]), args[2], args[3]))
        end
    end,
    ['setMult'] = function (v1, v2)
        if v1 ~= '' then
            stageZoomMult = tonumber(v1)
        end
        if v2 ~= '' then
            hudZoomMult = tonumber(v2)
        end
    end,
    ['setSpeed'] = function(v1, v2)
        if v1 ~= '' then
            stageZoomSpeed = tonumber(v1)
        end
        if v2 ~= '' then
            hudZoomSpeed = tonumber(v2)
        end
    end,
    ['bumpCamera'] = function (v1, v2)
        v1 = v1 ~= '' and v1 or 0.015
        v2 = v2 ~= '' and v2 or 0.03
        addStageZoom = addStageZoom + v1
        addHudZoom = addHudZoom + v2
    end
}
function onEvent(name, v1, v2)
    if not cameraZoomOnBeat then return end
    if name == 'Add Camera Zoom' then
        v1 = v1 ~= '' and v1 or 0.015 * stageZoomMult
        v2 = v2 ~= '' and v2 or 0.03 * hudZoomMult
        addStageZoom = addStageZoom + v1 * stageZoomMult
        addHudZoom = addHudZoom + v2 * hudZoomMult
        return
    end
    if not stringStartsWith(name, 'RalZoom') then return end
    local event = eventHandlers[stringSplit(name, '-')[2]]
    if event then
        event(v1, v2)
    end
end

function onCreatePost()
    setProperty('camZooming', false)
    runHaxeCode(([[
        game.setOnLuas('RCZStageZoom', %s);
        game.setOnLuas('RCZhudZoom', 1.0);
    ]]):format(getProperty('defaultCamZoom')))
end

function onUpdatePost(dt)
    if not cameraZoomOnBeat then return end
    if lerpStageCam then addStageZoom = lerp(addStageZoom, 0, dt * stageZoomSpeed * playbackRate) end
    if lerpHUDCam then addHudZoom = lerp(addHudZoom, 0, dt * hudZoomSpeed * playbackRate) end
    setProperty('camGame.zoom', RCZStageZoom + addStageZoom)
    setProperty('camHUD.zoom', RCZhudZoom + addHudZoom)
end

function onBeatHit()
    if not cameraZoomOnBeat then return end
    if stageBumpEvery ~= 0 and curBeat % stageBumpEvery == 0 then
        addStageZoom = addStageZoom + 0.015 * stageZoomMult
    end
    if hudBumpEvery ~= 0 and curBeat % hudBumpEvery == 0 then
        addHudZoom = addHudZoom + 0.03 * hudZoomMult
    end
end