local Value = 0

function onEvent(eventName, value1, value2)
    if eventName == "set camera zoom tween" then
        Value = tonumber(value1)
        doTweenZoom('cameraZoom', 'camGame', tonumber(value1), tonumber(value2), 'quadInOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'cameraZoom' then
        setProperty('defaultCamZoom', Value)
    end
end