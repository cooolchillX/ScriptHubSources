local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "The Backrooms : VR Escape", Duration = 4,})

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Usual Stuff")

MainSection:NewSlider("WalkSpeed", "Speed Up", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump High", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewButton("Infinite Yield", "Load It In", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

--MENU
local Menu = Window:NewTab("Menu")
local MenuSection = Menu:NewSection("Sprint")

MenuSection:NewToggle("Sprint", "No Shift", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

local MenuSection = Menu:NewSection("Teleports")

local MenuSection = Menu:NewSection("Floor 000")


MenuSection:NewButton("Floor 000", "TP To The Spawn", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-311.334259, 3.99999928, -956.025635, -0.999850631, -4.09887733e-08, -0.0172850825, -3.89983796e-08, 1, -1.15488071e-07, 0.0172850825, -1.14796727e-07, -0.999850631)
end)

MenuSection:NewButton("Lobby 1", "Lobby TP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-285.229584, 3.99999928, -894.427917, 0.999964952, 1.56558126e-08, 0.00837071985, -1.57210938e-08, 1, 7.73281617e-09, -0.00837071985, -7.86414223e-09, 0.999964952)
end)

MenuSection:NewButton("Lobby 2", "Lobby TP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-312.96167, 3.99999928, -896.715332, 0.999550641, -7.27086391e-10, -0.0299742855, 1.10853893e-09, 1, 1.27093767e-08, 0.0299742855, -1.27368933e-08, 0.999550641)
end)

MenuSection:NewButton("Lobby 3", "Lobby TP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-341.965088, 3.99999928, -896.148438, 0.990252316, -2.18349197e-08, -0.139285117, 2.34821265e-08, 1, 1.01827959e-08, 0.139285117, -1.33542475e-08, 0.990252316)
end)

local MenuSection = Menu:NewSection("Floor 001")


MenuSection:NewButton("Floor 001", "TP To The Other Area", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-418.925049, 3.99999928, -957.241394, -0.99985671, 1.11058682e-08, 0.0169292092, 1.13490746e-08, 1, 1.42700127e-08, -0.0169292092, 1.44600989e-08, -0.99985671)
end)

MenuSection:NewButton("Lobby 1", "Lobby TP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-392.997589, 3.99999928, -894.571289, 0.999838889, -2.18782166e-08, 0.0179505385, 2.05060147e-08, 1, 7.66275789e-08, -0.0179505385, -7.62471402e-08, 0.999838889)
end)

MenuSection:NewButton("Lobby 2", "Lobby TP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-420.222015, 3.99999928, -894.2323, 0.999412775, 1.5231393e-08, -0.0342659317, -1.29686981e-08, 1, 6.62556019e-08, 0.0342659317, -6.5772312e-08, 0.999412775)
end)

MenuSection:NewButton("Lobby 3", "Lobby TP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-448.712585, 3.99999928, -892.875244, 0.993599653, 9.89613156e-08, -0.112959042, -9.68424203e-08, 1, 2.42452227e-08, 0.112959042, -1.31508182e-08, 0.993599653)
end)

--Floor 000
local First = Window:NewTab("Floor 000")
local FirstSection = First:NewSection("Teleports")

FirstSection:NewButton("Spawn", "TP To Spawn", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-321.116608, 3.99999928, -971.941467, -0.00842359662, 0, -0.999964535, 0, 1, 0, 0.999964535, 0, -0.00842359662)
end)

FirstSection:NewButton("First Entity Sighting", "Where You See His Head", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-47.4011116, 3.99999928, -476.446777, 0.999969721, 0, -0.00778222177, 0, 1, 0, 0.00778222177, 0, 0.999969721)
end)

FirstSection:NewButton("Crowbar", "TP To Crowbar", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(337.870605, 3.99999928, -98.085022, -0.99995172, 0, -0.00982698798, 0, 1, 0, 0.00982698798, 0, -0.99995172)
end)

FirstSection:NewButton("Crowbar Door", "TP To That Escape", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(641.419434, 3.99999928, -89.3359222, 0.655409634, 0, 0.755273581, 0, 1, 0, -0.755273581, 0, 0.655409634)
end)

FirstSection:NewButton("Part 2 Door", "After Crowbar Door", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(687.685669, -47.0000114, -91.9337082, -0.0172783509, 1.05999547e-08, -0.99985069, 6.37122071e-08, 1, 9.50053103e-09, 0.99985069, -6.35385433e-08, -0.0172783509)
end)

FirstSection:NewButton("Blood Wall", "TP To Blood Wall", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(820.293091, -47.0000076, 8.74178314, -0.629724622, -5.9940839e-09, -0.776818454, -9.82369599e-08, 1, 7.19191817e-08, 0.776818454, 1.21601559e-07, -0.629724622)
end)

