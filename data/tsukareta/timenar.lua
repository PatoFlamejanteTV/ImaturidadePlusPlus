--function onCreatePost()setProperty('timeBar.color', getColorFromHex('c10000'))end
function onCreate()
	addChromaticAbberationEffect('camHUD', 0.008)
	addChromaticAbberationEffect('camGAME', 0.008)
end