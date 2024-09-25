function onCreate()
makeAnimatedLuaSprite('task', 'task-gif', 900, 100)
addAnimationByPrefix('task', 'task-gif', 'task-gif idle', 24, true)
--setLuaSpriteScrollFactor('task-gif', 1, 1)
addLuaSprite('task-gif', false)
close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end