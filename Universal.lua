local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Universal", Duration = 4,})

--MAIN
local Main = Window:NewTab("Universal")
local MainSection = Main:NewSection("Universal Stuff")

MainSection:NewSlider("WalkSpeed", "Move Faster", 400, 16, function(s) -- 400 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 400, 50, function(s) -- 400 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewSlider("HipHight", "Hip Point Higher", 400, 0, function(s) -- 400 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = s
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

MainSection:NewToggle("Loop HipHeight", "Loop HipHeight", function(state)
    if state then
        a = game.Players.LocalPlayer.Character.Humanoid.HipHeight
        i = true
        while wait() do
            if i == true then
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = a
            elseif i == false then
                break
            end
        end
    else
        i = false
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
    end
end)

MainSection:NewButton("Infinite Yield", "Load It", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("ESP Players")

ESPSection:NewToggle("Player ESP", "ESP The Players", function(state)
    if state then
        i = true
        while wait(0.5) do
            if i == true then
                local People = game.Players
                for _, Players in ipairs(People:GetPlayers()) do
                    if Players ~= game.Players.LocalPlayer then
                        local character = Players.Character
                        if character then
                            local Head = character:FindFirstChild("Head")
                            local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                            local LeftArm = character:FindFirstChild("Left Arm")
                            local LeftLeg = character:FindFirstChild("Left Leg")
                            local RightArm = character:FindFirstChild("Right Arm")
                            local RightLeg = character:FindFirstChild("Right Leg")
                            local Torso = character:FindFirstChild("Torso")

                            if Head and not Head:FindFirstChild("Highlight") then
                                local highlight1 = Instance.new("Highlight")
                                highlight1.Name = "Highlight"
                                highlight1.FillColor = Color3.new(1, 0, 0)
                                highlight1.Parent = Head
                            end
                            if HumanoidRootPart and not HumanoidRootPart:FindFirstChild("Highlight") then
                                local highlight2 = Instance.new("Highlight")
                                highlight2.Name = "Highlight"
                                highlight2.FillColor = Color3.new(1, 0, 0)
                                highlight2.Parent = HumanoidRootPart
                            end
                            if LeftArm and not LeftArm:FindFirstChild("Highlight") then
                                local highlight3 = Instance.new("Highlight")
                                highlight3.Name = "Highlight"
                                highlight3.FillColor = Color3.new(1, 0, 0)
                                highlight3.Parent = LeftArm
                            end
                            if LeftLeg and not LeftLeg:FindFirstChild("Highlight") then
                                local highlight4 = Instance.new("Highlight")
                                highlight4.Name = "Highlight"
                                highlight4.FillColor = Color3.new(1, 0, 0)
                                highlight4.Parent = LeftLeg
                            end
                            if RightArm and not RightArm:FindFirstChild("Highlight") then
                                local highlight5 = Instance.new("Highlight")
                                highlight5.Name = "Highlight"
                                highlight5.FillColor = Color3.new(1, 0, 0)
                                highlight5.Parent = RightArm
                            end
                            if RightLeg and not RightLeg:FindFirstChild("Highlight") then
                                local highlight6 = Instance.new("Highlight")
                                highlight6.Name = "Highlight"
                                highlight6.FillColor = Color3.new(1, 0, 0)
                                highlight6.Parent = RightLeg
                            end
                            if Torso and not Torso:FindFirstChild("Highlight") then
                                local highlight7 = Instance.new("Highlight")
                                highlight7.Name = "Highlight"
                                highlight7.FillColor = Color3.new(1, 0, 0)
                                highlight7.Parent = Torso
                            end
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        local People2 = game.Players
        for _, Players2 in ipairs(People2:GetPlayers()) do
            if Players2 ~= game.Players.LocalPlayer then
                local character = Players2.Character
                if character then
                    for _, BP in ipairs(character:GetChildren()) do
                        if BP:IsA("BasePart") and BP:FindFirstChild("Highlight") then
                            BP.Highlight:Destroy()
                        end
                    end
                end
            end
        end
    end
end)

local Full = Window:NewTab("Fullbright")
local FullSection = Full:NewSection("Fullbrightness")

FullSection:NewToggle("FullBright", "Toggle Brightness", function(state)
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

local Fog = Window:NewTab("Fog")
local FogSection = Fog:NewSection("No More Fog")

FogSection:NewToggle("Disable Fog", "No Fog", function(state)
    if state then
        local lighting = game:GetService("Lighting")
        lighting.FogEnd = 100000
    else
        local lighting = game:GetService("Lighting")
        lighting.FogEnd = 1000
    end
end)

local Identity = Window:NewTab("ID")
local IdentitySection = Identity:NewSection("Get Stuff About The Games Id")

IdentitySection:NewButton("Get The Game Id", "Send The Id In A Notification", function()
    local function sendNotificationWithValue()
        local id = game.PlaceId
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Game Id",
            Text = "The Id Is: " .. tostring(id),
            Duration = 5
        })
    end

    sendNotificationWithValue()
end)

local Hit = Window:NewTab("Hitbox")
local HitSection = Hit:NewSection("Change Stuff About The Hitbox")

HitSection:NewToggle("Large Head Hitbox", "Make Everybodys Head Larger", function(state)
    if state then
        i = true
        while wait(0.5) do
            if i == true then
                local Players = game.Players:GetPlayers()

                for _, player in ipairs(Players) do
                    if player ~= game.Players.LocalPlayer then
                        local character = player.Character
                        if character then
                            local head = character:FindFirstChild("Head")
                            if head then
                                head.Size = Vector3.new(5, 5, 5)
                            end
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        local Players = game.Players:GetPlayers()

        for _, player in ipairs(Players) do
            if player ~= game.Players.LocalPlayer then
                local character = player.Character
                if character then
                    local head = character:FindFirstChild("Head")
                    if head then
                        head.Size = Vector3.new(2, 1, 1)
                    end
                end
            end
        end
    end
end)

local Mark = Window:NewTab("Marker")
local MarkSection = Mark:NewSection("Drop A Marker On The Map")

MarkSection:NewButton("Set Waypoint", "Make A Marker", function()
    local a = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    local point = Instance.new("Part")
    point.Name = "Marker"
    point.Size = Vector3.new(1, 1, 1)
    point.Position = a
    point.Anchored = true
    point.Color = Color3.new(1, 1, 1)
    point.CanCollide = false
    point.Parent = game.workspace
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(0, 0, 255)
    highlight.Parent = game.workspace.Marker
end)

MarkSection:NewButton("TP To Waypoint", "Tp", function()
    local a = game.workspace.Marker.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
end)

MarkSection:NewButton("Delete Waypoint", "Remove", function()
    game.workspace.Marker:Destroy()
end)

local FOV = Window:NewTab("FOV Changer")
local FOVSection = FOV:NewSection("Change Your FOV")

FOVSection:NewSlider("FOV", "Change Your Field Of View", 120, 70, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Workspace.Camera.FieldOfView = s
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)