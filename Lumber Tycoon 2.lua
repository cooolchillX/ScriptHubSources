local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Lumber Tycoon 2", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Usual Stuff")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump High", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Teleport To Areas")

TPSection:NewButton("Spawn TP", "Spawn Location", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.646378, 2.99999928, 61.8828697, 0.0136962961, -7.45498312e-08, -0.999906182, 1.9321908e-10, 1, -7.45541797e-08, 0.999906182, 8.27915181e-10, 0.0136962961)
end)

TPSection:NewButton("Cherry Meadows", "TP To The Cherries", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(216.855087, 59.8000755, 1284.26941, -0.859824836, 1.81274604e-08, -0.510589063, -5.02498931e-09, 1, 4.39650449e-08, 0.510589063, 4.03679437e-08, -0.859824836)
end)

TPSection:NewButton("Fancy Furnishings", "Quality Stuff", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(491.159912, 2.99999928, -1700.0929, 0.999824464, -2.18043059e-08, -0.0187373925, 2.19528005e-08, 1, 7.71928477e-09, 0.0187373925, -8.12926793e-09, 0.999824464)
end)

TPSection:NewButton("Boxed Cars", "Cars Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(509.775848, 2.99999928, -1476.91809, -0.998929262, 2.27208652e-08, -0.0462634228, 2.64229048e-08, 1, -7.9409368e-08, 0.0462634228, -8.0546755e-08, -0.998929262)
end)

TPSection:NewButton("Forest Shop", "Get Dem Bombs", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(242.827972, 7.60371161, -2538.18091, 0.265091926, 2.19973906e-08, -0.964223146, -2.15195115e-08, 1, 1.68972729e-08, 0.964223146, 1.62702811e-08, 0.265091926)
end)

TPSection:NewButton("Swamp", "Gold And Zombie Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1253.63098, 142.942551, -674.996826, 0.999932826, 4.99972286e-10, -0.0115892468, 1.40671776e-13, 1, 4.31531859e-08, 0.0115892468, -4.31502905e-08, 0.999932826)
end)

TPSection:NewButton("Memorial Zone", "Glow Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1127.11304, 1.10021734, -944.704224, 0.0496120006, -9.14538631e-08, -0.998768568, 7.12900095e-09, 1, -9.1212506e-08, 0.998768568, -2.59498734e-09, 0.0496120006)
end)

TPSection:NewButton("Plains", "Walnut Wood There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(106.724022, 3.19999933, -1196.89893, 0.999932706, 1.37438616e-09, -0.0116002429, -2.91384278e-12, 1, 1.18227909e-07, 0.0116002429, -1.18219923e-07, 0.999932706)
end)

TPSection:NewButton("Volcano", "Lava Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1567.18213, 622.999878, 1072.94531, 0.623577654, -1.85064035e-08, -0.781761408, -3.5630709e-08, 1, -5.20937924e-08, 0.781761408, 6.03392394e-08, 0.623577654)
end)

TPSection:NewButton("Mountain", "Birch Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1240.42908, 295.001129, 938.092163, 0.45394665, -5.20040899e-08, -0.891028881, 6.94754609e-09, 1, -5.48245715e-08, 0.891028881, 1.86969658e-08, 0.45394665)
end)

TPSection:NewButton("Snowy", "Fir And Pine Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(899.69342, 59.7999458, 1435.60876, -0.925687432, 3.4033981e-08, -0.378289282, 1.1031146e-09, 1, 8.72687735e-08, 0.378289282, 8.03663056e-08, -0.925687432)
end)

TPSection:NewButton("Snowy Peak", "Ice Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1459.67578, 412.365753, 3234.12988, 0.993814945, -3.13080371e-08, 0.111048788, 3.12628643e-08, 1, 2.14802154e-09, -0.111048788, 1.33696731e-09, 0.993814945)
end)

TPSection:NewButton("Palm Island 1", "Palm Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2583.59985, -5.89998674, 0.35540837, 0.0854702666, -1.00938458e-07, -0.996340692, 6.66282007e-09, 1, -1.00737608e-07, 0.996340692, 1.97163152e-09, 0.0854702666)
end)

TPSection:NewButton("Palm Island 2", "Palm Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1928.13965, -5.90000296, -1499.23218, -0.0503100231, 1.01557539e-07, -0.99873364, -3.03107928e-14, 1, 1.01686311e-07, 0.99873364, 5.11587084e-09, -0.0503100231)
end)

