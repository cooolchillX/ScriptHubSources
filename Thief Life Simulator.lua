local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Thief Life Simulator", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main Things")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Teleportation")

TPSection:NewButton("Cop Hideout", "Use To Hide From Cops", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1298.15137, 13.5669603, -211.381866, -0.0200222805, 1.05186544e-07, 0.99979955, -3.23643086e-08, 1, -1.05855769e-07, -0.99979955, -3.44772921e-08, -0.0200222805)
end)

TPSection:NewButton("Spawn", "Go To The Beginning", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1333.11633, 12.7878618, 1.69518042, 0.147497579, 2.58107171e-08, -0.989062428, -1.2325696e-08, 1, 2.42580303e-08, 0.989062428, 8.61288196e-09, 0.147497579)
end)

TPSection:NewButton("Secret Room", "Room Above Bank", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1361.40833, 36.893074, -120.892616, -0.100195184, -1.14430691e-07, 0.994967818, -7.86080623e-09, 1, 1.14217841e-07, -0.994967818, 3.6228287e-09, -0.100195184)
end)

TPSection:NewButton("Bank Vault 1", "Bank Vault TP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1400.61841, 13.555397, -97.1115265, -0.105377518, 9.01118402e-10, 0.994432271, -3.07770058e-08, 1, -4.16752632e-09, -0.994432271, -3.10448129e-08, -0.105377518)
end)

TPSection:NewButton("Bank Vault 2", "Bank Vault TP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1398.6344, 13.555397, -124.008018, 0.0184829123, -4.54137847e-08, 0.999829173, 5.20087298e-08, 1, 4.44601085e-08, -0.999829173, 5.11780911e-08, 0.0184829123)
end)

TPSection:NewButton("Pool Room", "Pool Location", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1635.3894, 15.519702, -49.4132271, -0.0104953544, -7.4152652e-08, -0.999944925, 6.36414671e-11, 1, -7.41574055e-08, 0.999944925, -8.41946179e-10, -0.0104953544)
end)

TPSection:NewButton("Warehouse", "Level 1", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2140.3562, 13.0080709, 875.549072, 0.99787575, 1.00495996e-07, -0.0651458725, -1.01969121e-07, 1, -1.92878105e-08, 0.0651458725, 2.58897064e-08, 0.99787575)
end)

TPSection:NewButton("Suburbs", "Level 2", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1512.15564, 12.6554499, 797.75354, 0.00978549756, 4.457263e-08, -0.999952137, -6.65775102e-10, 1, 4.4568246e-08, 0.999952137, 2.29620753e-10, 0.00978549756)
end)

TPSection:NewButton("Grocery", "Level 3", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2299.07324, 12.9054441, -1008.4848, -0.956731975, 9.89130644e-09, -0.290970713, 9.01862407e-09, 1, 4.3403019e-09, 0.290970713, 1.52835011e-09, -0.956731975)
end)

TPSection:NewButton("Boat Club", "Level 4", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-675.038391, -2.29323077, 673.985474, -0.0135264099, -5.14785263e-08, 0.999908507, 1.39305276e-10, 1, 5.14851202e-08, -0.999908507, 8.35701397e-10, -0.0135264099)
end)

TPSection:NewButton("Desert Base", "Level 5", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-546.950439, 2.84383702, 4154.4541, -0.792276025, -3.21519167e-08, -0.610162795, -9.01078323e-08, 1, 6.43080114e-08, 0.610162795, 1.05930148e-07, -0.792276025)
end)

TPSection:NewButton("Jewelry Store", "Level 6", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2228.53149, 12.9891672, 1380.52551, -0.999748707, -7.87460763e-10, -0.0224181153, 3.02339404e-11, 1, -3.64743897e-08, 0.0224181153, -3.64659023e-08, -0.999748707)
end)

TPSection:NewButton("Luxury Club", "Level 7", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2725.59766, 12.9734945, 1600.67737, -0.118825607, -4.62560799e-08, 0.992915154, -2.39336622e-08, 1, 4.37219114e-08, -0.992915154, -1.8568814e-08, -0.118825607)
end)

TPSection:NewButton("Exit Prison", "Go In", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2127.4751, 12.9754696, -35.8815842, 0.00043349815, -5.65275471e-08, 0.999999881, 2.94524742e-08, 1, 5.65147857e-08, -0.999999881, 2.94279729e-08, 0.00043349815)
end)

TPSection:NewButton("Into Prison", "Go Out", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2394.44873, 13.4781742, -36.054718, -0.0177762937, 0.091448538, -0.995651126, 0, 0.995808482, 0.0914629921, 0.999841988, 0.00162587303, -0.0177017823)
end)

TPSection:NewButton("WIP Boat Vault", "Money", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-465.238617, 12.9906168, 149.301651, 0.999862254, -7.37135519e-10, 0.0165969655, -6.54559296e-10, 1, 8.38469276e-08, -0.0165969655, -8.38462455e-08, 0.999862254)
end)

TPSection:NewButton("Vacation Island", "Free Vacation", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(264.056274, 54.694828, -10.1163645, 0.00624851091, 3.71516862e-08, 0.99998045, 2.82606454e-08, 1, -3.73290021e-08, -0.99998045, 2.84933446e-08, 0.00624851091)
end)

TPSection:NewButton("VIP Area", "Make sure it's unlocked first", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1185.27551, -9.5732851, -160.177811, -0.00534619251, -8.72698962e-08, 0.999985695, -4.33407372e-11, 1, 8.72709123e-08, -0.999985695, 4.23226953e-10, -0.00534619251)
end)

local Delete = Window:NewTab("Delete")
local DeleteSection = Delete:NewSection("Delete Stuff")

DeleteSection:NewButton("Unlock VIP", "Bypass", function()
    game.Workspace.Camera.AccessWalls.VIP:Destroy()
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)