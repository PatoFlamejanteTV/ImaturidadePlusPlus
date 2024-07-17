function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "Lyricspibby" then
if not lowQuality then
        makeLuaText('captions', 'Lyrics go here', 1000, 150, 550)
        setTextString('captions',  '' .. string)
        setTextColor('captions', 'A8A0B3')
        setTextSize('captions', 45);
        addLuaText('captions')
setTextFont('captions', 'Thunderman.ttf')
	setObjectCamera('captions', 'other');
        setTextAlignment('captions', 'center')
        
    end
end
end

