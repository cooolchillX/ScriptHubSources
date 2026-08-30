local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local selectedinstance = nil
local oretable = {}
local ore = false
local oreconnect
local treetable = {}
local tree = false
local treeconnect
local playertable = {}
local player = false
local playerconnect
local seatable = {}
local sea = false
local seaconnect
local spottable = {}
local spot = false
local spotconnect
local lightingconnects = {}

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
    local waitforclick
    game.StarterGui:SetCore("SendNotification", {Title = "Waiting", Text = "Click Where You Want The Point", Duration = 4,})
    waitforclick = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local point = Instance.new("Part")
            point.Name = "TpPoint"
            point.Size = Vector3.new(1, 1, 1)
            point.Position = game.Players.LocalPlayer:GetMouse().Hit.Position + Vector3.new(0, 3, 0)
            point.Anchored = true
            point.Color = Color3.new(1, 1, 1)
            point.CanCollide = false
            point.Parent = game.workspace
            local highlight = Instance.new("Highlight")
            highlight.Name = "Highlight"
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
            highlight.Parent = point

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESPBillboard"
            billboard.Size = UDim2.new(0, 50, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 0, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = point

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0.25, 0)
            label.Position = UDim2.new(0, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(0, 1, 0)
            label.TextScaled = true
            label.Text = "TP Point"
            label.Parent = billboard
            game.StarterGui:SetCore("SendNotification", {Title = "Point Set", Text = "TP Point Has Been Set", Duration = 4,})
            waitforclick:Disconnect()
        end
    end)
end)

ItemTeleportSection:NewButton("Delete TP Point", "Remove The Point", function()
    game.workspace.TpPoint:Destroy()
end)

ItemTeleportSection:NewButton("TP To Point", "Tp You To The Point", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.TpPoint.CFrame
end)

ItemTeleportSection:NewButton("Select The Object", "Selects The Tree You Want To TP", function()
    local waitforclick
    game.StarterGui:SetCore("SendNotification", {Title = "Waiting", Text = "Click One The Object To Select It", Duration = 4,})
    waitforclick = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if game.Players.LocalPlayer:GetMouse().Target.Parent.Name == "WoodPart" and game.Players.LocalPlayer:GetMouse().Target.Parent:GetAttribute("_Network") == game.Players.LocalPlayer.Name then
                selectedinstance = game.Players.LocalPlayer:GetMouse().Target
                game.StarterGui:SetCore("SendNotification", {Title = selectedinstance.Parent:GetAttribute("Tree") .. " Found", Text = selectedinstance.Parent:GetAttribute("_Network") .. " Is Owner", Duration = 4,})
                waitforclick:Disconnect()
            elseif game.Players.LocalPlayer:GetMouse().Target.Parent.Name == "MaterialPart" and game.Players.LocalPlayer:GetMouse().Target.Parent:GetAttribute("_Network") == game.Players.LocalPlayer.Name then
                selectedinstance = game.Players.LocalPlayer:GetMouse().Target
                game.StarterGui:SetCore("SendNotification", {Title = selectedinstance.Parent:GetAttribute("Material") .. " Found", Text = selectedinstance.Parent:GetAttribute("_Network") .. " Is Owner", Duration = 4,})
                waitforclick:Disconnect()
            end
        end
    end)
end)

ItemTeleportSection:NewButton("TP Selected Object To Point", "TP It To A Point", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local old = hrp.CFrame
    if selectedinstance then
        local distance = (hrp.Position - selectedinstance.Position).Magnitude
        if distance <= 10 then
            hrp.CFrame = selectedinstance.CFrame
            game.ReplicatedStorage.Events.GrabHandler:InvokeServer(selectedinstance, "Grab", selectedinstance.Position, nil)
            hrp.CFrame = game.workspace.TpPoint.CFrame
            selectedinstance.CFrame = game.workspace.TpPoint.CFrame
            task.wait(1)
            hrp.CFrame = old
        elseif distance > 10 then
            game.StarterGui:SetCore("SendNotification", {Title = "Warning", Text = "Object Is Too Far Away", Duration = 4,})
        end
    elseif selectedinstance == nil or selectedinstance.Parent == nil then
        game.StarterGui:SetCore("SendNotification", {Title = "Error", Text = "Object Does Not Exist", Duration = 4,})
    end
end)

