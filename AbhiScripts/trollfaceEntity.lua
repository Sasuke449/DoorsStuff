-- Run this script ingame in the game then press T to spawn trollface, have fun :)


-- Some Services
local UserInputService = game:GetService("UserInputService")


local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sasuke449/DoorsStuff/main/Doors%20Entity%20Spawner/Source.lua"))()


local entity = nil

local function createEntity() 
   entity = Creator.createEntity({
        CustomName = "TrollFace",
        Model = "https://github.com/Sasuke449/DoorsStuff/blob/main/Doors%20Entity%20Spawner/Models/trollface.rbxm?raw=true",
        Speed = 100,
        DelayTime = 3,
        HeightOffset = 0,
        CanKill = true,
        KillRange = 10,
        BreakLights = false,
        BackwardsMovement = true,
        FlickerLights = {
            true, -- Enabled/Disabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 1,
            Max = 3,
            WaitTime = 2,
        },
        CamShake = {
            true, -- Enabled/Disabled
            {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            false, -- Enabled/Disabled
            {
                Image1 = "rbxassetid://10483855823", -- Image1 url
                Image2 = "rbxassetid://10483999903", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled/Disabled
                    Color3.fromRGB(255, 255, 255), -- Color
                },
                Tease = {
                    true, -- Enabled/Disabled
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"Oh no", "You died to...", "Troll", "*Sniff balls*"},
    })
end


local function onInputEnded(inputObject, gameProcessedEvent)
	if gameProcessedEvent then return end
	if inputObject.UserInputType == Enum.UserInputType.Keyboard and inputObject.KeyCode.Name == "T" then
        print("Spawning TrollFace")
        createEntity()
		Creator.runEntity(entity)
	end
end

UserInputService.InputEnded:Connect(onInputEnded)