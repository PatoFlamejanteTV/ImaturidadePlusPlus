--!strict

--[[
Debug test					|| Made (mainly) for Imaturidade++
    By: PatoflamejanteTV	|| Under CC SA
        (aka UltimateQuack)	|| 
]]--
local IPP = require("IPP")

function onCreate() -- quando começar a música
--function onUpdate(elapsed) -- a cada "atualizada"

	local center = 350 -- lugarzinho aonde ele(s) irá(m) ficar
	local font = "vcr.ttf" -- fonte, pegado diretamente do /fonts
	local space = 40 -- espaçamento em pixels
	
	
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
    setPropertyFromClass('flixel.FlxG', 'drawDebug', true);

    makeLuaText('Info', "Informações:", 0, center, space)
    setObjectCamera('Info', 'hud')
    setTextFont('Info', 'font')
    setTextSize('Info', 35)
    addLuaText('Info', true)
	
	---------------------------------------------
	makeLuaText('BFX', "BFX", 0, center, space * 2)
    setObjectCamera('BFX', 'hud')
    setTextFont('BFX', 'font')
    setTextSize('BFX', 35)
	setTextString('BFX', "BF X POS: "..getCharacterX(bf))
    addLuaText('BFX', true)
	
	---------------------------------------------
	makeLuaText('BFY', "BFY", 0, center, space * 3)
    setObjectCamera('BFY', 'hud')
    setTextFont('BFY', 'font')
    setTextSize('BFY', 35)
	setTextString('BFY', "BF Y POS: "..getCharacterY(bf))
    addLuaText('BFY', true)
	
	---------------------------------------------
	makeLuaText('DADX', "DADX", 0, center, space * 4)
    setObjectCamera('DADX', 'hud')
    setTextFont('DADX', 'font')
    setTextSize('DADX', 35)
	setTextString('DADX', "DAD X POS: "..getCharacterX(dad))
    addLuaText('DADX', true)
	
	---------------------------------------------
	makeLuaText('DADY', "DADY", 0, center, space * 5)
    setObjectCamera('DADY', 'hud')
    setTextFont('DADY', 'font')
    setTextSize('DADY', 35)
	setTextString('DADY', "DAD Y POS: "..getCharacterY(dad))
    addLuaText('DADY', true)
	
	---------------------------------------------
	---------------------------------------------
	makeLuaText('SPOS', "SPOS", 0, center, space * 6)
    setObjectCamera('SPOS', 'hud')
    setTextFont('SPOS', 'font')
    setTextSize('SPOS', 35)
	setTextString('SPOS', "Song Current Position: "..getSongPosition())
    addLuaText('SPOS', true)
	
	---------------------------------------------
	makeLuaText('SWidth', "SWidth", 0, center, space * 7)
    setObjectCamera('SWidth', 'hud')
    setTextFont('SWidth', 'font')
    setTextSize('SWidth', 35)
	setTextString('SWidth', "Screen width: "..getPropertyFromClass('FlxG', width))
    addLuaText('SWidth', true)

	---------------------------------------------
	makeLuaText('SHeigth', "SHeigth", 0, center, space * 8)
    setObjectCamera('SHeigth', 'hud')
    setTextFont('SHeigth', 'font')
    setTextSize('SHeigth', 35)
	setTextString('SHeigth', "Screen heigth: "..getPropertyFromClass('FlxG', heigth))
    addLuaText('SHeigth', true)

end

--[[function onUpdate(elapsed)
	songPos = getSongPosition() -- idk idc tbh
    --started = true -- abc def ghi
	setTextString('SPOS', "Song Current Position: "..songPos())
	--local currentBeat = (songPos/4000)*(curBpm/60)
end]]