TPSection:NewButton("Palm Island 3", "Palm Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4297.91357, -5.90000296, -1805.5553, 0.0083310185, -9.14825549e-08, -0.99996531, 1.2761262e-14, 1, -9.1485731e-08, 0.99996531, 7.62156505e-10, 0.0083310185)
end)

TPSection:NewButton("Koa Island", "Koa Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4606.27002, 3.00058985, 95.6058273, -0.00831273291, -5.71795233e-09, -0.999965429, -1.54041208e-14, 1, -5.71814995e-09, 0.999965429, -4.7518052e-11, -0.00831273291)
end)

TPSection:NewButton("Painting Shop", "Paintings", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5238.24854, -166.000031, 720.017151, -3.23439526e-05, 6.740472e-08, -1, 5.63197347e-08, 1, 6.7402901e-08, 1, -5.63175533e-08, -3.23439526e-05)
end)

TPSection:NewButton("Cave Wood", "Blue Wood", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3375.33911, -225.800171, 462.63269, 0.0426493883, 7.94325743e-08, 0.999090075, 4.06939771e-09, 1, -7.96786281e-08, -0.999090075, 7.46393969e-09, 0.0426493883)
end)

TPSection:NewButton("Links Logic", "Need The Logic", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4599.18018, 7.00084257, -761.895996, 0.937948644, 1.92265599e-08, -0.346774191, -1.58634901e-08, 1, 1.25367485e-08, 0.346774191, -6.25777696e-09, 0.937948644)
end)

TPSection:NewButton("Strange Man", "Golden Blueprint", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1070.82935, 16.7995968, 1134.95972, 0.233069465, 6.00492989e-10, 0.972460091, 1.08323572e-09, 1, -8.77117934e-10, -0.972460091, 1.25783295e-09, 0.233069465)
end)

local Misc = Window:NewTab("Misc")
local MiscSection = Misc:NewSection("Misc Stuff")

MiscSection:NewButton("Remove Water", "Delete The Ocean", function()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Workspace.Water.Water:Destroy()
    game.Players.LocalPlayer.PlayerGui.UnderwaterOverlay:Destroy()
end)

MiscSection:NewButton("Remove Boulder", "Get Rid Of Them", function()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
    workspace.Region_Snow.PartSpawner.Boulder:Destroy()
end)

MiscSection:NewButton("No Furnace", "Easy Wood Selling", function()
    workspace.Stores.WoodRUs.Furnace:Destroy()
    workspace.Stores.WoodRUs.Furnace:Destroy()
end)

MiscSection:NewButton("Push Swamp Rock Bridge Attempt", "Attempt To Push It Down", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1673.7417, 399.595428, 740.901001, 0.301555753, 0.0311838761, -0.952938497, 0, 0.999465108, 0.032706406, 0.953448594, -0.00986280479, 0.301394403)
end)

MiscSection:NewButton("Disable Volcano Boulder Spawn", "No Balls", function()
    workspace.Region_Volcano.PartSpawner:Destroy()
end)

MiscSection:NewButton("Teleport Green Box To You", "Your success has been noted", function()
    i = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    workspace.Region_Volcano.VolcanoWin.CFrame = i
end)

MiscSection:NewButton("Ferry Timer", "Ferry Time", function()
    local function sendNotificationWithValue()
        local timeToDeparture = workspace.Ferry.TimeToDeparture.Value
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Time To Departure",
            Text = "The time to departure is: " .. tostring(timeToDeparture),
            Duration = 5
        })
    end

    sendNotificationWithValue()
end)

MiscSection:NewButton("Bridge Timer", "Bridge Time", function()
    local function sendNotificationWithValue()
        local downTimeValue = workspace.Bridge.DownTime.Value
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Bridge Down Time",
            Text = "The bridge down time is: " .. tostring(downTimeValue),
            Duration = 5
        })
    end

    sendNotificationWithValue()
end)

