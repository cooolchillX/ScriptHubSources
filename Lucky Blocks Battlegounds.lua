local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "LUCKY BLOCKS Battlegrounds", Duration = 4,})

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Player Things")

MainSection:NewSlider("WalkSpeed", "Move Fast", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

--LUCKY
local Lucky = Window:NewTab("Lucky Block")
local LuckySection = Lucky:NewSection("Get Lucky Block Item")

LuckySection:NewButton("Common Block", "Add That Item Type", function()
    game:GetService("ReplicatedStorage").SpawnLuckyBlock:FireServer()
end)

LuckySection:NewButton("Super Block", "Add That Item Type", function()
    game:GetService("ReplicatedStorage").SpawnSuperBlock:FireServer()
end)

LuckySection:NewButton("Diamond Block", "Add That Item Type", function()
    game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
end)

LuckySection:NewButton("Rainbow Block", "Add That Item Type", function()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
end)

LuckySection:NewButton("Galaxy Block", "Add That Item Type", function()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
end)

LuckySection:NewButton("Void Block", "Add That Item Type", function()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
end)

local LuckySection = Lucky:NewSection("Limited Block")

LuckySection:NewButton("Lava Block", "Add That Item Type", function()
    game:GetService("ReplicatedStorage").SpawnLuckyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnLuckyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnSuperBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnSuperBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
end)

LuckySection:NewButton("Hacker Block", "Add That Item Type", function()
    game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)