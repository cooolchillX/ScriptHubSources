local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Infamy", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main Stuff")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump High", 500, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Teleport To Areas")

TPSection:NewButton("Cop Hideout", "Hide From Cops", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1068.93762, 208.956284, 206.439606, -0.983150065, 4.53912889e-08, 0.182800159, 5.60059199e-08, 1, 5.29044186e-08, -0.182800159, 6.22508765e-08, -0.983150065)
end)

TPSection:NewButton("Melee Shop", "Melee Store", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-38.6743126, 3.25000024, -86.3188019, 0.999993145, 8.61502585e-08, -0.00370316999, -8.64133725e-08, 1, -7.08919927e-08, 0.00370316999, 7.12115096e-08, 0.999993145)
end)

TPSection:NewButton("Gun Shop", "Gun Store", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-300.489349, 3.25132871, 93.9182281, -0.0146892006, -7.81641702e-08, 0.999892116, -3.21493471e-10, 1, 7.81678793e-08, -0.999892116, 8.26764879e-10, -0.0146892006)
end)

TPSection:NewButton("Bank 1", "Big Cash", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(322.054932, 3.24999928, -221.470917, 0.0129926642, 4.31123617e-08, -0.9999156, 3.5575326e-10, 1, 4.31206217e-08, 0.9999156, -9.15975018e-10, 0.0129926642)
end)

TPSection:NewButton("Bank 2", "Big Cash", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(65.4764099, 3.07645679, 317.858521, -0.0568094999, 1.40350869e-08, 0.998385012, 1.58105067e-08, 1, -1.31581492e-08, -0.998385012, 1.50374664e-08, -0.0568094999)
end)

TPSection:NewButton("Bank 3", "Big Cash", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-336.625977, 3.21249938, -108.277557, 0.987495959, 1.58681353e-08, -0.157644436, -1.20606183e-08, 1, 2.51091929e-08, 0.157644436, -2.28939356e-08, 0.987495959)
end)

TPSection:NewButton("Bank 4", "Big Cash", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-392.622681, 3.0763948, -756.278564, 0.998747349, 1.66560259e-08, 0.050037384, -1.70991044e-08, 1, 8.42688497e-09, -0.050037384, -9.27192367e-09, 0.998747349)
end)

TPSection:NewButton("Bank 5", "Big Cash", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(376.614288, 3.25000334, 243.967148, -0.999991655, -5.40018474e-09, 0.00407819962, -5.40120348e-09, 1, -2.3879243e-10, -0.00407819962, -2.60817618e-10, -0.999991655)
end)

TPSection:NewButton("The Club", "Chill Or Rob", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(431.771576, 5.27954245, 40.5648079, -0.0317152292, -2.97744016e-08, -0.999496937, 4.10080965e-08, 1, -3.10906216e-08, 0.999496937, -4.19735144e-08, -0.0317152292)
end)

TPSection:NewButton("Bunker TP", "Chill", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(230.431427, -65.9500275, 121.101776, -0.00585826486, 6.969473e-09, -0.999982834, 1.81619964e-08, 1, 6.86319312e-09, 0.999982834, -1.81214777e-08, -0.00585826486)
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)