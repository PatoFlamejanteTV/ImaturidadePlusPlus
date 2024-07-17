function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "Lyrics" then

        makeLuaText('captions', 'Lyrics go here', 1000, 150, 550)
        setTextString('captions',  '' .. string)
        setTextColor('captions', '52A5EB')
        setTextSize('captions', 45);
        addLuaText('captions')
setTextFont('captions', 'Gumball.ttf')
	setObjectCamera('captions', 'other');
        setTextAlignment('captions', 'center')
        
    end
end

