function onEvent(eventName, value1, value2)
    if eventName == "set camera zoom" then
        setProperty('defaultCamZoom', value1)
    end
end