ItemTeleportSection:NewButton("TP All Nearby Stones To Point", "TP It To A Point", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local old = hrp.CFrame
    local stones = {}
    for _, v in pairs(game.workspace.Grab:GetChildren()) do
        if v:IsA("Model") and v.Name == "MaterialPart" then
            if v:FindFirstChild("Part") then
                local distance = (hrp.Position - v.Part.Position).Magnitude
                if distance <= 10 then
                    table.insert(stones, v)
                end
            end
        end
    end
    game.StarterGui:SetCore("SendNotification", {Title = "Teleporting", Text = "Total:" .. tostring(#stones), Duration = 4,})
    for _, v in pairs(stones) do
        task.wait(0.05)
        task.spawn(function()
            hrp.CFrame = v.Part.CFrame
            game.ReplicatedStorage.Events.GrabHandler:InvokeServer(v.Part, "Grab", v.Part.Position, nil)
        end)
    end
    hrp.CFrame = game.workspace.TpPoint.CFrame
    for _, v in pairs(stones) do
        v.Part.CFrame = game.workspace.TpPoint.CFrame
    end
    task.wait(0.5)
    hrp.CFrame = old
    stones = {}
end)

local ItemTeleportSection = ItemTeleport:NewSection("Extra Point For Quality Of Life")

ItemTeleportSection:NewButton("Create Extra TP Point", "Makes Things Easier", function()
    local waitforclick
    game.StarterGui:SetCore("SendNotification", {Title = "Waiting", Text = "Click Where You Want The Point", Duration = 4,})
    waitforclick = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local point = Instance.new("Part")
            point.Name = "ExtraTpPoint"
            point.Size = Vector3.new(1, 1, 1)
            point.Position = game.Players.LocalPlayer:GetMouse().Hit.Position + Vector3.new(0, 3, 0)
            point.Anchored = true
            point.Color = Color3.new(1, 1, 1)
            point.CanCollide = false
            point.Parent = game.workspace
            local highlight = Instance.new("Highlight")
            highlight.Name = "Highlight"
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.Parent = point

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESPBillboard"
            billboard.Size = UDim2.new(0, 50, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 0, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = point

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0.25, 0)
            label.Position = UDim2.new(0, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(1, 0, 0)
            label.TextScaled = true
            label.Text = "Extra TP Point"
            label.Parent = billboard
            game.StarterGui:SetCore("SendNotification", {Title = "Extra Point Set", Text = "Extra TP Point Has Been Set", Duration = 4,})
            waitforclick:Disconnect()
        end
    end)
end)

ItemTeleportSection:NewButton("Delete Extra TP Point", "Makes Things Easier", function()
    game.workspace.ExtraTpPoint:Destroy()
end)

ItemTeleportSection:NewButton("TP To Extra TP Point", "Makes Things Easier", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.ExtraTpPoint.CFrame
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("ESP Things")

ESPSection:NewToggle("Ore ESP", "See Ore Names", function(state)
    if state then
        ore = true
        for _, v in pairs(game.workspace.WorldSpawn.Ores:GetChildren()) do
            if v.Name ~= "_Decoration" and v.Name ~= "Null" then
                table.insert(oretable, v)
            end
        end
        oreconnect = game.workspace.WorldSpawn.Ores.ChildAdded:Connect(function(v)
            if v.Name ~= "_Decoration" and v.Name ~= "Null" then
                table.insert(oretable, v)
            end
        end)
        while task.wait(0.1) do
            if ore then
                xpcall(function()
                    for i = #oretable, 1, -1 do
                        local v = oretable[i]
                        if not v or not v.Parent then
                            table.remove(oretable, i)
                        else
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
                                textLabel.TextColor3 = Color3.new(1, 0, 0)
                                textLabel.Text = v.Name
                                textLabel.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Ore ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif ore == false then
                break
            end
        end
    else
        ore = false
        oreconnect:Disconnect()
        oretable = {}
        for _, v in pairs(game.workspace.WorldSpawn.Ores:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Tree ESP", "See Tree Names", function(state)
    if state then
        tree = true
        for _, v in pairs(game.workspace.WorldSpawn.Trees:GetChildren()) do
            if v.Name ~= "_Decoration" then
                table.insert(treetable, v)
            end
        end
        treeconnect = game.workspace.WorldSpawn.Trees.ChildAdded:Connect(function(v)
            if v.Name ~= "_Decoration" then
                table.insert(treetable, v)
            end
        end)
        while task.wait(0.1) do
            if tree then
                xpcall(function()
                    for i = #treetable, 1, -1 do
                        local v = treetable[i]
                        if not v or not v.Parent then
                            table.remove(treetable, i)
                        else
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
                                textLabel.Text = v.Name
                                textLabel.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Tree ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif tree == false then
                break
            end
        end
    else
        tree = false
        treeconnect:Disconnect()
        treetable = {}
        for _, v in pairs(game.workspace.WorldSpawn.Trees:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Player ESP", "See Player Names", function(state)
    if state then
        player = true
        for _, v in pairs(game.workspace.Live:GetChildren()) do
            table.insert(playertable, v)
        end
        playerconnect = game.workspace.Live.ChildAdded:Connect(function(v)
            table.insert(playertable, v)
        end)
        while task.wait(0.1) do
            if player then
                xpcall(function()
                    for i = #playertable, 1, -1 do
                        local v = playertable[i]
                        if not v or not v.Parent then
                            table.remove(playertable, i)
                        else
                            if v.Name ~= game.Players.LocalPlayer.Name then
                                if v:FindFirstChild("HumanoidRootPart") then
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
                                        textLabel.Text = v.Name
                                        textLabel.Parent = billboard
                                    end
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Player ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif player == false then
                break
            end
        end
    else
        player = false
        playerconnect:Disconnect()
        playertable = {}
        for _, v in pairs(game.workspace.Live:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                if v.HumanoidRootPart:FindFirstChild("ESPBillboard") then
                    v.HumanoidRootPart.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Sea Monster ESP", "See Sea Monster Names", function(state)
    if state then
        sea = true
        for _, v in pairs(game.workspace.BigFish:GetChildren()) do
            table.insert(seatable, v)
        end
        seaconnect = game.workspace.BigFish.ChildAdded:Connect(function(v)
            table.insert(seatable, v)
        end)
        while task.wait(0.1) do
            if sea then
                xpcall(function()
                    for i = #seatable, 1, -1 do
                        local v = seatable[i]
                        if not v or not v.Parent then
                            table.remove(seatable, i)
                        else
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
                                textLabel.Text = v.Name
                                textLabel.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Sea Monster ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif sea == false then
                break
            end
        end
    else
        sea = false
        seaconnect:Disconnect()
        seatable = {}
        for _, v in pairs(game.workspace.BigFish:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Fishing Hotspot ESP", "See Hotspots Names", function(state)
    if state then
        spot = true
        for _, v in pairs(game.workspace.MouseIgnore.FishHotspots:GetChildren()) do
            table.insert(spottable, v)
        end
        spotconnect = game.workspace.MouseIgnore.FishHotspots.ChildAdded:Connect(function(v)
            table.insert(spottable, v)
        end)
        while task.wait(0.1) do
            if spot then
                xpcall(function()
                    for i = #spottable, 1, -1 do
                        local v = spottable[i]
                        if not v or not v.Parent then
                            table.remove(spottable, i)
                        else
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
                                textLabel.Text = v.Name .. " Luck: 50%"
                                textLabel.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Fishing Hotspot ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif spot == false then
                break
            end
        end
    else
        spot = false
        spotconnect:Disconnect()
        spottable = {}
        for _, v in pairs(workspace.MouseIgnore.FishHotspots:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

local Visual = Window:NewTab("Visual")
local VisualSection = Visual:NewSection("Helps See Better")

VisualSection:NewToggle("FullBright", "Brighten The Game", function(state)
    if state then
        local lighting = game:GetService("Lighting")
        local properties = {ClockTime = 14, GlobalShadows = false, Ambient = Color3.fromRGB(255, 255, 255), Brightness = 10, OutdoorAmbient = Color3.fromRGB(255, 255, 255)}
        for i, v in pairs(properties) do
            lighting[i] = v
            lightingconnects[i] = lighting:GetPropertyChangedSignal(i):Connect(function()
                if lighting[i] ~= v then
                    lighting[i] = v
                end
            end)
        end
    else
        for _, v in pairs(lightingconnects) do
            v:Disconnect()
        end
        lightingconnects = {}
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
