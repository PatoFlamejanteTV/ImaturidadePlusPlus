local scaleWit = false  -- do funky scale with icon based on your lowest rating (Works weird with texHop)
local texHop = true -- Text does little jump when it increases

local colorText = true -- Funny colors on the text (If false, only removes ratings text colors, plain white with all this text is just dumb)
local colorFade = false -- Remove color from text once a rating LOWER than it is recieved

local totalAllNotes = true -- Does the "All Notes:" show? (Shows every must hit note)

local alineLol = 'center'
local manX = 0

local sickColor = '00FFFF'
local goodColor = '4CFF00'
local badColor = 'FF0000'
local shitColor = '7F0000'

local baseColor = 'ffffff'

local totNote = 0
--local hiSco = 0
local maxComb
function onCreate()
    if colorText == false then
        sickColor = baseColor 
        goodColor = baseColor 
        badColor = baseColor 
        shitColor = baseColor
    end

    if alineLol == 'left' then
        manX = 5 -- -8 isn't exactly onscreen
    end

    if totalAllNotes == true then
        makeLuaText("allNotes", 'All Notes: ', 400, manX - 100, 229);
        setObjectCamera("allNotes", 'hud');
        setTextColor('allNotes', sickColor)
        setTextSize('allNotes', 20);
        addLuaText("allNotes");
        setTextFont('allNotes', "vcr.ttf")
        setTextAlignment('allNotes', alineLol)
    end

    makeLuaText("curCombo", 'Combo: 0', 200, manX, 259);
    setObjectCamera("curCombo", 'hud');
    setTextColor('curCombo', baseColor)
    setTextSize('curCombo', 20);
    addLuaText("curCombo");
    setTextFont('curCombo', "vcr.ttf")
    setTextAlignment('curCombo', alineLol)

    makeLuaText("mCombo", 'Max Combo: 0', 200, getProperty('curCombo.x'), getProperty('curCombo.y') + 30); -- 289
    setObjectCamera("mCombo", 'hud');
    setTextColor('mCombo', 'ffffff')
    setTextSize('mCombo', 20);
    addLuaText("mCombo");
    setTextFont('mCombo', "vcr.ttf")
    setTextAlignment('mCombo', alineLol)

    makeLuaText("sick", 'Sicks!!: 0', 200, getProperty('curCombo.x'), getProperty('mCombo.y') + 30); -- 319
    setObjectCamera("sick", 'hud');
    setTextColor('sick', sickColor)
    setTextSize('sick', 20);
    addLuaText("sick");
    setTextFont('sick', "vcr.ttf")
    setTextAlignment('sick', alineLol)
    setProperty('sick.alpha', 0.6)

    makeLuaText("good", 'Goods!: 0', 200, getProperty('curCombo.x'), getProperty('sick.y') + 30); -- 349
    setObjectCamera("good", 'hud');
    setTextColor('good', goodColor)
    setTextSize('good', 20);
    addLuaText("good");
    setTextFont('good', "vcr.ttf")
    setTextAlignment('good', alineLol)
    setProperty('good.alpha', 0.6)


    makeLuaText("bad", 'Bads: 0', 200, getProperty('curCombo.x'), getProperty('good.y') + 30); -- 379
    setObjectCamera("bad", 'hud');
    setTextColor('bad', badColor)
    setTextSize('bad', 20);
    addLuaText("bad");
    setTextFont('bad', "vcr.ttf")
    setTextAlignment('bad', alineLol)
    setProperty('bad.alpha', 0.6)


    makeLuaText("shit", 'Shits: 0', 200, getProperty('curCombo.x'), getProperty('bad.y') + 30); -- 409
    setObjectCamera("shit", 'hud');
    setTextColor('shit', shitColor)
    setTextSize('shit', 20);
    addLuaText("shit");
    setTextFont('shit', "vcr.ttf")
    setTextAlignment('shit', alineLol)
    setProperty('shit.alpha', 0.6)

    makeLuaText("miss", 'Misses: 0', 200, getProperty('curCombo.x'), getProperty('shit.y') + 30); -- 439
    setObjectCamera("miss", 'hud');
    setTextColor('miss', '36eaf7')
    setTextSize('miss', 20);
    addLuaText("miss");
    setTextFont('miss', "vcr.ttf")
    setTextAlignment('miss', alineLol)
    setProperty('miss.alpha', 0.8)

    --[[makeLuaText("maxScore", 'Max Score: ', 400, getProperty('curCombo.x'), getProperty('miss.y') + 30);
    setObjectCamera("maxScore", 'hud');
    setTextColor('maxScore', '36eaf7')
    setTextSize('maxScore', 20);
    addLuaText("maxScore");
    setTextFont('maxScore', "vcr.ttf")
    setTextAlignment('maxScore', alineLol)]]
end

function onCreatePost()
    maxComb = 0
    
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') == false then
            if getPropertyFromGroup('unspawnNotes', i, 'ignoreNote') == false then
                if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then
                    totNote = totNote + 1
                    --hiSco = hiSco + 350         
                end
            end
        end
    end

    setTextString('allNotes', 'All Notes: '.. totNote)
    --setTextString('maxScore', 'Max Score: '.. hiSco)
end


