windowdAmount = 0
windowHeight = 400
windowWidth = 400
windowGraphic = 'cry_about_it'
windowTitle = 'wrong note bozo!'
function onCreate()
    	addHaxeLibrary("Sys")
	addHaxeLibrary("Application", "lime.app")
	addHaxeLibrary("Lib", "openfl")
	addHaxeLibrary("Paths")
	addHaxeLibrary("Sprite", "openfl.display")
	addHaxeLibrary("FlxSprite", "flixel")
	addHaxeLibrary("Matrix", "flixel.math")
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an POP UP!!!!! Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'popup' then
			--setPropertyFromGroup('unspawnNotes', i, 'texture', 'path to ur texture');
			 --youll have to do your own art for this note, my drawing tablet broken :C
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		end
	end
	-- the main window's shit
	saveX = getPropertyFromClass("openfl.Lib", "application.window.x")
	saveY = getPropertyFromClass("openfl.Lib", "application.window.y")
	saveWidth = getPropertyFromClass('openfl.Lib', 'application.window.width')-windowWidth
	saveHeight = getPropertyFromClass('openfl.Lib', 'application.window.height')-windowHeight
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	local garbungle='wind'
	for i=1,windowdAmount,1 do
		garbungle=garbungle..'o'
	end
	garbungle=garbungle..'ne'
	if noteType == 'popup' then
		windowdAmount = windowdAmount+1
		--debugPrint('FUCK YOU ',windowdAmount,'000')
		setPropertyFromClass("flixel.FlxG", "autoPause", false) --lol
        	runHaxeCode(garbungle..[[ = Lib.application.createWindow({
			x: 0, //i cant for the life of me change these 2 things here
			y: 128, //ditto
			width: ]]..windowWidth..[[, //window width
			height: ]]..windowHeight..[[, //window height
			title:"]]..windowTitle..[[", //title (filled in by windowTitle but u can change it here if u so please)
			borderless: false, //mario paint fly minigame
			alwaysOnTop: true //u can change this too but for what purpose
			});
		]]..garbungle..[[.x = ]]..saveX+(saveWidth*getRandomFloat(0,1))..[[;
		]]..garbungle..[[.y = ]]..saveY+(saveHeight*getRandomFloat(0,1))..[[;
    		var cock = function() { //this is the function that closes the window when it's clicked, then decrements windowamt
    			//CoolUtil.browserLoad("https://www.youtube.com/watch?v=T2v0M9agvQU");
			]]..garbungle..[[.close();
    		};
    		var gock = function() { //this is the function that decrements the windowdamount anyway
			game.callOnLuas('closedPopsNoteWindow',[]);
    		};
		var bg = new FlxSprite().loadGraphic(Paths.image("]]..windowGraphic..[["));
		var spriite = new Sprite();
    		]]..garbungle..[[.onMouseDown.removeAll();
        	]]..garbungle..[[.onMouseDown.add(cock,true);
        	]]..garbungle..[[.onClose.add(gock,true);

		var m = new Matrix();
		spriite.graphics.beginBitmapFill(bg.pixels, m);
		spriite.graphics.drawRect(0, 0, bg.pixels.width, bg.pixels.height);
		spriite.graphics.endFill();
		FlxG.mouse.useSystemCursor = true;
		]]..garbungle..[[.stage.addChild(spriite);
        ]])
	end
end
function onPause() --REMOVE THIS IF IT'S INTERFERING WITH UR CUSTOM PAUSE SCREEN
	if windowdAmount>0 then return Function_Stop else return Function_Continue end
end
function closedPopsNoteWindow()
	windowdAmount = windowdAmount-1
end
function onDestroy()
	setPropertyFromClass("flixel.FlxG", "autoPause", true)
end