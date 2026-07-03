local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Prison Life", Duration = 4,})

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Player Stuff")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

--Team Switcher
local Team = Window:NewTab("Team Switcher")
local TeamSection = Team:NewSection("Choose The Team You Want")

TeamSection:NewButton("Inmate", "Become a Inmate", function()
local args = {
    [1] = "Bright orange"
}

workspace.Remote.TeamEvent:FireServer(unpack(args))

end)

TeamSection:NewButton("Guard", "Become a Guard", function()
local args = {
    [1] = "Bright blue"
}

workspace.Remote.TeamEvent:FireServer(unpack(args))

end)

TeamSection:NewButton("Go To Lobby", "Enter Lobby", function()
local args = {
    [1] = "Medium stone grey"
}

workspace.Remote.TeamEvent:FireServer(unpack(args))

end)

local TeamSection = Team:NewSection("Must Be Inmate To Become Criminal")

TeamSection:NewButton("Criminal", "Become a Criminal", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-917.975708, 95.1272888, 2132.09644, 0.0909767598, 0, -0.995853007, 0, 1, 0, 0.995853007, 0, 0.0909767598)
end)

local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Teleportation")

TPSection:NewButton("Yard", "TP To Yard", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(772.434387, 97.9999237, 2471.65015, -0.997920394, 0, 0.0644585416, 0, 1, 0, -0.0644585416, 0, -0.997920394)
end)

TPSection:NewButton("Cafeteria", "TP To Cafeteria", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(925.913452, 99.9899368, 2289.01318, 0.998939872, -6.4419325e-08, 0.0460340939, 6.73016274e-08, 1, -6.10625079e-08, -0.0460340939, 6.40959428e-08, 0.998939872)
end)

TPSection:NewButton("Kitchen", "TP To Kitchen", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(910.842834, 99.9899368, 2233.03052, -0.99012512, 0, -0.140186608, 0, 1, 0, 0.140186608, 0, -0.99012512)
end)

TPSection:NewButton("Armory", "TP To Armory", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(834.955139, 99.9899826, 2279.59814, -0.997715294, -1.10368056e-07, 0.0675586388, -1.092465e-07, 1, 2.0295742e-08, -0.0675586388, 1.28688278e-08, -0.997715294)
end)

TPSection:NewButton("Outside Prison", "TP Outside Of Prison", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(452.534454, 98.039917, 2217.00171, 0.0288565923, 0, -0.999583542, 0, 1, 0, 0.999583542, 0, 0.0288565923)
end)

TPSection:NewButton("Cmininal Base", "TP To Criminal Base", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-942.329956, 94.1287613, 2056.04321, -0.0294566453, 0, -0.999566078, 0, 1, 0, 0.999566078, 0, -0.0294566453)
end)

--MISC
local Misc = Window:NewTab("Misc")
local MiscSection = Misc:NewSection("Destroy Items And Stuff")

MiscSection:NewButton("Remove Doors", "Delete The Doors", function()
    game.Workspace.Doors:Destroy()
end)

MiscSection:NewButton("Remove Gates", "Deletes The Gates", function()
    game.Workspace.Prison_Fences:Destroy()
end)

MiscSection:NewButton("Delete Boundary", "No Limits", function()
    game.Workspace.BOUNDARY:Destroy()
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)