function onUpdate(elapsed)
   
    local combo = getProperty('combo')
    local sicks = getProperty('sicks')
    local goods = getProperty('goods')
    local bads = getProperty('bads')
    local shits = getProperty('shits')
    local misss = getProperty('songMisses')

    if maxComb < combo then
        maxComb = combo
    end

    setTextString('curCombo', 'Combo: '.. combo)
    setTextString('mCombo', 'Max Combo: '.. maxComb)
    setTextString('sick', 'Sicks!!: '.. sicks)
    setTextString('good', 'Goods!: '.. goods)
    setTextString('bad', 'Bads: '.. bads)
    setTextString('shit', 'Shits: '.. shits)

    if misses < 1 then 
        setTextString('miss', 'Misses: FC')
    else
        setTextString('miss', 'Misses: '.. misss)
    end

    if sicks ~= 0 and goods == 0 and bads == 0 and shits == 0 then
        setTextColor('sick', sickColor)
        if scaleWit == true then
            setProperty('sick.scale.x', getProperty('iconP1.scale.x')) -- + 0.01
	        setProperty('sick.scale.y', getProperty('iconP1.scale.y')) -- + 0.01
        end
    elseif goods > 0 or bads > 0 or shits > 0 then
        if colorFade == true then
            setTextColor('sick', baseColor)
        end
        if scaleWit == true then
            setProperty('sick.scale.x', 1)
	        setProperty('sick.scale.y', 1)
        end
    end

    if goods ~= 0 and bads == 0 and shits == 0 then
        setTextColor('good', goodColor)
        if scaleWit == true then
            setProperty('good.scale.x', getProperty('iconP1.scale.x') - 0.005)
	        setProperty('good.scale.y', getProperty('iconP1.scale.y') - 0.005)
        end
    elseif bads > 0 or shits > 0 then
        if colorFade == true then
            setTextColor('good', baseColor)
        end
        if scaleWit == true then
            setProperty('good.scale.x', 1)
	        setProperty('good.scale.y', 1)
        end
    end

    if bads ~= 0 and shits == 0 then
        setTextColor('bad', badColor)
        if scaleWit == true then
            setProperty('bad.scale.x', getProperty('iconP1.scale.x') - 0.01)
	        setProperty('bad.scale.y', getProperty('iconP1.scale.y') - 0.01)
        end
    elseif shits > 0 then
        if colorFade == true then
            setTextColor('bad', baseColor)
        end
        if scaleWit == true then
            setProperty('bad.scale.x', 1)
	        setProperty('bad.scale.y', 1)
        end
    end


    if misss > 0 then
        setTextColor('miss', 'ff0000')
        setProperty('miss.alpha', 1)
    end

    if sicks ~= 0 and getProperty('sick.alpha') ~= 1 then
        setProperty('sick.alpha', 1)
    end
    if goods ~= 0 and getProperty('good.alpha') ~= 1 then
        setProperty('good.alpha', 1)
    end
    if bads ~= 0 and getProperty('bad.alpha') ~= 1 then
        setProperty('bad.alpha', 1)
    end
    if shits ~= 0 and getProperty('shit.alpha') ~= 1 then
        setProperty('shit.alpha', 1)
    end
end

local hmm = ''

function goodNoteHit(id, direction, noteType, isSustainNote)
    setProperty('curCombo.scale.x', 1.03)
    setProperty('curCombo.scale.y', 1.03)
    setProperty('mCombo.scale.x', 1.03)
    setProperty('mCombo.scale.y', 1.03)
    runTimer('hited', 0.07, 1)

    strumTime = getPropertyFromGroup('notes', id, 'strumTime');
    local rating = getRating(strumTime - getSongPosition() + getPropertyFromClass('ClientPrefs','ratingOffset'));
    hmm = rating

    if not isSustainNote and texHop == true then
        if hmm == 'sick' then
            setProperty('sick.y', getProperty('sick.y') - 5)-- / (math.floor(getProperty('sick.scale.y'))))
            finished(hmm)
        end
        if hmm == 'good' then
            setProperty('good.y', getProperty('good.y') - 5)-- / (math.floor(getProperty('good.scale.y'))))
            finished(hmm)
        end
        if hmm == 'bad' then
            setProperty('bad.y', getProperty('bad.y') - 5) --/ (math.floor(getProperty('bad.scale.y'))))
            finished(hmm)    
        end
        if hmm == 'shit' then
            setProperty('shit.y', getProperty('shit.y') - 5)-- / (math.floor(getProperty('shit.scale.y'))))
            finished(hmm) 
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'hited' then
        setProperty('curCombo.scale.x', 1)
        setProperty('curCombo.scale.y', 1)
        if maxComb == getProperty('combo') then
            setProperty('mCombo.scale.x', 1)
            setProperty('mCombo.scale.y', 1)
        end
    end
end

function finished(rat)
    if rat == 'sick' then
        doTweenY('upSi', 'sick', 319, 0.07, 'linear')
    end

    if rat == 'good' then
        doTweenY('upGi', 'good', 349, 0.07, 'linear')
    end

    if rat == 'bad' then
        doTweenY('upBi', 'bad', 379, 0.07, 'linear')
    end

    if rat == 'shit' then
        doTweenY('upShi', 'shit', 409, 0.07, 'linear')
    end
end

function onTweenCompleted(tag)
    --if tag == 'upSi' then
    --end
end

-- that one guy, what was his name? AApanzu? nah, i'll remember later --
function getRating(diff)
    diff = math.abs(diff);
    if diff <= getPropertyFromClass('ClientPrefs', 'badWindow') then
        if diff <= getPropertyFromClass('ClientPrefs', 'goodWindow') then
            if diff <= getPropertyFromClass('ClientPrefs', 'sickWindow') then
                return 'sick';
            end
            return 'good';
        end
        return 'bad';
    end
    return 'shit';
end