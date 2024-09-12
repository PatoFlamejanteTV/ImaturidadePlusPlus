function onCreate()
    -- CHARACTER
    --setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-dead');
    
    -- SOUNDS/MUSICS
    setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fart'); --file goes inside sounds/ folder
    setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'fart'); --file goes inside music/ folder
    setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'fart'); --file goes inside music/ folder
end