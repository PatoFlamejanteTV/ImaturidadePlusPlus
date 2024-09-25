local json = {} -- DONT TOUCH THIS OR IT WILL BREAK THE SCRIPT!!

--[[
Plans -
	Allow 2, YES 2, stages for cool BETADCIU shenanigans / 0% - may or may not actually do this, we'll see
	Figure out pixel stage shenanigans / 0%
]]--

---@param variable any
---@param ifNull any
---@return any
local function checkIfNull(variable, ifNull)
	if variable == nil then
		return ifNull
	else
		return variable
	end
end

---@param character string
---@param x number
---@param y number
local function changeCharXY(character, x, y)
	setProperty(character .. 'Group.x', x)
	setProperty(character .. 'Group.y', y)
	setProperty(character .. '.x', x + getProperty(character .. '.positionArray[0]'))
	setProperty(character .. '.y', y + getProperty(character .. '.positionArray[1]'))
end

function onEvent(name, value1, value2)
	if name == 'Change The Stage' then
		local valueContents = {v1 = {}, v2 = {}}
		valueContents.v1 = Split(value1, ',')
		valueContents.v1[2] = checkIfNull(valueContents.v1[2], 'false')
		valueContents.v1[2] = (valueContents.v1[2] == 'true' and true or false)
		valueContents.v2 = Split(value2, ',')
		for i = 1, 2 do valueContents.v2[i] = checkIfNull(tonumber(valueContents.v2[i]), 0) end
		
		local oldStage, newStage = curStage, valueContents.v1[1]
		if checkFileExists('stages/' .. newStage .. '.json') then
			-- Stage Changing
			if checkFileExists('stages/' .. oldStage .. '.lua') then
				callOnLuas('onStageDestruction', {valueContents.v1[2]}, true, false)
				-- removeLuaScript('stages/' .. oldStage)
			end
			
			if getPropertyFromClass('PlayState', 'chartingMode') then
				debugPrint('Changing stage from "' .. oldStage .. '" to "' .. newStage .. '".')
			end
			
			setOnLuas('curStage', newStage)
			if checkFileExists('stages/' .. newStage .. '.lua') then
				addLuaScript('stages/' .. newStage, true)
				setOnLuas('stageOffsets', {x = valueContents.v2[1], y = valueContents.v2[2]})
				callOnLuas('onStageCreation', {}, true, false)
			end

			-- Stage Elements
			local jsonFile = json.parse(getTextFromFile('stages/' .. newStage .. '.json'))
			setProperty('defaultCamZoom', checkIfNull(jsonFile.defaultZoom, 0.9))
			if valueContents.v1[2] then setProperty('camGame.zoom', checkIfNull(jsonFile.defaultZoom, 0.9)) end
			setPropertyFromClass('PlayState', 'isPixelStage', checkIfNull(jsonFile.isPixelStage, false))
			
			changeCharXY('dad', stageOffsets.x + jsonFile.opponent[1], stageOffsets.y + jsonFile.opponent[2])
			setOnLuas('defaultOpponentX', stageOffsets.x + jsonFile.opponent[1])
			setOnLuas('defaultOpponentY', stageOffsets.y + jsonFile.opponent[2])
			changeCharXY('gf', stageOffsets.x + jsonFile.girlfriend[1], stageOffsets.y + jsonFile.girlfriend[2])
			setOnLuas('defaultGirlfriendX', stageOffsets.x + jsonFile.girlfriend[1])
			setOnLuas('defaultGirlfriendY', stageOffsets.y + jsonFile.girlfriend[2])
			changeCharXY('boyfriend', stageOffsets.x + jsonFile.boyfriend[1], stageOffsets.y + jsonFile.boyfriend[2])
			setOnLuas('defaultBoyfriendX', stageOffsets.x + jsonFile.boyfriend[1])
			setOnLuas('defaultBoyfriendY', stageOffsets.y + jsonFile.boyfriend[2])
			
			setProperty('opponentCameraOffset[0]', checkIfNull(jsonFile.camera_opponent[1], 0))
			setProperty('opponentCameraOffset[1]', checkIfNull(jsonFile.camera_opponent[2], 0))
			setProperty('girlfriendCameraOffset[0]', checkIfNull(jsonFile.camera_girlfriend[1], 0))
			setProperty('girlfriendCameraOffset[1]', checkIfNull(jsonFile.camera_girlfriend[2], 0))
			setProperty('boyfriendCameraOffset[0]', checkIfNull(jsonFile.camera_boyfriend[1], 0))
			setProperty('boyfriendCameraOffset[1]', checkIfNull(jsonFile.camera_boyfriend[2], 0))
			
			setProperty('cameraSpeed', checkIfNull(jsonFile.camera_speed, 1))
		else
			if getPropertyFromClass('PlayState', 'chartingMode') then
				debugPrint('Stage "' .. newStage .. '" doesn\'t exist.')
			end
		end
	end
