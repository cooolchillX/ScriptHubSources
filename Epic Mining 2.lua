local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Epic Mining 2", Duration = 4,})

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Player Stuff")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Teleport To Places")

TPSection:NewButton("Spawn", "Go To Spawn", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.8524475, 8008.80176, -151.986847, -0.969872594, 0, 0.243612751, 0, 1, 0, -0.243612751, 0, -0.969872594)
end)

TPSection:NewButton("Cursed Mine", "Go To Cured Mines", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1783.14795, 8007.79883, -180.833481, 0.0467450172, 2.28230768e-08, -0.998906851, 2.29342678e-09, 1, 2.29553763e-08, 0.998906851, -3.36396933e-09, 0.0467450172)
end)

TPSection:NewButton("Sawmill", "Go To Sawmill", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-152.246902, 8009.95166, -211.284424, -0.051780697, -3.20881313e-08, -0.998658478, -1.64895244e-08, 1, -3.12762509e-08, 0.998658478, 1.48478971e-08, -0.051780697)
end)

TPSection:NewButton("Secret", "Secret Uranium??", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(292.745422, 8029.95361, -165.534225, 0.705783904, -0.106538557, 0.700370371, 0, 0.988627195, 0.150387436, -0.70842725, -0.106141031, 0.697757125)
end)

local Misc = Window:NewTab("Misc")
local MiscSection = Misc:NewSection("Extra Things")

MiscSection:NewButton("Delete Rock Boarder", "Delete Main Boarder", function()
    game.Workspace.Mountains:Destroy()
end)

MiscSection:NewButton("Delete Cursed Rock Boarder", "Delete Cursed Boarder", function()
    game.Workspace.WorldHauntedMine.Mountains:Destroy()
end)

local GameUI = Window:NewTab("Game UI")
local GameUISection = GameUI:NewSection("Forge")

GameUISection:NewButton("Open Forge UI", "Open The UI Where You Are", function()
    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118.253883, 8009.00049, -214.649384, 0.996589124, 1.04997842e-08, 0.0825235099, -9.49712486e-09, 1, -1.25425297e-08, -0.0825235099, 1.17160122e-08, 0.996589124)
    wait(0.5)
    workspace.Forge.Interact.InteractEvent:FireServer()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = position
end)

local GameUISection = GameUI:NewSection("Sawmill")

GameUISection:NewButton("Open Sawmill UI", "Open The UI Where You Are", function()
    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-170.239212, 8014.80859, -212.164581, 0.222848415, 2.17569909e-08, 0.974853098, 4.99681576e-08, 1, -3.37407933e-08, -0.974853098, 5.62306965e-08, 0.222848415)
    wait(0.5)
    workspace.Sawmill.SawbladeTrigger.Interact.InteractEvent:FireServer()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = position
end)

GameUISection:NewButton("Open Sawmill Fuel UI", "Open The UI Where You Are", function()
    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-173.347626, 8008.81348, -198.508377, 0.999888599, -2.99235587e-08, -0.0149241686, 3.07429566e-08, 1, 5.46748034e-08, 0.0149241686, -5.51275257e-08, 0.999888599)
    wait(0.5)
    workspace.Sawmill.FurnaceTrigger.Interact.InteractEvent:FireServer()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = position
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)