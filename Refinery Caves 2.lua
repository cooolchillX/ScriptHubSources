local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Refinery Caves 2", Duration = 4,})

local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Change Things About Your Player")

PlayerSection:NewSlider("WalkSpeed", "Player Speed", 100, 16, function(s) -- 100 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Player Jump Height", 100, 50, function(s) -- 100 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = s
end)

PlayerSection:NewSlider("HipHeight", "Player From Ground Offset", 50, 0, function(s) -- 50 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = s
end)

PlayerSection:NewSlider("Field Of View", "Player FOV", 120, 70, function(s) -- 120 (MaxValue) | 70 (MinValue)
    game.Workspace.Camera.FieldOfView = s
end)

PlayerSection:NewSlider("Gravity", "Player Gravity", 1000, 0, function(s) -- 1000 (MaxValue) | 0 (MinValue)
    game.Workspace.Gravity = s
end)

PlayerSection:NewButton("Reset Gravity", "Reset Your Gravity To Default", function()
    game.Workspace.Gravity = 196.2
end)

local World = Window:NewTab("World")
local WorldSection = World:NewSection("Modify The Environment")

WorldSection:NewToggle("Toggle Crystalized Abyss Bridge", "Toggle If It Exists", function(state)
    if state then
        workspace.Map.Structures.LightBridge.Bridge.Transparency = 0.5
        workspace.Map.Structures.LightBridge.Bridge.CanCollide = true
    else
        workspace.Map.Structures.LightBridge.Bridge.Transparency = 1
        workspace.Map.Structures.LightBridge.Bridge.CanCollide = false
    end
end)

WorldSection:NewButton("Delete Street Lamps", "Remove Them", function()
    workspace.Map.Objects.Lamps:Destroy()
end)

local ItemTeleport = Window:NewTab("Teleport Items")
local ItemTeleportSection = ItemTeleport:NewSection("Teleport Materials")

ItemTeleportSection:NewButton("Create TP Point", "Make The Point", function()
    local a = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    local point = Instance.new("Part")
    point.Name = "TpPoint"
    point.Size = Vector3.new(1, 1, 1)
    point.Position = a
    point.Anchored = true
    point.Color = Color3.new(1, 1, 1)
    point.CanCollide = false
    point.Parent = game.workspace
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(0, 0, 255)
    highlight.Parent = game.workspace.TpPoint
end)

ItemTeleportSection:NewButton("Delete TP Point", "Remove The Point", function()
    game.workspace.TpPoint:Destroy()
end)

ItemTeleportSection:NewButton("TP To Point", "Tp You To The Point", function()
    local a = game.workspace.TpPoint.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
end)

local ItemTeleportSection = ItemTeleport:NewSection("Click On The Item First")
ItemTeleportSection:NewButton("TP Tree To Point", "TP It To A Point", function()
    local items = game.Workspace.Grab
    for _, v in ipairs(items:GetChildren()) do
        if v.Name == "WoodPart" then
            local owner = v:FindFirstChild("Owner")
            local bottomWound = v:GetAttribute("BottomWound")
            
            if owner and owner.Value and tostring(owner.Value) == game.Players.LocalPlayer.Character.Name then
                if bottomWound == true then
                    local part = v:FindFirstChild("Part")
                    if part then
                        part.CFrame = game.workspace.TpPoint.CFrame
                    else
                        warn("WoodPart is missing 'Part' inside it!")
                    end
                end
            end
        end
    end
end)

ItemTeleportSection:NewButton("TP Stone To Point", "TP It To A Point", function()
    local items = game.Workspace.Grab
    for _, v in ipairs(items:GetChildren()) do
        if v.Name == "MaterialPart" then
            local owner = v:FindFirstChild("Owner")
            
            if owner and owner.Value and tostring(owner.Value) == game.Players.LocalPlayer.Character.Name then
                local part = v:FindFirstChild("Part")
                if part then
                    part.CFrame = game.workspace.TpPoint.CFrame
                else
                    warn("MaterialPart is missing 'Part' inside it!")
                end
            end
        end
    end
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("ESP Things")

ESPSection:NewToggle("Ore ESP", "See Ore Names", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in ipairs(workspace.WorldSpawn.Ores:GetChildren()) do
                    local stonename = v.Name
                    if not v.Hitbox:FindFirstChild("ESPBillboard") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESPBillboard"
                        billboard.Size = UDim2.new(0, 50, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 1, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = v.Hitbox

                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                        textLabel.Position = UDim2.new(0, 0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = Color3.new(1, 0, 0)
                        textLabel.Text = stonename
                        textLabel.Parent = billboard
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        wait(1)
        for _, v in ipairs(workspace.WorldSpawn.Ores:GetChildren()) do
            local stonename = v.Name
            if v.Hitbox:FindFirstChild("ESPBillboard") then
                v.Hitbox.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Tree ESP", "See Tree Names", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in ipairs(workspace.WorldSpawn.Trees:GetChildren()) do
                    local treename = v.Name
                    if not v:FindFirstChild("ESPBillboard") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESPBillboard"
                        billboard.Size = UDim2.new(0, 50, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 1, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = v

                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                        textLabel.Position = UDim2.new(0, 0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = Color3.new(0, 0, 1)
                        textLabel.Text = treename
                        textLabel.Parent = billboard
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        wait(1)
        for _, v in ipairs(workspace.WorldSpawn.Trees:GetChildren()) do
            local treename = v.Name
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Player ESP", "See Player Names", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in ipairs(game.workspace.Live:GetChildren()) do
                    local playername = v.Name
                    if playername ~= game.Players.LocalPlayer.Name then
                        if not v.HumanoidRootPart:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 50, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 1, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v.HumanoidRootPart

                            local textLabel = Instance.new("TextLabel")
                            textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                            textLabel.Position = UDim2.new(0, 0, 0, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.new(0, 1, 0)
                            textLabel.Text = playername
                            textLabel.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        wait(1)
        for _, v in ipairs(game.workspace.Live:GetChildren()) do
            local playername = v.Name
            if v.HumanoidRootPart:FindFirstChild("ESPBillboard") then
                v.HumanoidRootPart.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Sea Monster ESP", "See Sea Monster Names", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in ipairs(workspace.BigFish:GetChildren()) do
                    local fishname = v.Name
                    if not v:FindFirstChild("ESPBillboard") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESPBillboard"
                        billboard.Size = UDim2.new(0, 50, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 1, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = v

                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                        textLabel.Position = UDim2.new(0, 0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = Color3.fromRGB(44, 133, 133)
                        textLabel.Text = fishname
                        textLabel.Parent = billboard
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        wait(1)
        for _, v in ipairs(workspace.BigFish:GetChildren()) do
            local fishname = v.Name
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Fishing Hotspot ESP", "See Hotspots Names", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in ipairs(workspace.MouseIgnore.FishHotspots:GetChildren()) do
                    local spotname = v.Name
                    local luck = v:GetAttribute("Luck")
                    local lucktext
                    if luck == 0.5 then
                        lucktext = "50%"
                    end
                    if not v:FindFirstChild("ESPBillboard") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESPBillboard"
                        billboard.Size = UDim2.new(0, 50, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 1, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = v

                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                        textLabel.Position = UDim2.new(0, 0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = Color3.fromRGB(85, 255, 255)
                        textLabel.Text = spotname .. " Luck: " .. lucktext
                        textLabel.Parent = billboard
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        wait(1)
        for _, v in ipairs(workspace.MouseIgnore.FishHotspots:GetChildren()) do
            local spotname = v.Name
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)