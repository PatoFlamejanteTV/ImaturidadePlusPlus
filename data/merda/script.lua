local windowX = 0;
local windowY = 0;


function onCreate()
    setProperty('camGame.zoom', 3)
    doTweenZoom('begin', 'camGame', '0.9', 5, 'quadOut')
end



function onUpdate(elapsed)
    if curStep >= 0 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/314)
      doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
    end
  end

  function opponentNoteHit()
    windowShake()
  end

function windowShake()
    windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
    windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
    setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-10,10))
    setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-5,5))
 end
  