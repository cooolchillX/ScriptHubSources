local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "3008", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Things")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewToggle("Loop Walkspeed", "Loop Speed", function(state)
    if state then
        a = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        i = true
        while wait() do
            if i == true then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
            elseif i == false then
                break
            end
        end
    else
        i = false
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

MainSection:NewToggle("Loop JumpPower", "Loop Jump Height", function(state)
    if state then
        a = game.Players.LocalPlayer.Character.Humanoid.JumpPower
        i = true
        while wait() do
            if i == true then
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
            elseif i == false then
                break
            end
        end
    else
        i = false
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

local Extras = Window:NewTab("Extras")
local ExtrasSection = Extras:NewSection("Extra Things You May Like")

ExtrasSection:NewButton("Disable Fall Damage", "Disable It For Good", function()
    game.Players.LocalPlayer.Character.FallDamage:Destroy()
end)

ExtrasSection:NewToggle("Disable Fog", "No Fog", function(state)
    if state then
        local lighting = game:GetService("Lighting")
        lighting.FogEnd = 100000
    else
        local lighting = game:GetService("Lighting")
        lighting.FogEnd = 1000
    end
end)

ExtrasSection:NewToggle("FullBright", "Toggle Brightness", function(state)
    if state then
        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = false
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
        lighting.Brightness = 5
        lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = true
        lighting.Ambient = Color3.fromRGB(128, 128, 128)
        lighting.Brightness = 1
        lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end
end)

local TP = Window:NewTab("Waypoint TP")
local TPSection = TP:NewSection("Set A Game Waypoint Too For Better")
local TPSection = TP:NewSection("Waypoint 1")

TPSection:NewButton("Set Waypoint 1", "Tp Test", function()
    local a = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    local point1 = Instance.new("Part")
    point1.Name = "Point1"
    point1.Size = Vector3.new(1, 1, 1)
    point1.Position = a
    point1.Anchored = true
    point1.Color = Color3.new(1, 1, 1)
    point1.CanCollide = false
    point1.Parent = workspace.GameObjects.Physical.Map
end)

TPSection:NewButton("TP To Waypoint 1", "Tp", function()
    local a = workspace.GameObjects.Physical.Map.Point1.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
end)

TPSection:NewButton("Delete Waypoint 1", "Remove", function()
    workspace.GameObjects.Physical.Map.Point1:Destroy()
end)

local TPSection = TP:NewSection("Waypoint 2")

TPSection:NewButton("Set Waypoint 2", "Tp Test", function()
    local a = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    local point2 = Instance.new("Part")
    point2.Name = "Point2"
    point2.Size = Vector3.new(1, 1, 1)
    point2.Position = a
    point2.Anchored = true
    point2.Color = Color3.new(1, 1, 1)
    point2.CanCollide = false
    point2.Parent = workspace.GameObjects.Physical.Map
end)

TPSection:NewButton("TP To Waypoint 2", "Tp", function()
    local a = workspace.GameObjects.Physical.Map.Point2.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
end)

TPSection:NewButton("Delete Waypoint 2", "Remove", function()
    workspace.GameObjects.Physical.Map.Point2:Destroy()
end)

local TPSection = TP:NewSection("Waypoint 3")

TPSection:NewButton("Set Waypoint 3", "Tp Test", function()
    local a = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    local point3 = Instance.new("Part")
    point3.Name = "Point3"
    point3.Size = Vector3.new(1, 1, 1)
    point3.Position = a
    point3.Anchored = true
    point3.Color = Color3.new(1, 1, 1)
    point3.CanCollide = false
    point3.Parent = workspace.GameObjects.Physical.Map
end)

TPSection:NewButton("TP To Waypoint 3", "Tp", function()
    local a = workspace.GameObjects.Physical.Map.Point3.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
end)

TPSection:NewButton("Delete Waypoint 3", "Remove", function()
    workspace.GameObjects.Physical.Map.Point3:Destroy()
end)

local TPSection = TP:NewSection("Waypoint 4")

TPSection:NewButton("Set Waypoint 4", "Tp Test", function()
    local a = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    local point4 = Instance.new("Part")
    point4.Name = "Point4"
    point4.Size = Vector3.new(1, 1, 1)
    point4.Position = a
    point4.Anchored = true
    point4.Color = Color3.new(1, 1, 1)
    point4.CanCollide = false
    point4.Parent = workspace.GameObjects.Physical.Map
end)

TPSection:NewButton("TP To Waypoint 4", "Tp", function()
    local a = workspace.GameObjects.Physical.Map.Point4.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
end)

TPSection:NewButton("Delete Waypoint 4", "Remove", function()
    workspace.GameObjects.Physical.Map.Point4:Destroy()
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)