FirstSection:NewButton("Part 3 Door", "After Ladder", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(928.722778, 68.9377289, 132.74588, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

FirstSection:NewButton("Escape Door", "Escape", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1193.71509, 70.2464294, -171.669128, 0.999138057, 5.932338e-08, 0.0415112041, -6.00080483e-08, 1, 1.52474851e-08, -0.0415112041, -1.77253483e-08, 0.999138057)
end)

--Floor 001
local Second = Window:NewTab("Floor 001")
local SecondSection = Second:NewSection("Teleports")

SecondSection:NewButton("Spawn", "TP To Spawn", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1008.75635, 684.648743, -481.801514, 0.0180641878, 0, 0.999836802, 0, 1, 0, -0.999836802, 0, 0.0180641878)
end)

SecondSection:NewButton("Key", "TP To Door Key", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(821.980408, 684.648743, -450.106598, 0.999070525, 0, 0.0431060195, 0, 1, 0, -0.0431060195, 0, 0.999070525)
end)

SecondSection:NewButton("Key Door", "TP To The Door", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1021.20764, 684.648743, -595.002563, -0.0188691579, 4.08170031e-08, -0.999821961, 3.2254583e-08, 1, 4.02155464e-08, 0.999821961, -3.1490007e-08, -0.0188691579)
end)

SecondSection:NewButton("Code Part 1", "TP To First Code Part", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1135.92322, 669.370422, -757.099731, -0.00683913101, 8.62332783e-09, 0.999976635, -4.75115591e-08, 1, -8.94847485e-09, -0.999976635, -4.75716462e-08, -0.00683913101)
end)

SecondSection:NewButton("Code Part 2", "TP To Second Code Part", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1365.56372, 669.370422, -696.542175, -0.997656286, 2.02933204e-09, -0.0684247538, 3.76489478e-10, 1, 2.41685196e-08, 0.0684247538, 2.40861144e-08, -0.997656286)
end)

SecondSection:NewButton("Code Part 3", "TP To Third Code Part", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1199.85315, 669.370422, -372.786926, -0.999961376, -4.60692497e-08, -0.00879158266, -4.61073952e-08, 1, 4.1361532e-09, 0.00879158266, 4.54135041e-09, -0.999961376)
end)

SecondSection:NewButton("Code Door", "TP To Code Door", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1180.2052, 669.370422, -815.614563, -0.0434901454, 4.73580286e-09, 0.999053836, 2.04742605e-08, 1, -3.84901622e-09, -0.999053836, 2.02874944e-08, -0.0434901454)
end)

SecondSection:NewButton("First Entity Sighting", "TP To First Sighting", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1090.38171, 669.457825, -851.46814, -0.99999994, 7.58731531e-08, 0.000244364142, 7.58786669e-08, 1, 2.25509105e-08, -0.000244364142, 2.25694521e-08, -0.99999994)
end)

SecondSection:NewButton("Door Before Part 2", "TP To The Door Before Part 2", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1017.23004, 669.457825, -833.885315, -7.07805157e-08, -1.89883629e-08, 1, -5.20326005e-08, 1, 1.89883593e-08, -1, -5.20325969e-08, -7.07805157e-08)
end)

SecondSection:NewButton("Part 2 Door", "TP To Part 2 Door", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(969.047424, 669.433411, -832.977844, -7.07805157e-08, 2.55869033e-08, 1, 7.01101044e-08, 1, -2.55868979e-08, -1, 7.01101044e-08, -7.07805157e-08)
end)

SecondSection:NewButton("Power Box", "TP To Power Box", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(990.939819, 669.433411, -873.919617, 0.000611423457, -4.22461994e-08, -0.999999821, 1.24792043e-08, 1, -4.22385753e-08, 0.999999821, -1.24533761e-08, 0.000611423457)
end)

SecondSection:NewButton("Power Door", "TP To Power Door", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(707.902954, 669.433411, -823.5755, -0.999637723, -9.19112466e-08, -0.0269148909, -9.16991993e-08, 1, -9.11258446e-09, 0.0269148909, -6.64120936e-09, -0.999637723)
end)

SecondSection:NewButton("Part 3 Door", "TP To Part 3 Door", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(710.414307, 669.457825, -656.46875, 1, 1.30244193e-09, -0.000122070312, -1.3038346e-09, 1, -1.14093872e-08, 0.000122070312, 1.14095462e-08, 1)
end)

SecondSection:NewButton("After Vent Door", "TP To Door After Vent", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(646.900513, 669.457825, -604.165771, -0.998191118, 1.10154785e-09, 0.0601202734, -2.59206168e-09, 1, -6.13590174e-08, -0.0601202734, -6.14038598e-08, -0.998191118)
end)

SecondSection:NewButton("Escape Door", "TP To Escape Door", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(601.147034, 685.70874, -375.063232, -0.999313295, 0.00219365652, -0.0369873755, 2.32830616e-10, 0.998245955, 0.0592042133, 0.0370523669, 0.0591635592, -0.997560501)
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)