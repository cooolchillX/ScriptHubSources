local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Hotel Elephant", Duration = 4,})

--Main
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("General Player Stuff")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

--Money
local Money = Window:NewTab("Give Money")
local MoneySection = Money:NewSection("Give Yourself Money")

MoneySection:NewButton("Add 100", "Add 1 Hundred Bucks", function()
local args = {
    [1] = false,
    [2] = 100,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 1K", "Add 1 Thousand Bucks", function()
local args = {
    [1] = false,
    [2] = 1000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 10K", "Add 10 Thousand Bucks", function()
local args = {
    [1] = false,
    [2] = 10000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 100K", "Add 100 Thousand Bucks", function()
local args = {
    [1] = false,
    [2] = 100000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 1Mil", "Add 1 Million Bucks", function()
local args = {
    [1] = false,
    [2] = 1000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 10Mil", "Add 10 Million Bucks", function()
local args = {
    [1] = false,
    [2] = 10000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 100Mil", "Add 100 Million Bucks", function()
local args = {
    [1] = false,
    [2] = 100000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 1Bil", "Add 1 Billion Bucks", function()
local args = {
    [1] = false,
    [2] = 1000000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 10Bil", "Add 10 Billion Bucks", function()
local args = {
    [1] = false,
    [2] = 10000000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 100Bil", "Add 100 Billion Bucks", function()
local args = {
    [1] = false,
    [2] = 100000000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

MoneySection:NewButton("Add 1Tri", "Add 1 Trillion Bucks", function()
local args = {
    [1] = false,
    [2] = 1000000000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

--REMOVE
local Remove = Window:NewTab("Remove Money")
local RemoveSection = Remove:NewSection("Remove Your Money")

RemoveSection:NewButton("Remove 100", "Remove 100 Bucks", function()
local args = {
    [1] = false,
    [2] = -100,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 1K", "Remove 1 Thousand Bucks", function()
local args = {
    [1] = false,
    [2] = -1000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 10K", "Remove 10 Thousand Bucks", function()
local args = {
    [1] = false,
    [2] = -10000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 100K", "Remove 100 Thousand Bucks", function()
local args = {
    [1] = false,
    [2] = -100000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 1Mil", "Remove 1 Million Bucks", function()
local args = {
    [1] = false,
    [2] = -1000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 10Mil", "Remove 10 Million Bucks", function()
local args = {
    [1] = false,
    [2] = -10000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 100Mil", "Remove 100 Million Bucks", function()
local args = {
    [1] = false,
    [2] = -100000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 1Bil", "Remove 1 Billion Bucks", function()
local args = {
    [1] = false,
    [2] = -1000000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 10Bil", "Remove 10 Billion Bucks", function()
local args = {
    [1] = false,
    [2] = -10000000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 100Bil", "Remove 100 Billion Bucks", function()
local args = {
    [1] = false,
    [2] = -100000000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

RemoveSection:NewButton("Remove 1Tri", "Remove 1 Trillion Bucks", function()
local args = {
    [1] = false,
    [2] = -1000000000000,
    [3] = "Cash"
}

game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
end)

--TEAM
local Team = Window:NewTab("Team Changer")
local TeamSection = Team:NewSection("Change Teams")

TeamSection:NewButton("Hotel Guest", "Be A Guest", function()
local args = {
    [1] = "Bright yellow"
}

game:GetService("ReplicatedStorage").ChangeTeam:InvokeServer(unpack(args))
end)

TeamSection:NewButton("Waiter/Waitress", "Be A Waiter/Waitress", function()
local args = {
    [1] = "Bright red"
}

game:GetService("ReplicatedStorage").ChangeTeam:InvokeServer(unpack(args))
end)

TeamSection:NewButton("Concierge", "Be A Concierge", function()
local args = {
    [1] = "Burgundy"
}

game:GetService("ReplicatedStorage").ChangeTeam:InvokeServer(unpack(args))
end)

TeamSection:NewButton("Shop Assistant", "Be A Shop Assistant", function()
local args = {
    [1] = "Bright blue"
}

game:GetService("ReplicatedStorage").ChangeTeam:InvokeServer(unpack(args))
end)

TeamSection:NewButton("Manager", "Be A Manager", function()
local args = {
    [1] = "Bright green"
}

game:GetService("ReplicatedStorage").ChangeTeam:InvokeServer(unpack(args))
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)