MiscSection:NewButton("Delete Snow In Snowy", "Find Loose Wood", function()
    workspace.Region_Snow.Snow:Destroy()
    workspace.Region_Snow.Snow:Destroy()
    workspace.Region_Snow.Snow:Destroy()
    workspace.Region_Snow.Snow:Destroy()
    workspace.Region_Snow.Snow:Destroy()
    workspace.Region_Snow.Snow:Destroy()
    workspace.Region_Snow.Snow:Destroy()
end)

MiscSection:NewButton("Clear WoodRUs Walls", "Easy Selling Again", function()
    workspace.Stores.WoodRUs.Parts:Destroy()

    local newBrick = Instance.new("Part")
    newBrick.Size = Vector3.new(80, 2, 60)
    newBrick.Position = Vector3.new(300, -4, 47)
    newBrick.Color = Color3.new(1, 1, 1)
    newBrick.Parent = game.Workspace
    newBrick.Name = "FloorPart"
    newBrick.Anchored = true
    newBrick.Material = "Plaster"

    local newBrick2 = Instance.new("Part")
    newBrick2.Size = Vector3.new(30, 2, 12)
    newBrick2.Position = Vector3.new(325, -4, 83)
    newBrick2.Color = Color3.new(0, 1, 0)
    newBrick2.Parent = game.Workspace
    newBrick2.Name = "SellPart"
    newBrick2.Anchored = true
    newBrick2.Material = "Plaster"
end)

MiscSection:NewButton("Dark Theme UI", "Better For Eyes", function()
    game:GetService("Players").LocalPlayer.PlayerGui.MoneyDisplayGui.Text.TextColor3 = Color3.new(1, 1, 1)
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.Menu.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.Menu.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.LoadSaveGUI.SlotInfo.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.LoadSaveGUI.SlotInfo.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.LoadSaveGUI.SlotList.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.LoadSaveGUI.SlotList.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.NoticeGUI.Notice.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.NoticeGUI.Notice.Main.Aux.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.NoticeGUI.Notice.Main.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.NoticeGUI.Notice.Main.TextLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.LoadSaveGUI.OverwriteConfirm.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.LoadSaveGUI.DeleteConfirm.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.LoadSaveGUI.Progress.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.SettingsGUI.Settings.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.SettingsGUI.Settings.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.SettingsGUI.Settings.Main.PlayerList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.SettingsGUI.Settings.Main.SettingsList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.Menu.Main.MenuItems.BuyMoney.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.Menu.Main.MenuItems.Changelog.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.Menu.Main.MenuItems.Credits.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.Menu.Main.MenuItems.Donate.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.Menu.Main.MenuItems.SaveLoad.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.MenuGUI.Menu.Main.MenuItems.Settings.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.WireDraggingGUI.Back.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.WireDraggingGUI.Confirm.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.WireDraggingGUI.Finalize.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.VehicleControl.TouchLightsToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.StructureDraggingGUI.Confirm.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.StructureDraggingGUI.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.StructureDraggingGUI.Rotate.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.StructureDraggingGUI.Turn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.ConfirmPurchase.Cost.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.ConfirmPurchase.Purchase.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.ConfirmPurchase.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.SelectPurchase.Cost.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.SelectPurchase.Left.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.SelectPurchase.Purchase.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.SelectPurchase.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.SelectPurchase.Right.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.PropertyPurchasingGUI.SelectPurchase.Rotate.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.OnboardingGUI.Onboarding.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.OnboardingGUI.Onboarding.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.ModerateGUI.Moderate.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.ModerateGUI.Moderate.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.ItemInfoGUI.Info.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.ItemInfoGUI.Info.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    workspace.Dragger.Color = Color3.new(1, 0, 0)
    game:GetService("Players").LocalPlayer.PlayerGui.InteractionGUI.Prompt.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.DonateGUI.Donate.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.DonateGUI.Donate.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.DonateGUI.Donate.Main.PlayerList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.CreditsGUI.Credits.Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.CreditsGUI.Credits.Quit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.CreditsGUI.Credits.Main.NextPage.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    game:GetService("Players").LocalPlayer.PlayerGui.CreditsGUI.Credits.Main.PreviousPage.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)

workspace.Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text = "COOOLCHILL_X HUB ON TOP!!!!"
workspace.Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
workspace.Stores.WoodRUs.Parts.PREMIUMSELECTION.Color = Color3.new(0, 0, 0)
workspace.Stores.WoodRUs.Parts.PREMIUMSELECTION.Material = "Plaster"