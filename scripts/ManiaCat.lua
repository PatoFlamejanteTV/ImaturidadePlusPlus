-------- READ THIS NOTE! --------
-- dont steal my code you idiot ~VikryFX
-- this script free to use, but do not admit that YOU created this script
-- if you want to showcase it, do not give the link download, but give they link to my ManiaCat video

-------- CHANGE CONTROLS --------
-- this is only for keyboard controls user, for touch screen ignore this
local leftkey = 'left'
local downkey = 'down'
local upkey = 'up'
local rightkey = 'right'

-------- CHANGE SKIN --------
local skincat = 'BF'

-------- ALL AVAILABLE SKIN --------
-- Default
-- BF
-- GF
-- Custom

-------- CHANGE POSITION OR SCALE --------
local ycat = 300 -- change y position maniacat
local xcat = 0 -- change x position 
local scalecat = 0.2 -- change scale maniacat (default 0.2)

-------- PRESET YOU CAN USE FOR THE POSITION! --------
-- ATTENTION! this preset compatible if scalecat is 0.2 (except up left corner)

-- MIDDLE LEFT (default)
-- local ycat = 300
-- locat xcat = 0

-- MIDDLE RIGHT
-- local ycat = 300
-- locat xcat = 1045

-- MIDDLE UP
-- local ycat = 520
-- locat xcat = 0

-- MIDDLE BOTTOM 
-- local ycat = 585
-- locat xcat = 520

-- UP LEFT CORNER
-- local ycat = 0
-- locat xcat = 0

-- BOTTOM LEFT CORNER
-- local ycat = 585
-- locat xcat = 0

-- UP RIGHT CORNER
-- local ycat = 0
-- locat xcat = 1045

-- BOTTOM RIGHT CORNER
-- local ycat = 585
-- locat xcat = 1045

