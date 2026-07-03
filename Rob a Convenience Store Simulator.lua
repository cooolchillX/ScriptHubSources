local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Rob a Convenience Store Simulator", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Player Stuff")

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

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("Esp For Things")

ESPSection:NewToggle("Guard ESP", "See The Guard At All Times", function(state)
    if state then
        local Head = workspace.Guard.Head
        local HumanoidRootPart = workspace.Guard.HumanoidRootPart
        local LeftArm = workspace.Guard["Left Arm"]
        local LeftLeg = workspace.Guard["Left Leg"]
        local RightArm = workspace.Guard["Right Arm"]
        local RightLeg = workspace.Guard["Right Leg"]
        local Torso = workspace.Guard.Torso

        local highlight1 = Instance.new("Highlight")
        highlight1.FillColor = Color3.new(1, 0, 0)
        highlight1.Name = "highlight"
        highlight1.Parent = Head

        local highlight2 = Instance.new("Highlight")
        highlight2.FillColor = Color3.new(1, 0, 0)
        highlight2.Name = "highlight"
        highlight2.Parent = HumanoidRootPart

        local highlight3 = Instance.new("Highlight")
        highlight3.FillColor = Color3.new(1, 0, 0)
        highlight3.Name = "highlight"
        highlight3.Parent = LeftArm

        local highlight4 = Instance.new("Highlight")
        highlight4.FillColor = Color3.new(1, 0, 0)
        highlight4.Name = "highlight"
        highlight4.Parent = LeftLeg

        local highlight5 = Instance.new("Highlight")
        highlight5.FillColor = Color3.new(1, 0, 0)
        highlight5.Name = "highlight"
        highlight5.Parent = RightArm

        local highlight6 = Instance.new("Highlight")
        highlight6.FillColor = Color3.new(1, 0, 0)
        highlight6.Name = "highlight"
        highlight6.Parent = RightLeg

        local highlight7 = Instance.new("Highlight")
        highlight7.FillColor = Color3.new(1, 0, 0)
        highlight7.Name = "highlight"
        highlight7.Parent = Torso
    else
        workspace.Guard.Head.highlight:Destroy()
        workspace.Guard.HumanoidRootPart.highlight:Destroy()
        workspace.Guard["Left Arm"].highlight:Destroy()
        workspace.Guard["Left Leg"].highlight:Destroy()
        workspace.Guard["Right Arm"].highlight:Destroy()
        workspace.Guard["Right Leg"].highlight:Destroy()
        workspace.Guard.Torso.highlight:Destroy()
    end
end)

local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Teleport Places")

TPSection:NewButton("Hubert", "Sell Your Items", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(76.2407074, 3.22548437, -17.5386543, 0.984758794, -6.95496905e-09, 0.173925638, 1.49538337e-09, 1, 3.15213882e-08, -0.173925638, -3.07808783e-08, 0.984758794)
end)

TPSection:NewButton("Clerk", "Store Clerk", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(32.7342529, 3.20509624, 71.774765, -0.739210844, 5.97611702e-08, -0.673474073, 7.27015159e-09, 1, 8.07558891e-08, 0.673474073, 5.47993686e-08, -0.739210844)
end)

TPSection:NewButton("Storage Room", "Pass The Locked Door", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(58.7430611, 3.21019316, 98.3434143, -0.682185411, 6.53415526e-08, 0.731179237, 1.64153029e-08, 1, -7.40492467e-08, -0.731179237, -3.85127876e-08, -0.682185411)
end)

local Remove = Window:NewTab("Remover")
local RemoveSection = Remove:NewSection("Remove Things")

RemoveSection:NewButton("Locked Door", "Remove The Door", function()
    workspace.GameStuffBuildsYeah.StorageRoomDoor:Destroy()
end)

RemoveSection:NewButton("Main Door", "Too Lazy", function()
    workspace.GameStuffBuildsYeah.Door:Destroy()
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)