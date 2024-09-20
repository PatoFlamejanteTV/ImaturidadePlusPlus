--!strict

--[[
IPP Lua Module				|| Made (mainly) for Imaturidade++
    By: PatoflamejanteTV	|| Under CC SA BY
        (aka UltimateQuack)	|| 
]]--

local IPP = {}

function IPP.createFile(contents, file)
    os.execute("echo "..contents.." >> "..file)
    --print("echo "..contents.." >> "..file")
end

return IPP