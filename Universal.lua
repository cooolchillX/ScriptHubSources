local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local wp = false
local jp = false
local hh = false
local esp = false
local espcolor = Color3.fromRGB(255, 0, 0)
local hitbox = false
local gradual = false
local mapcolor = Color3.fromRGB(255, 0, 0)
local materials = {"Air", "Asphalt", "Basalt", "Brick", "Cobblestone", "Concrete", "CorrodedMetal", "CrackedLava", "DiamondPlate", "Fabric", "Foil", "ForceField", "Glass", "Granite", "Grass", "Ground", "Ice", "LeafyGrass", "Limestone", "Marble", "Metal", "Mud", "Neon", "Pavement", "Pebble", "Plastic", "Rock", "Salt", "Sand", "Sandstone", "Slate", "SmoothPlastic", "Snow", "Water", "Wood", "WoodPlanks"}
local selectedmaterial = nil

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
        wp = true
        local a = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        while task.wait(0.1) do
            if wp then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
            elseif wp == false then
                break
            end
        end
    else
        wp = false
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

MainSection:NewToggle("Loop JumpPower", "Loop Jump Height", function(state)
    if state then
        jp = true
        local a = game.Players.LocalPlayer.Character.Humanoid.JumpPower
        while task.wait(0.1) do
            if jp then
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
            elseif jp == false then
                break
            end
        end
    else
        jp = false
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

MainSection:NewToggle("Loop HipHeight", "Loop HipHeight", function(state)
    if state then
        hh = true
        local a = game.Players.LocalPlayer.Character.Humanoid.HipHeight
        while task.wait(0.1) do
            if hh then
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = a
            elseif hh == false then
                break
            end
        end
    else
        hh = false
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
        esp = true
        while task.wait(0.1) do
            if esp then
                for _, Players in ipairs(game.Players:GetPlayers()) do
                    if Players ~= game.Players.LocalPlayer then
                        local character = Players.Character
                        if character then
                            if not character:FindFirstChild("ESPHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "ESPHighlight"
                                highlight.FillColor = espcolor
                                highlight.Parent = character
                            elseif character:FindFirstChild("ESPHighlight") then
                                character.ESPHighlight.FillColor = espcolor
                            end
                        end
                    end
                end
            elseif esp == false then
                break
            end
        end
    else
        esp = false
        for _, Players in ipairs(game.Players:GetPlayers()) do
            if Players ~= game.Players.LocalPlayer then
                local character = Players.Character
                if character and character:FindFirstChild("ESPHighlight") then
                    character.ESPHighlight:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewColorPicker("Player ESP Color", "Change The ESP Color", Color3.fromRGB(255,0,0), function(color)
    espcolor = color
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

IdentitySection:NewButton("Get The Game ID", "Copy To Clipboard", function()
    setclipboard(game.GameId)
end)

IdentitySection:NewButton("Get The Place ID", "Copy To Clipboard", function()
    setclipboard(game.PlaceId)
end)

local Hit = Window:NewTab("Hitbox")
local HitSection = Hit:NewSection("Change Stuff About The Hitbox")

HitSection:NewToggle("Large Head Hitbox", "Make Everybodys Head Larger", function(state)
    if state then
        hitbox = true
        while task.wait(0.1) do
            if hitbox then
                for _, player in pairs(game.Players:GetPlayers()) do
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
            elseif hitbox == false then
                break
            end
        end
    else
        hitbox = false
        for _, player in pairs(game.Players:GetPlayers()) do
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

FOVSection:NewSlider("FOV", "Change Your Field Of View", 120, 70, function(s) -- 120 (MaxValue) | 70 (MinValue)
    game.Workspace.Camera.FieldOfView = s
end)

local Map = Window:NewTab("Map")
local MapSection = Map:NewSection("Modify The Map Or Break It")

MapSection:NewToggle("Gradual Changes", "Makes Options Below Happen Gradually", function(state)
    if state then
        gradual = true
    else
        gradual = false
    end
end)

MapSection:NewButton("Change Map Colors", "Change All Objects Color", function()
    local things = game.workspace:GetDescendants()
    for i = #things, 2, -1 do
	    local j = math.random(i)
	    things[i], things[j] = things[j], things[i]
    end
    for _, v in pairs(things) do
        if v and v:IsA("Part") or v:IsA("MeshPart") then
            v.Color = mapcolor
            if gradual then
                task.wait(0.01)
            end
        end
    end
end)

MapSection:NewColorPicker("Map Color Picker", "Color Choice For Map", Color3.fromRGB(255,0,0), function(color)
    mapcolor = color
end)

MapSection:NewButton("Change Map Materials", "Change All Objects Material", function()
    local things = game.workspace:GetDescendants()
    for i = #things, 2, -1 do
	    local j = math.random(i)
	    things[i], things[j] = things[j], things[i]
    end
    for _, v in pairs(things) do
        if v and selectedmaterial ~= nil and v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = selectedmaterial
            if gradual then
                task.wait(0.01)
            end
        end
    end
end)

MapSection:NewDropdown("Change Map Materials", "Change All Part Material", materials, function(currentOption)
    selectedmaterial = currentOption
end)

MapSection:NewButton("Delete Map", "Funny With Gradual", function()
    local things = game.workspace:GetDescendants()
    for i = #things, 2, -1 do
	    local j = math.random(i)
	    things[i], things[j] = things[j], things[i]
    end
    for _, v in pairs(things) do
        if v and v.Name ~= "Camera" and v.Name ~= "Terrain" and v ~= game.Players.LocalPlayer.Character and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
            v:Destroy()
            if gradual then
                task.wait(0.01)
            end
        end
    end
end)

MapSection:NewButton("Devastate Map (Use Gradual For Best Experience)", "Commit 3 Payloads Of Irreversible Damage", function()
    game.StarterGui:SetCore("SendNotification", {Title = "Setup Started", Text = "Started Pre-Load", Duration = 4,})
    local things = game.workspace:GetDescendants()
    for i = #things, 2, -1 do
	    local j = math.random(i)
	    things[i], things[j] = things[j], things[i]
    end
    for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
        v:Destroy()
    end
    local cc = game.Lighting:FindFirstChild("ColorCorrection")
    local num = 255
    for num = 255, 100, -1 do
        cc.TintColor = Color3.fromRGB(num, num, num)
        task.wait(0.1)
    end
    task.wait(1)
    game.StarterGui:SetCore("SendNotification", {Title = "Layer 1 Started", Text = "Started Load 1/3", Duration = 4,})
    for _, v in pairs(things) do
        if v and v:IsA("Part") or v:IsA("MeshPart") then
            v.Color = Color3.fromRGB(255, 0, 0)
            v.Material = "Neon"
            v.Transparency = 0
            if gradual then
                task.wait(0.01)
            end
        end
    end
    game.StarterGui:SetCore("SendNotification", {Title = "Layer 2 Started", Text = "Started Load 2/3", Duration = 4,})
    for _, v in pairs(things) do
        if v and v:IsA("Part") or v:IsA("MeshPart") then
            local fire = Instance.new("Fire")
            fire.Name = "BURN"
            fire.Size = 30
            fire.Heat = 25
            fire.Color = Color3.new(0, 0, 0)
            fire.SecondaryColor = Color3.new(0, 0, 0)
            fire.TimeScale = 10
            fire.Parent = v
            if gradual then
                task.wait(0.01)
            end
        end
    end
    game.StarterGui:SetCore("SendNotification", {Title = "Layer 3 Started", Text = "Started Load 3/3", Duration = 4,})
    for _, v in pairs(things) do
        if v and v.Name ~= "Camera" and v.Name ~= "Terrain" and v ~= game.Players.LocalPlayer.Character and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
            v:Destroy()
            if gradual then
                task.wait(0.01)
            end
        end
    end
    game.StarterGui:SetCore("SendNotification", {Title = "All Done", Text = "Now What Is Left?...", Duration = 4,})
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