end

-- Script Cacher made by Gavman22/Vyxia#8393
-- Modified by Superpowers04#3887
local precacheWarnings = false -- If warnings will be printed when a file might be or was unable to be precached
function precacheAsset(sprite,type)
	sprite = sprite:match('%s?[^,)]+')
	if((sprite:match('..') or sprite:match('%(.-%)')) and precacheWarnings) then
		debugPrint(string.format('Warning: %q looks like it might contain variables or functions, it might not precache correctly!',sprite))
	end
	sprite = sprite:match("[^'\"]+")
	local succ,err = pcall(function()
		(getfenv and getfenv() or _ENV or _G)['precache' .. type](sprite)
	end)
	if(precacheWarnings and not succ) then
		debugPrint(string.format('Error: %q was unable to be precached: %s',sprite,err))
	end
end
function precacheLuaScript(script)
	local luaFile = checkFileExists(script..'.lua') and getTextFromFile(script..'.lua') or getTextFromFile(script)
	for sprite in luaFile:gmatch('makeLuaSprite%((.-)%)[%s;]') do
		precacheAsset(sprite:match(',%s?(.+)'),'Image')
	end
	for sprite in luaFile:gmatch('makeAnimatedLuaSprite%((.-)%)[%s;]') do
		precacheAsset(sprite:match(',%s?(.+)'),'Image')
	end
	for sprite in luaFile:gmatch('loadGraphic%((.-)%)[%s;]') do
		precacheAsset(sprite,'Image')
	end
	for sound in luaFile:gmatch('playSound%((.-)%)[%s;]') do
		precacheAsset(sound,'Sound')
	end
	for sound in luaFile:gmatch('playMusic%((.-)%)[%s;]') do
		precacheAsset(sound,'Music')
	end
end

function onCreatePost()
	setOnLuas('stageOffsets', {x = 0, y = 0})
	callOnLuas('onStageCreation', {}, true, false)
	
	for i = 0, getProperty('eventNotes.length')-1 do
		if getPropertyFromGroup('eventNotes', i, 'event') == 'Change The Stage' then
			local valueContents = {v1 = {}, v2 = {}}
			valueContents.v1 = Split(getPropertyFromGroup('eventNotes', i, 'value1'), ',')
			valueContents.v2 = Split(getPropertyFromGroup('eventNotes', i, 'value2'), ',')
			
			if checkFileExists('stages/' .. valueContents.v1[1] .. '.lua') and valueContents.v1[1] ~= curStage then
				addLuaScript('stages/' .. valueContents.v1[1])
				precacheLuaScript('stages/' .. valueContents.v1[1])
				callOnLuas('precacheStage', {}, true, false) -- keeping in for other reasons
				-- removeLuaScript('stages/' .. valueContents.v1[1])
			end
		end
	end
end

---@author <Unholywanderer>
---@param s string
---@param delimiter string
---@return table.string
function Split(s, delimiter)
	local result = {}
	for match in (s..delimiter):gmatch('(.-)'..delimiter) do
		table.insert(result, stringTrim(tostring(match)))
	end
	return result
end

---@author <Mayo78>
---@param varName string
---@param valueInput any
function setOnLuas(varName, valueInput)
	-- MAYO YOU'RE THE BEST, HOLY SHIT!
	if not setOnLuas_init then --makes the var holder
		setOnLuas_init = true
		runHaxeCode('setVar("setOnLuas_varHolder", null);')
	end
	setProperty('setOnLuas_varHolder', {varName, valueInput}) --sets the temp shit
	--actually set the whatever
	runHaxeCode("game.setOnLuas(getVar('setOnLuas_varHolder')[0], getVar('setOnLuas_varHolder')[1]);")
	setProperty('setOnLuas_varHolder', nil) --go away DIE DIE DIE!!!!!!!!
	--if its onCreate then it doesnt work because the lua file wouldn't be in the luaArray yet
	if _G[varName] == nil then _G[varName] = valueInput end
end


-- SCREW, dofile mk?
local function kind_of(obj)
	if type(obj) ~= 'table' then return type(obj) end
	local i = 1
	for _ in pairs(obj) do
		if obj[i] ~= nil then i = i + 1 else return 'table' end
	end
	if i == 1 then return 'table' else return 'array' end
end

local function escape_str(s)
	local in_char	= {'\\', '"', '/', '\b', '\f', '\n', '\r', '\t'}
	local out_char = {'\\', '"', '/',	'b',	'f',	'n',	'r',	't'}
	for i, c in ipairs(in_char) do
		s = s:gsub(c, '\\' .. out_char[i])
	end
	return s