-------- THE CODE! DO NOT TOUCH IT YOU SUCH DUMB AF --------
function onUpdate()
 if skincat == 'Default' then
  makeLuaSprite('base', 'ManiaCat/default/base', xcat, ycat);
  addLuaSprite('base', true)
  setObjectCamera('base', 'other')
  scaleObject('base', scalecat, scalecat)
    if keyPressed(upkey) then
        makeLuaSprite('up', 'ManiaCat/default/up', xcat, ycat);
        setObjectCamera('up', 'other')
        scaleObject('up', scalecat, scalecat)
        addLuaSprite('up', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/default/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('up', true)
    end
    if keyPressed(downkey) then
       removeLuaSprite('base_left', true)
        makeLuaSprite('down', 'ManiaCat/default/down', xcat, ycat);
        setObjectCamera('down', 'other')
        scaleObject('down', scalecat, scalecat)
        addLuaSprite('down', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/default/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('down', true)
    end
    if keyPressed(leftkey) then
       makeLuaSprite('left', 'ManiaCat/default/left', xcat, ycat);
        setObjectCamera('left', 'other')
        scaleObject('left', scalecat, scalecat)
        addLuaSprite('left', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/default/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('left', true)
    end
    if keyPressed(rightkey) then
       makeLuaSprite('right', 'ManiaCat/default/right', xcat, ycat);
        setObjectCamera('right', 'other')
        scaleObject('right', scalecat, scalecat)
        addLuaSprite('right', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/default/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('right', true)
    end
    if keyPressed(upkey) and keyPressed(rightkey) then
        makeLuaSprite('upright', 'ManiaCat/default/upright', xcat, ycat);
        setObjectCamera('upright', 'other')
        scaleObject('upright', scalecat, scalecat)
        addLuaSprite('upright', true)
        removeLuaSprite('up', true)
        removeLuaSprite('right', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/default/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('upright', true)
    end
    if keyPressed(leftkey) and keyPressed(downkey) then
        makeLuaSprite('leftdown', 'ManiaCat/default/leftdown', xcat, ycat);
        setObjectCamera('leftdown', 'other')
        scaleObject('leftdown', scalecat, scalecat)
        addLuaSprite('leftdown', true)
        removeLuaSprite('left', true)
        removeLuaSprite('down', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/default/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('leftdown', true)
    end
    if keyPressed(leftkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(downkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(upkey) then
        removeLuaSprite('base_right', true)
    end
    if keyPressed(rightkey) then
        removeLuaSprite('base_right', true)
    end
    if keyPressed(leftkey) and keyPressed(downkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(rightkey) and keyPressed(upkey) then
        removeLuaSprite('base_right', true)
    end
  end
   if skincat == 'GF' then
  makeLuaSprite('base', 'ManiaCat/gf/base', xcat, ycat);
  addLuaSprite('base', true)
  setObjectCamera('base', 'other')
  scaleObject('base', scalecat, scalecat)
    if keyPressed(upkey) then
        makeLuaSprite('up', 'ManiaCat/gf/up', xcat, ycat);
        setObjectCamera('up', 'other')
        scaleObject('up', scalecat, scalecat)
        addLuaSprite('up', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/gf/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('up', true)
    end
    if keyPressed(downkey) then
       removeLuaSprite('base_left', true)
        makeLuaSprite('down', 'ManiaCat/gf/down', xcat, ycat);
        setObjectCamera('down', 'other')
        scaleObject('down', scalecat, scalecat)
        addLuaSprite('down', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/gf/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('down', true)
    end
    if keyPressed(leftkey) then
       makeLuaSprite('left', 'ManiaCat/gf/left', xcat, ycat);
        setObjectCamera('left', 'other')
        scaleObject('left', scalecat, scalecat)
        addLuaSprite('left', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/gf/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('left', true)
    end
    if keyPressed(rightkey) then
       makeLuaSprite('right', 'ManiaCat/gf/right', xcat, ycat);
        setObjectCamera('right', 'other')
        scaleObject('right', scalecat, scalecat)
        addLuaSprite('right', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/gf/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('right', true)
    end
    if keyPressed(upkey) and keyPressed(rightkey) then
        makeLuaSprite('upright', 'ManiaCat/gf/upright', xcat, ycat);
        setObjectCamera('upright', 'other')
        scaleObject('upright', scalecat, scalecat)
        addLuaSprite('upright', true)
        removeLuaSprite('up', true)
        removeLuaSprite('right', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/gf/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('upright', true)
    end
    if keyPressed(leftkey) and keyPressed(downkey) then
        makeLuaSprite('leftdown', 'ManiaCat/gf/leftdown', xcat, ycat);
        setObjectCamera('leftdown', 'other')
        scaleObject('leftdown', scalecat, scalecat)
        addLuaSprite('leftdown', true)
        removeLuaSprite('left', true)
        removeLuaSprite('down', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/gf/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('leftdown', true)
    end
    if keyPressed(leftkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(downkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(upkey) then
        removeLuaSprite('base_right', true)
    end
    if keyPressed(rightkey) then
        removeLuaSprite('base_right', true)
    end
    if keyPressed(leftkey) and keyPressed(downkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(rightkey) and keyPressed(upkey) then
        removeLuaSprite('base_right', true)
    end
  end
   if skincat == 'BF' then
  makeLuaSprite('base', 'ManiaCat/bf/base', xcat, ycat);
  addLuaSprite('base', true)
  setObjectCamera('base', 'other')
  scaleObject('base', scalecat, scalecat)
    if keyPressed(upkey) then
        makeLuaSprite('up', 'ManiaCat/bf/up', xcat, ycat);
        setObjectCamera('up', 'other')
        scaleObject('up', scalecat, scalecat)
        addLuaSprite('up', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/bf/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('up', true)
    end
    if keyPressed(downkey) then
       removeLuaSprite('base_left', true)
        makeLuaSprite('down', 'ManiaCat/bf/down', xcat, ycat);
        setObjectCamera('down', 'other')
        scaleObject('down', scalecat, scalecat)
        addLuaSprite('down', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/bf/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('down', true)
    end
    if keyPressed(leftkey) then
       makeLuaSprite('left', 'ManiaCat/bf/left', xcat, ycat);
        setObjectCamera('left', 'other')
        scaleObject('left', scalecat, scalecat)
        addLuaSprite('left', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/bf/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('left', true)
    end
    if keyPressed(rightkey) then
       makeLuaSprite('right', 'ManiaCat/bf/right', xcat, ycat);
        setObjectCamera('right', 'other')
        scaleObject('right', scalecat, scalecat)
        addLuaSprite('right', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/bf/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('right', true)
    end
    if keyPressed(upkey) and keyPressed(rightkey) then
        makeLuaSprite('upright', 'ManiaCat/bf/upright', xcat, ycat);
        setObjectCamera('upright', 'other')
        scaleObject('upright', scalecat, scalecat)
        addLuaSprite('upright', true)
        removeLuaSprite('up', true)
        removeLuaSprite('right', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/bf/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('upright', true)
    end
    if keyPressed(leftkey) and keyPressed(downkey) then
        makeLuaSprite('leftdown', 'ManiaCat/bf/leftdown', xcat, ycat);
        setObjectCamera('leftdown', 'other')
        scaleObject('leftdown', scalecat, scalecat)
        addLuaSprite('leftdown', true)
        removeLuaSprite('left', true)
        removeLuaSprite('down', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/bf/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('leftdown', true)
    end
    if keyPressed(leftkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(downkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(upkey) then
        removeLuaSprite('base_right', true)
    end
    if keyPressed(rightkey) then
        removeLuaSprite('base_right', true)
    end
    if keyPressed(leftkey) and keyPressed(downkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(rightkey) and keyPressed(upkey) then
        removeLuaSprite('base_right', true)
    end
   if skincat == 'Custom' then
  makeLuaSprite('base', 'ManiaCat/custom/base', xcat, ycat);
  addLuaSprite('base', true)
  setObjectCamera('base', 'other')
  scaleObject('base', scalecat, scalecat)
    if keyPressed(upkey) then
        makeLuaSprite('up', 'ManiaCat/custom/up', xcat, ycat);
        setObjectCamera('up', 'other')
        scaleObject('up', scalecat, scalecat)
        addLuaSprite('up', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/custom/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('up', true)
    end
    if keyPressed(downkey) then
       removeLuaSprite('base_left', true)
        makeLuaSprite('down', 'ManiaCat/custom/down', xcat, ycat);
        setObjectCamera('down', 'other')
        scaleObject('down', scalecat, scalecat)
        addLuaSprite('down', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/custom/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('down', true)
    end
    if keyPressed(leftkey) then
       makeLuaSprite('left', 'ManiaCat/custom/left', xcat, ycat);
        setObjectCamera('left', 'other')
        scaleObject('left', scalecat, scalecat)
        addLuaSprite('left', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/custom/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('left', true)
    end
    if keyPressed(rightkey) then
       makeLuaSprite('right', 'ManiaCat/custom/right', xcat, ycat);
        setObjectCamera('right', 'other')
        scaleObject('right', scalecat, scalecat)
        addLuaSprite('right', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/custom/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('right', true)
    end
    if keyPressed(upkey) and keyPressed(rightkey) then
        makeLuaSprite('upright', 'ManiaCat/custom/upright', xcat, ycat);
        setObjectCamera('upright', 'other')
        scaleObject('upright', scalecat, scalecat)
        addLuaSprite('upright', true)
        removeLuaSprite('up', true)
        removeLuaSprite('right', true)
    else
        makeLuaSprite('base_right', 'ManiaCat/custom/base_right', xcat, ycat);
        setObjectCamera('base_right', 'other')
        scaleObject('base_right', scalecat, scalecat)
        addLuaSprite('base_right', true)
        removeLuaSprite('upright', true)
    end
    if keyPressed(leftkey) and keyPressed(downkey) then
        makeLuaSprite('leftdown', 'ManiaCat/custom/leftdown', xcat, ycat);
        setObjectCamera('leftdown', 'other')
        scaleObject('leftdown', scalecat, scalecat)
        addLuaSprite('leftdown', true)
        removeLuaSprite('left', true)
        removeLuaSprite('down', true)
    else
        makeLuaSprite('base_left', 'ManiaCat/custom/base_left', xcat, ycat);
        setObjectCamera('base_left', 'other')
        scaleObject('base_left', scalecat, scalecat)
        addLuaSprite('base_left', true)
        removeLuaSprite('leftdown', true)
    end
    if keyPressed(leftkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(downkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(upkey) then
        removeLuaSprite('base_right', true)
    end
    if keyPressed(rightkey) then
        removeLuaSprite('base_right', true)
    end
    if keyPressed(leftkey) and keyPressed(downkey) then
        removeLuaSprite('base_left', true)
    end
    if keyPressed(rightkey) and keyPressed(upkey) then
        removeLuaSprite('base_right', true)
   end
  end
 end
end