local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Sizzling Simulator", Duration = 4,})

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Player Stuff")


MainSection:NewSlider("WalkSpeed", "Increase Speed", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Increase Jump Height", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewButton("Infinite Yield", "Execute Infinite Yeild", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

--MONEY
local Money = Window:NewTab("Collect and Dropoff")
local MoneySection = Money:NewSection("Main Money and Meat stuff")


MoneySection:NewButton("Collect", "It will collect the money waiting at the grill", function()
local args = {
    [1] = "Collect Grill Coins"
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end)


MoneySection:NewButton("Dropoff Meat", "Sends meat to your grill", function()
local args = {
    [1] = "Drop Off Meat"
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end)

--Teleport
local Teleport = Window:NewTab("Teleport")
local TeleportSection = Teleport:NewSection("OWN THE ZONE FIRST FOR IT TO WORK!!")
local TeleportSection = Teleport:NewSection("Cannon TP")

TeleportSection:NewButton("Zone 1", "TP to Zone 1", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 1
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Zone 2", "TP to Zone 2", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 2
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Zone 3", "TP to Zone 3", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 3
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Zone 4", "TP to Zone 4", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 4
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Zone 5", "TP to Zone 5", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 5
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Zone 6", "TP to Zone 6", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 6
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Zone 7", "TP to Zone 7", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 7
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Zone 8", "TP to Zone 8", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 8
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Zone 9", "TP to Zone 9", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 9
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Zone 10", "TP to Zone 10", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 10
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Boss Area", "TP to Boss Area", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 13
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)


TeleportSection:NewButton("Black Forest", "TP to Black Forest", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 11
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

TeleportSection:NewButton("Winter Forest", "TP to Winter Forest", function()
local args = {
    [1] = "Shoot To Area",
    [2] = 12
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

local TeleportSection = Teleport:NewSection("Force Teleport")

TeleportSection:NewButton("Zone 1", "Force Zone 1", function()
local args = {
    [1] = "Teleport Area",
    [2] = 1
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Zone 2", "Force Zone 2", function()
local args = {
    [1] = "Teleport Area",
    [2] = 2
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Zone 3", "Force Zone 3", function()
local args = {
    [1] = "Teleport Area",
    [2] = 3
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Zone 4", "Force Zone 4", function()
local args = {
    [1] = "Teleport Area",
    [2] = 4
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Zone 5", "Force Zone 5", function()
local args = {
    [1] = "Teleport Area",
    [2] = 5
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Zone 6", "Force Zone 6", function()
local args = {
    [1] = "Teleport Area",
    [2] = 6
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Zone 7", "Force Zone 7", function()
local args = {
    [1] = "Teleport Area",
    [2] = 7
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Zone 8", "Force Zone 8", function()
local args = {
    [1] = "Teleport Area",
    [2] = 8
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Zone 9", "Force Zone 9", function()
local args = {
    [1] = "Teleport Area",
    [2] = 9
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Zone 10", "Force Zone 10", function()
local args = {
    [1] = "Teleport Area",
    [2] = 10
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Boss Area", "Force Boss Area", function()
local args = {
    [1] = "Teleport Area",
    [2] = 13
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Black Forest", "Force Black Forest", function()
local args = {
    [1] = "Teleport Area",
    [2] = 11
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

TeleportSection:NewButton("Winter Forest", "Force Winter Forest", function()
local args = {
    [1] = "Teleport Area",
    [2] = 12
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

--Chest Opener
local Chest = Window:NewTab("Chest Opener")
local ChestSection = Chest:NewSection("YOU NEED TO TP TO CHEST AFTER OPENING!!")

ChestSection:NewButton("Zone 2 Chest", "Open it", function()
local args = {
    [1] = "Open Chest",
    [2] = 2
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

ChestSection:NewButton("Zone 6 Chest", "Open it", function()
local args = {
    [1] = "Open Chest",
    [2] = 3
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

ChestSection:NewButton("Zone 8 Chest", "Open it", function()
local args = {
    [1] = "Open Chest",
    [2] = 4
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

ChestSection:NewButton("Zone 9 Chest", "Open it", function()
local args = {
    [1] = "Open Chest",
    [2] = 5
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

ChestSection:NewButton("Zone 10 Chest", "Open it", function()
local args = {
    [1] = "Open Chest",
    [2] = 6
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

ChestSection:NewButton("Zone 10 Rebirth Chest", "Open it", function()
local args = {
    [1] = "Open Chest",
    [2] = 7
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

ChestSection:NewButton("VIP Chest", "Open it", function()
local args = {
    [1] = "Open Chest",
    [2] = 1
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

--Grills
local Grills = Window:NewTab("Grill auto buy/upgrade")
local GrillsSection = Grills:NewSection("Buy Grill")

GrillsSection:NewButton("Buy 1 grill", "Buy a Grill", function()
local args = {
    [1] = "Buy +1 Grill"
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

local GrillsSection = Grills:NewSection("Upgrade Grills")

GrillsSection:NewButton("Upgrade Grill 1", "Upgrades First Grill", function()
local args = {
    [1] = "Upgrade Grill",
    [2] = 1
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

GrillsSection:NewButton("Upgrade Grill 2", "Upgrades Second Grill", function()
local args = {
    [1] = "Upgrade Grill",
    [2] = 2
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

GrillsSection:NewButton("Upgrade Grill 3", "Upgrades Third Grill", function()
local args = {
    [1] = "Upgrade Grill",
    [2] = 3
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

GrillsSection:NewButton("Upgrade Grill 4", "Upgrades Forth Grill", function()
local args = {
    [1] = "Upgrade Grill",
    [2] = 4
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

GrillsSection:NewButton("Upgrade Grill 5", "Upgrades Fifth Grill", function()
local args = {
    [1] = "Upgrade Grill",
    [2] = 5
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

--Area
local Area = Window:NewTab("Buy Area")
local AreaSection = Area:NewSection("Buy Area")

AreaSection:NewButton("Buy Area 2", "Buy Second Area", function()
local args = {
    [1] = "Purchase Area",
    [2] = 2
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Area 3", "Buy Third Area", function()
local args = {
    [1] = "Purchase Area",
    [2] = 3
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Area 4", "Buy Forth Area", function()
local args = {
    [1] = "Purchase Area",
    [2] = 4
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Area 5", "Buy Fifth Area", function()
local args = {
    [1] = "Purchase Area",
    [2] = 5
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Area 6", "Buy Sixth Area", function()
local args = {
    [1] = "Purchase Area",
    [2] = 6
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Area 7", "Buy Seventh Area", function()
local args = {
    [1] = "Purchase Area",
    [2] = 7
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Area 8", "Buy Eight Area", function()
local args = {
    [1] = "Purchase Area",
    [2] = 8
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Area 9", "Buy Ninth Area", function()
local args = {
    [1] = "Purchase Area",
    [2] = 9
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Area 10", "Buy Tenth Area", function()
local args = {
    [1] = "Purchase Area",
    [2] = 10
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Black Forest", "Buy Black Forest", function()
local args = {
    [1] = "Purchase Area",
    [2] = 11
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

AreaSection:NewButton("Buy Winter Forest", "Buy Winter Forest", function()
local args = {
    [1] = "Purchase Area",
    [2] = 12
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

--Rebrith
local Rebirth = Window:NewTab("Auto Rebirth")
local RebirthSection = Rebirth:NewSection("Auto rebirth x3 and x5 are more expencive")

RebirthSection:NewButton("Auto Rebirth x1", "Rebirth 1 Time", function()
local args = {
    [1] = "Rebirth",
    [2] = 1
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

RebirthSection:NewButton("Auto Rebirth x3", "Rebirth 3 Times", function()
local args = {
    [1] = "Rebirth",
    [2] = 3
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

RebirthSection:NewButton("Auto Rebirth x5", "Rebirth 5 Times", function()
local args = {
    [1] = "Rebirth",
    [2] = 5
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)