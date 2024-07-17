function mysplit (inputstr, sep)
    if sep == nil then
        sep = "%s";
    end
    local t={};
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str);
    end
    return t;
end

-- Event notes hooks
function onEvent(name, value1, value2)
    if name == "aMoveArrow" then
        local tableee=mysplit(value2,", "); -- Splits value1 into a table
        value1 = tonumber(value1)

        if value1 < 4 then
            notePosX = getPropertyFromGroup('opponentStrums', value1, 'x');
            notePosY = getPropertyFromGroup('opponentStrums', value1, 'y');
        else
            notee = value1 - 4;
            notePosX = getPropertyFromGroup('playerStrums', notee, 'x');
            notePosY = getPropertyFromGroup('playerStrums', notee, 'y');
        end

        if tableee[1] == "return" then
            tableee[1] = 0;
        else
            newnotePosX = notePosX + tableee[1];
        end
        if tableee[2] == "return" then
            tableee[2] = 0;
        else
            newnotePosY = notePosY + tableee[2];
        end

        duration = tableee[5];
        rotation = tableee[3];
        opacity = tableee[4];

        tableee[1] = tonumber(tableee[1]);
        tableee[2] = tonumber(tableee[2]);
        tableee[3] = tonumber(tableee[3]);
        tableee[4] = tonumber(tableee[4]);
        tableee[5] = tonumber(tableee[5]);

        if value1 == 0 then
            noteTweenX("x1",0,newnotePosX,duration,"linear");
            noteTweenY("y1",0,newnotePosY,duration,"linear");
            noteTweenAngle("r1",0,rotation,duration, "linear");
            noteTweenAlpha("o1",0,opacity,duration,"linear");
        elseif value1 == 1 then
            noteTweenX("x2",1,newnotePosX,duration,"linear");
            noteTweenY("y2",1,newnotePosY,duration,"linear");
            noteTweenAngle("r2",1,rotation,duration, "linear");
            noteTweenAlpha("o2",1,opacity,duration,"linear");
        elseif value1 == 2 then
            noteTweenX("x3",2,newnotePosX,duration,"linear");
            noteTweenY("y3",2,newnotePosY,duration,"linear");
            noteTweenAngle("r3",2,rotation,duration, "linear");
            noteTweenAlpha("o3",2,opacity,duration,"linear");
        elseif value1 == 3 then
            noteTweenX("x4",3,newnotePosX,duration,"linear");
            noteTweenY("y4",3,newnotePosY,duration,"linear");
            noteTweenAngle("r4",3,rotation,duration, "linear");
            noteTweenAlpha("o4",3,opacity,duration,"linear");
        elseif value1 == 4 then
            noteTweenX("x5",4,newnotePosX,duration,"linear");
            noteTweenY("y5",4,newnotePosY,duration,"linear");
            noteTweenAngle("r5",4,rotation,duration, "linear");
            noteTweenAlpha("o5",4,opacity,duration,"linear");
        elseif value1 == 5 then
            noteTweenX("x6",5,newnotePosX,duration,"linear");
            noteTweenY("y6",5,newnotePosY,duration,"linear");
            noteTweenAngle("r6",5,rotation,duration, "linear");
            noteTweenAlpha("o6",5,opacity,duration,"linear");
        elseif value1 == 6 then
            noteTweenX("x7",6,newnotePosX,duration,"linear");
            noteTweenY("y7",6,newnotePosY,duration,"linear");
            noteTweenAngle("r7",6,rotation,duration, "linear");
            noteTweenAlpha("o7",6,opacity,duration,"linear");
        elseif value1 == 7 then
            noteTweenX("x8",7,newnotePosX,duration,"linear");
            noteTweenY("y8",7,newnotePosY,duration,"linear");
            noteTweenAngle("r8",7,rotation,duration, "linear");
            noteTweenAlpha("o8",7,opacity,duration,"linear");
        end
    end
end