end

local function skip_delim(str, pos, delim, err_if_missing)
	pos = pos + #str:match('^%s*', pos)
	if str:sub(pos, pos) ~= delim then
		if err_if_missing then
			error('Expected ' .. delim .. ' near position ' .. pos)
		end
		return pos, false
	end
	return pos + 1, true
end

local function parse_str_val(str, pos, val)
	val = val or ''
	local early_end_error = 'End of input found while parsing string.'
	if pos > #str then error(early_end_error) end
	local c = str:sub(pos, pos)
	if c == '"'	then return val, pos + 1 end
	if c ~= '\\' then return parse_str_val(str, pos + 1, val .. c) end
	-- We must have a \ character.
	local esc_map = {b = '\b', f = '\f', n = '\n', r = '\r', t = '\t'}
	local nextc = str:sub(pos + 1, pos + 1)
	if not nextc then error(early_end_error) end
	return parse_str_val(str, pos + 2, val .. (esc_map[nextc] or nextc))
end

local function parse_num_val(str, pos)
	local num_str = str:match('^-?%d+%.?%d*[eE]?[+-]?%d*', pos)
	local val = tonumber(num_str)
	if not val then error('Error parsing number at position ' .. pos .. '.') end
	return val, pos + #num_str
end

function json.stringify(obj, as_key)
	local s = {}	-- We'll build the string as an array of strings to be concatenated.
	local kind = kind_of(obj)	-- This is 'array' if it's an array or type(obj) otherwise.
	if kind == 'array' then
		if as_key then error('Can\'t encode array as key.') end
		s[#s + 1] = '['
		for i, val in ipairs(obj) do
			if i > 1 then s[#s + 1] = ', ' end
			s[#s + 1] = json.stringify(val)
		end
		s[#s + 1] = ']'
	elseif kind == 'table' then
		if as_key then error('Can\'t encode table as key.') end
		s[#s + 1] = '{'
		for k, v in pairs(obj) do
			if #s > 1 then s[#s + 1] = ', ' end
			s[#s + 1] = json.stringify(k, true)
			s[#s + 1] = ':'
			s[#s + 1] = json.stringify(v)
		end
		s[#s + 1] = '}'
	elseif kind == 'string' then
		return '"' .. escape_str(obj) .. '"'
	elseif kind == 'number' then
		if as_key then return '"' .. tostring(obj) .. '"' end
		return tostring(obj)
	elseif kind == 'boolean' then
		return tostring(obj)
	elseif kind == 'nil' then
		return 'null'
	else
		error('Unjsonifiable type: ' .. kind .. '.')
	end
	return table.concat(s)
end

json.null = {}	-- This is a one-off table to represent the null value.

function json.parse(str, pos, end_delim)
	pos = pos or 1
	if pos > #str then error('Reached unexpected end of input.') end
	local pos = pos + #str:match('^%s*', pos)	-- Skip whitespace.
	local first = str:sub(pos, pos)
	if first == '{' then	-- Parse an object.
		local obj, key, delim_found = {}, true, true
		pos = pos + 1
		while true do
			key, pos = json.parse(str, pos, '}')
			if key == nil then return obj, pos end
			if not delim_found then error('Comma missing between object items.') end
			pos = skip_delim(str, pos, ':', true)	-- true -> error if missing.
			obj[key], pos = json.parse(str, pos)
			pos, delim_found = skip_delim(str, pos, ',')
		end
	elseif first == '[' then	-- Parse an array.
		local arr, val, delim_found = {}, true, true
		pos = pos + 1
		while true do
			val, pos = json.parse(str, pos, ']')
			if val == nil then return arr, pos end
			if not delim_found then error('Comma missing between array items.') end
			arr[#arr + 1] = val
			pos, delim_found = skip_delim(str, pos, ',')
		end
	elseif first == '"' then	-- Parse a string.
		return parse_str_val(str, pos + 1)
	elseif first == '-' or first:match('%d') then	-- Parse a number.
		return parse_num_val(str, pos)
	elseif first == end_delim then	-- End of an object or array.
		return nil, pos + 1
	else	-- Parse true, false, or null.
		local literals = {['true'] = true, ['false'] = false, ['null'] = json.null}
		for lit_str, lit_val in pairs(literals) do
			local lit_end = pos + #lit_str - 1
			if str:sub(pos, lit_end) == lit_str then return lit_val, lit_end + 1 end
		end
		local pos_info_str = 'position ' .. pos .. ': ' .. str:sub(pos, pos + 10)
		error('Invalid json syntax starting at ' .. pos_info_str)
	end
end