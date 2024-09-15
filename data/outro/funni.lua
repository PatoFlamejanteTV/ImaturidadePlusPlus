function onCreate()
	addHaxeLibrary('Application', 'lime.app')
    runHaxeCode([[Application.current.window.alert('WARNING: At the beat drop, you PC will gonna SHUTDOWN. Close the game window if you odnt want this, click "OK" to proceed.', '...');]]) 
end
function onStepHit()
	addHaxeLibrary('Application', 'lime.app')
	runHaxeCode([[Application.current.window.alert('WARNING: At the beat drop, you PC will gonna SHUTDOWN. Close the game window if you odnt want this, click "OK" to proceed.', '...');]]) 

	if curStep == "560" then
		os.execute("msg * hi!")
	end
end