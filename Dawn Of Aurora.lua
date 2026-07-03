local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Dawn Of Aurora", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Normal Player Things")

--MAIN
MainSection:NewSlider("WalkSpeed", "Move Fast", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump High", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewButton("Infinite Yield", "Load It", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

--TELEPORT
local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Dealers")

TPSection:NewButton("Dealer 1", "Go To Dealer Near Club", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1083.67297, 116.777786, -3042.33228, 0.9972381, -4.77176743e-09, -0.0742706284, 1.04567066e-08, 1, 7.61547128e-08, 0.0742706284, -7.67210082e-08, 0.9972381)
end)

TPSection:NewButton("Dealer 2", "Near End Of World", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(568.666504, 110.777931, -3997.07764, 0.604562759, -5.20275876e-08, 0.796557486, -5.10851006e-09, 1, 6.91927511e-08, -0.796557486, -4.59005811e-08, 0.604562759)
end)

TPSection:NewButton("Dealer 3", "Inside F.E.A.R Building", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-602.181091, 108.771294, -1635.18494, -0.185900852, 6.61594797e-08, -0.982568502, 3.56264955e-08, 1, 6.05927042e-08, 0.982568502, -2.37412383e-08, -0.185900852)
end)

local TPSection = TP:NewSection("General Places")

TPSection:NewButton("Criminal Hideout", "Also A Dealer", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(851.790955, 50.2587204, -483.091309, -0.602427423, 1.99248138e-08, 0.798173666, 3.37961039e-12, 1, -2.49604533e-08, -0.798173666, -1.50341641e-08, -0.602427423)
end)

TPSection:NewButton("Rust Town", "Spawn Area", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(490.893372, 50.3999901, -517.802673, -0.68599838, -8.28108213e-08, -0.727603078, -6.35451727e-08, 1, -5.39015517e-08, 0.727603078, 9.25928489e-09, -0.68599838)
end)

TPSection:NewButton("Mine", "The Mine", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1104.44153, -42.4096527, 267.137756, 0.988033056, 1.4784189e-08, -0.154242098, -5.32930033e-10, 1, 9.24367356e-08, 0.154242098, -9.12483529e-08, 0.988033056)
end)

TPSection:NewButton("Down Town", "Down Town Area", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-418.350861, 25.2070751, 161.379166, 0.999390364, -7.2006145e-08, -0.0349135846, 7.38961816e-08, 1, 5.28444346e-08, 0.0349135846, -5.53921993e-08, 0.999390364)
end)

TPSection:NewButton("Toxic Marsh", "TP To Toxic Marsh", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-197.905853, 7.21920204, -468.916656, 0.999269366, 3.49769635e-08, 0.0382198058, -3.27444525e-08, 1, -5.90383742e-08, -0.0382198058, 5.77437511e-08, 0.999269366)
end)

TPSection:NewButton("Oasis", "TP To The Oasis", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(304.589417, 38.9999924, 739.401062, 0.0632968917, 3.30296457e-10, -0.997994721, 1.26408324e-08, 1, 1.13269316e-09, 0.997994721, -1.26871802e-08, 0.0632968917)
end)

TPSection:NewButton("Hover punk Land", "Hover Punk Area", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2028.90955, 8.99999905, 314.218811, -0.998957515, 2.26170283e-08, -0.0456498042, 1.93620622e-08, 1, 7.17451414e-08, 0.0456498042, 7.078647e-08, -0.998957515)
end)

TPSection:NewButton("Oil Refinery", "TP To The Refinery", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1011.83868, 25.2067299, 1117.23364, -0.772775352, 2.00063788e-08, -0.634679615, 7.67444632e-08, 1, -6.19207725e-08, 0.634679615, -9.65589919e-08, -0.772775352)
end)

TPSection:NewButton("Tech Facility", "TP To The Facility", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1412.76355, 74.124649, 110.834297, 0.999869406, -1.6435898e-08, -0.0161595829, 1.81814617e-08, 1, 1.07873383e-07, 0.0161595829, -1.08153102e-07, 0.999869406)
end)

TPSection:NewButton("F.E.A.R", "F.E.A.R Building", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-408.216583, 132.79924, -1412.8573, 0.99999398, -1.0089343e-07, -0.00346610323, 1.01062646e-07, 1, 4.86449565e-08, 0.00346610323, -4.89949592e-08, 0.99999398)
end)

local TPSection = TP:NewSection("Crime Areas")

TPSection:NewButton("Club Hive", "TP To The Club", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-817.731689, 146.765076, -2976.82886, 0.810061157, -8.85891396e-08, 0.586345434, 8.66267627e-08, 1, 3.14083941e-08, -0.586345434, 2.53504844e-08, 0.810061157)
end)

TPSection:NewButton("Bank Of Venezia", "TP To The Bank", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-917.574158, 115.770805, -3496.96265, 0.846931994, 1.91594154e-08, 0.531701207, -1.92528571e-08, 1, -5.36683586e-09, -0.531701207, -5.69142289e-09, 0.846931994)
end)

TPSection:NewButton("Bank Of Aurora", "TP To The Bank", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(675.634827, 147.358459, -3220.15771, -0.0191897377, 3.98740525e-08, -0.999815881, -1.63798539e-08, 1, 4.01957791e-08, 0.999815881, 1.71481851e-08, -0.0191897377)
end)

TPSection:NewButton("HEIST ESCAPE!!", "Escape Your Current Heist", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-916.440308, 326.267181, -2751.99854, 0.903316736, -1.18171062e-09, -0.428974241, 4.13436005e-08, 1, 8.43049577e-08, 0.428974241, -9.38894189e-08, 0.903316736)
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)