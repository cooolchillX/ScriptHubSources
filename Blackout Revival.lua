local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local features = {
    -- infstam
    infstam = false,
    -- fly
    flyconnect = nil,
    -- noclip
    noclip = false,
    nocliptable = {},
    -- npcesp
    npcespdistance = 100,
    npcespcolor = Color3.fromRGB(255, 0, 0),
    nameesp = false,
    npcesptable = {},
    npcesp = false,
    npcespconnect = nil,
    -- playeresp
    playerscolor = Color3.fromRGB(0, 255, 0),
    playerstable = {},
    players = false,
    playersconnect = nil,
    -- automelee
    automeleetable = {},
    automeleenpctable = {},
    automelee = false,
    automeleenpcconnect = nil,
    automeleeconnect = nil,
    -- nospread
    nospread = false,
    -- norecoil
    norecoil = false,
    -- instainteract
    prompts = {},
    insta = false,
    instaconnection = nil,
    -- autoloot
    autoloottable = {},
    autoloot = false,
    autolootconnect = nil,
    -- autolockpick
    autolockpicktable = {},
    autolockpick = false,
    autolockpickconnect = nil,
    -- npchitbox
    npchitboxtable = {},
    npchitbox = false,
    npchitboxconnect = nil,
}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local speed = 1
local moveDir = Vector3.zero
local connection
local keys = {
    W = false,
    A = false,
    S = false,
    D = false
}
local function updateMoveDir()
    moveDir = Vector3.zero

    if keys.W then
        moveDir += Vector3.new(0, 0, -1)
    end
    if keys.S then
        moveDir += Vector3.new(0, 0, 1)
    end
    if keys.A then
        moveDir += Vector3.new(-1, 0, 0)
    end
    if keys.D then
        moveDir += Vector3.new(1, 0, 0)
    end
end
local function resetKeys()
    for key in pairs(keys) do
        keys[key] = false
    end
    moveDir = Vector3.zero
end
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end

    if input.KeyCode == Enum.KeyCode.W then
        keys.W = true
    elseif input.KeyCode == Enum.KeyCode.S then
        keys.S = true
    elseif input.KeyCode == Enum.KeyCode.A then
        keys.A = true
    elseif input.KeyCode == Enum.KeyCode.D then
        keys.D = true
    end

    updateMoveDir()
end)
UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then
        keys.W = false
    elseif input.KeyCode == Enum.KeyCode.S then
        keys.S = false
    elseif input.KeyCode == Enum.KeyCode.A then
        keys.A = false
    elseif input.KeyCode == Enum.KeyCode.D then
        keys.D = false
    end

    updateMoveDir()
end)
UIS.TextBoxFocused:Connect(function()
    resetKeys()
end)
UIS.WindowFocusReleased:Connect(function()
    resetKeys()
end)

local function flyon()
    if connection then return end

    connection = RunService.Heartbeat:Connect(function()
        local char = player.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if moveDir.Magnitude > 0 then
            local camCF = camera.CFrame
            local direction = camCF:VectorToWorldSpace(moveDir)
            direction = Vector3.new(direction.X, direction.Y, direction.Z)

            if direction.Magnitude > 0 then
                direction = direction.Unit
                hrp.CFrame = hrp.CFrame + (direction * speed * 0.1)
            end
        end
    end)
end
local function flyoff()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    resetKeys()
end

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Blackout Revival", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Primary Things")

MainSection:NewToggle("Infinite Stamina", "No Need To Stop Running", function(state)
    if state then
        features.infstam = true
        while task.wait(0.05) do
            if features.infstam then
                game.Players.LocalPlayer.PlayerGui:SetAttribute("Stamina", 100)
            elseif features.infstam == false then
                break
            end
        end
    else
        features.infstam = false
    end
end)

MainSection:NewSlider("Fly Speed", "Changed How Fast You Fly", 10, 1, function(s) -- 10 (MaxValue) | 1 (MinValue)
    speed = s
end)

MainSection:NewToggle("Fly", "Fly In The Air", function(state)
    if state then
        flyon()
        local RunService = game:GetService("RunService")
        local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        features.flyconnect = RunService.Heartbeat:Connect(function()
            local velocity = root.AssemblyLinearVelocity
            root.AssemblyLinearVelocity = Vector3.zero
            game.workspace.Gravity = 0
        end)
    else
        flyoff()
        features.flyconnect:Disconnect()
        game.workspace.Gravity = 196.2
    end
end)

MainSection:NewToggle("Noclip", "Clip Through Walls", function(state)
    if state then
        features.noclip = true
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v and (v:IsA("Part") or v:IsA("MeshPart")) then
                if v.CanCollide then
                    table.insert(features.nocliptable, v)
                end
            end
        end
        while task.wait(0.1) do
            if features.noclip then
                for _, v in pairs(features.nocliptable) do
                    v.CanCollide = false
                end
            elseif features.noclip == false then
                break
            end
        end
    else
        features.noclip = false
        for _, v in pairs(features.nocliptable) do
            v.CanCollide = true
        end
        features.nocliptable = {}
    end
end)

MainSection:NewSlider("Max Camera Zoom", "Changed How Far You Can Zoom Out", 100, 10, function(s) -- 10 (MaxValue) | 1 (MinValue)
    game.Players.LocalPlayer.CameraMaxZoomDistance = s
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Through Walls")

ESPSection:NewToggle("NPC ESP", "See NPC's Through Walls", function(state)
    if state then
        features.npcesp = true
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v and v:IsA("Model") and (v.Name ~= "Broker" and v.Name ~= "Merchant" and v.Name ~= "Rebel Contractor" and v.Name ~= "Rebel Merchant" and v.Name ~= "Vulture Contractor" and v.Name ~= "Vulture Merchant" and v.Name ~= "Scourge") then
                table.insert(features.npcesptable, v)
            end
        end
        features.npcespconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and (v.Name ~= "Broker" and v.Name ~= "Merchant" and v.Name ~= "Rebel Contractor" and v.Name ~= "Rebel Merchant" and v.Name ~= "Vulture Contractor" and v.Name ~= "Vulture Merchant" and v.Name ~= "Scourge") then
                table.insert(features.npcesptable, v)
            end
        end)
        while task.wait(0.1) do
            if features.npcesp then
               xpcall(function()
                    for i = #features.npcesptable, 1, -1 do
                        local v = features.npcesptable[i]
                        if not v or not v.Parent then
                            table.remove(features.npcesptable, i)
                        else
                            if not v:FindFirstChild("Humanoid") or v.Parent.Name == "Chars" then
                                table.remove(features.npcesptable, i)
                            else
                                if v:FindFirstChild("HumanoidRootPart") then
                                    local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                                    if distance <= features.npcespdistance then
                                        if features.nameesp then
                                            local rounded = math.round(v.Humanoid.Health)
                                            if not v:FindFirstChild("ESPBillboard") then
                                                local billboard = Instance.new("BillboardGui")
                                                billboard.Name = "ESPBillboard"
                                                billboard.Size = UDim2.new(0, 100, 0, 25)
                                                billboard.StudsOffset = Vector3.new(0, 3, 0)
                                                billboard.AlwaysOnTop = true
                                                billboard.Parent = v

                                                local label = Instance.new("TextLabel")
                                                label.Size = UDim2.new(1, 0, 1, 0)
                                                label.Position = UDim2.new(0, 0, 0, 0)
                                                label.BackgroundTransparency = 1
                                                label.TextColor3 = features.npcespcolor
                                                label.TextScaled = true
                                                label.Text = v.Name .. "[" .. tostring(rounded) .. "]"
                                                label.Parent = billboard
                                            elseif v:FindFirstChild("ESPBillboard") then
                                                v.ESPBillboard.TextLabel.Text = v.Name .. "[" .. tostring(rounded) .. "]"
                                                v.ESPBillboard.TextLabel.TextColor3 = features.npcespcolor
                                            end
                                        elseif not features.nameesp then
                                            if v:FindFirstChild("ESPBillboard") then
                                                v.ESPBillboard:Destroy()
                                            end
                                        end
                                        if not v:FindFirstChild("ESPAdornment") then
                                            local box = Instance.new("BoxHandleAdornment")
                                            box.Name = "ESPAdornment"
                                            box.Adornee = v.HumanoidRootPart
                                            box.Size = v.HumanoidRootPart.Size
                                            box.Color3 = features.npcespcolor
                                            box.Transparency = 0.6
                                            box.AlwaysOnTop = true
                                            box.ZIndex = 10
                                            box.Parent = v
                                        elseif v:FindFirstChild("ESPAdornment") then
                                            v.ESPAdornment.Color3 = features.npcespcolor
                                        end
                                    elseif distance > features.npcespdistance then
                                        if v:FindFirstChild("ESPAdornment") then
                                            v.ESPAdornment:Destroy()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("NPC ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.npcesp == false then
                break
            end
        end
    else
        features.npcesp = false
        features.npcespconnect:Disconnect()
        features.npcesptable = {}
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v and v:IsA("Model") then
                if v:FindFirstChild("Humanoid") and v.Parent.Name ~= "Chars" then
                    if features.nameesp then
                        if v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard:Destroy()
                        end
                    end
                    if v:FindFirstChild("ESPAdornment") then
                        v.ESPAdornment:Destroy()
                    end
                end
            end
        end
    end
end)

ESPSection:NewToggle("Player ESP", "See Players Through Walls", function(state)
    if state then
        for _, v in pairs(game.Players:GetPlayers()) do
            table.insert(features.playerstable, v)
        end
        features.playersconnect = game.Players.PlayerAdded:Connect(function(v)
            table.insert(features.playerstable, v)
        end)
        features.players = true
        while task.wait(0.1) do
            if features.players then
                xpcall(function()
                    for i = #features.playerstable, 1, -1 do
                        local v = features.playerstable[i]
                        if not v or not v.Parent then
                            table.remove(features.playerstable, i)
                        else
                            if v ~= game.Players.LocalPlayer then
                                local character = v.Character
                                if character then
                                    if character:FindFirstChild("HumanoidRootPart") then
                                        local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
                                        if distance <= features.npcespdistance then
                                            if features.nameesp then
                                                local rounded = math.round(character.Humanoid.Health)
                                                if not character:FindFirstChild("ESPBillboard") then
                                                    local billboard = Instance.new("BillboardGui")
                                                    billboard.Name = "ESPBillboard"
                                                    billboard.Size = UDim2.new(0, 100, 0, 25)
                                                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                                                    billboard.AlwaysOnTop = true
                                                    billboard.Parent = character

                                                    local label = Instance.new("TextLabel")
                                                    label.Size = UDim2.new(1, 0, 1, 0)
                                                    label.Position = UDim2.new(0, 0, 0, 0)
                                                    label.BackgroundTransparency = 1
                                                    label.TextColor3 = features.playerscolor
                                                    label.TextScaled = true
                                                    label.Text = character.Name .. "[" .. tostring(rounded) .. "]"
                                                    label.Parent = billboard
                                                elseif character:FindFirstChild("ESPBillboard") then
                                                    character.ESPBillboard.TextLabel.Text = v.Name .. "[" .. tostring(rounded) .. "]"
                                                    character.ESPBillboard.TextLabel.TextColor3 = features.playerscolor
                                                end
                                            elseif not features.nameesp then
                                                if character:FindFirstChild("ESPBillboard") then
                                                    character.ESPBillboard:Destroy()
                                                end
                                            end
                                            if not character:FindFirstChild("ESPAdornment") then
                                                local box = Instance.new("BoxHandleAdornment")
                                                box.Name = "ESPAdornment"
                                                box.Adornee = character.HumanoidRootPart
                                                box.Size = character.HumanoidRootPart.Size
                                                box.Color3 = features.playerscolor
                                                box.Transparency = 0.6
                                                box.AlwaysOnTop = true
                                                box.ZIndex = 10
                                                box.Parent = character
                                            elseif character:FindFirstChild("ESPAdornment") then
                                                character.ESPAdornment.Color3 = features.playerscolor
                                            end
                                        elseif distance > features.npcespdistance then
                                            if character:FindFirstChild("ESPAdornment") then
                                                character.ESPAdornment:Destroy()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Player ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.players == false then
                break
            end
        end
    else
        features.players = false
        features.playersconnect:Disconnect()
        features.playerstable = {}
        for _, Players in pairs(game.Players:GetPlayers()) do
            if Players ~= game.Players.LocalPlayer then
                local character = Players.Character
                if character and character:FindFirstChild("ESPHighlight") then
                    character.ESPHighlight:Destroy()
                end
            end
        end
    end
end)

local ESPCustom = Window:NewTab("ESP Customization")
local ESPCustomSection = ESPCustom:NewSection("Change Settings For ESP")

ESPCustomSection:NewSlider("NPC ESP Distance", "How Close Before Enabling ESP", 500, 100, function(s) -- 500 (MaxValue) | 100 (MinValue)
    features.npcespdistance = s
end)

ESPCustomSection:NewColorPicker("NPC ESP Color", "Change Its Color", Color3.fromRGB(255,0,0), function(color)
    features.npcespcolor = color
end)

ESPCustomSection:NewToggle("Include Name And Health ESP", "Shows Names And HP For Players And NPC's", function(state)
    if state then
        features.nameesp = true
    else
        features.nameesp = false
    end
end)

local Combat = Window:NewTab("Combat")
local CombatSection = Combat:NewSection("Assist With Fighting")

CombatSection:NewToggle("Auto Melee", "Attacks All Nearby NPC's", function(state)
    if state then
        features.automelee = true
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v and v:IsA("RayValue") then
                table.insert(features.automeleetable, v)
            end
        end
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v and v:IsA("Model") then
                table.insert(features.automeleenpctable, v)
            end
        end
        features.automeleeconnect = game.Players.LocalPlayer.Character.ChildAdded:Connect(function(v)
            if v and v:IsA("RayValue") then
                table.insert(features.automeleetable, v)
            end
        end)
        features.automeleenpcconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                table.insert(features.automeleenpctable, v)
            end
        end)
        while task.wait(0.1) do
            if features.automelee then
               xpcall(function()
                    for i = #features.automeleenpctable, 1, -1 do
                        local v = features.automeleenpctable[i]
                        if not v or not v.Parent then
                            table.remove(features.automeleenpctable, i)
                        else
                            if not v:FindFirstChild("Humanoid") or v.Parent.Name == "Chars" then
                                table.remove(features.automeleenpctable, i)
                            end
                        end
                    end
                    for i = #features.automeleetable, 1, -1 do
                        local v = features.automeleetable[i]
                        if not v or not v.Parent then
                            table.remove(features.automeleetable, i)
                        else
                            if v:FindFirstChild("MeleeStatus") then
                                for _, v2 in pairs(features.automeleenpctable) do
                                    if v2 and v2:FindFirstChild("Head") and v2:FindFirstChild("Humanoid") and v2:FindFirstChild("HumanoidRootPart") then
                                        if v2.Humanoid.Health > 0 then
                                            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).Magnitude
                                            if distance <= 30 then
                                                task.spawn(function()
                                                    game.ReplicatedStorage.MeleeStorage.Events.Swing:InvokeServer()
                                                    game.ReplicatedStorage.MeleeStorage.Events.Hit:FireServer(v2.Head, v2.Head.Position)
                                                end)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Auto Melee Error")
                    warn(debug.traceback(err))
                end)
            elseif features.automelee == false then
                break
            end
        end
    else
        features.automelee = false
        featues.automeleenpcconnect:Disconnect()
        features.automeleeconnect:Disconnect()
        features.automeleetable = {}
        features.automeleenpctable = {}
    end
end)

CombatSection:NewToggle("No Spread", "Pinpoint Accuracy", function(state)
    if state then
        local gunmod = nil
        for _,v in pairs(getnilinstances()) do
            if v:IsA("ModuleScript") and v.Name == "Main" then
                local mod = require(v)
                if rawget(mod, "Springs") then
                    gunmod = mod
                end
            end
        end
        features.nospread = true
        while task.wait(0.1) do
            if features.nospread then
               xpcall(function()
                    if rawget(gunmod,"WeaponStats") and rawget(rawget(gunmod, "WeaponStats"), "Spread") then
                        rawset(rawget(gunmod,"WeaponStats"), "Spread", 0.1)
                    end
                end, function(err)
                    warn("No Spread Error")
                    warn(debug.traceback(err))
                end)
            elseif features.nospread == false then
                break
            end
        end
    else
        features.nospread = false
    end
end)

CombatSection:NewToggle("No Recoil", "No More Screen Movement", function(state)
    if state then
        local gunmod = nil
        for _,v in pairs(getnilinstances()) do
            if v:IsA("ModuleScript") and v.Name == "Main" then
                local mod = require(v)
                if rawget(mod, "Springs") then
                    gunmod = mod
                end
            end
        end
        features.norecoil = true
        while task.wait(0.1) do
            if features.norecoil then
               xpcall(function()
                    if rawget(gunmod,"Settings") and rawget(rawget(gunmod,"Settings"), "Firing") then
                        local firing = rawget(rawget(gunmod,"Settings"),"Firing")
                        rawset(firing, "Recoil", NumberRange.new(0, 0))
                        rawset(firing, "AimedKickback", 0)
                        rawset(firing, "Kickback", 0)
                        rawset(firing, "Shake", 0)
                    end
                end, function(err)
                    warn("No Recoil Error")
                    warn(debug.traceback(err))
                end)
            elseif features.norecoil == false then
                break
            end
        end
    else
        features.norecoil = false
    end
end)

local Auto = Window:NewTab("Automation")
local AutoSection = Auto:NewSection("Complete Tasks Quickly")

AutoSection:NewToggle("Instant Interaction", "No Need To Hold", function(state)
    if state then
        features.insta = true
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                table.insert(features.prompts, v)
            end
        end
        features.instaconnection = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("ProximityPrompt") then
                table.insert(features.prompts, v)
            end
        end)
        while task.wait(0.1) do
            if features.insta then
                xpcall(function()
                    for i = #features.prompts, 1, -1 do
                        local v = features.prompts[i]
                        if not v or not v.Parent then
                            table.remove(features.prompts, i)
                        else
                            v.HoldDuration = 0
                        end
                    end
                end, function(err)
                    warn("Insta Interact Error")
                    warn(debug.traceback(err))
                end)
            elseif features.insta == false then
                break
            end
        end
    else
        features.insta = false
        features.instaconnection:Disconnect()
        features.prompts = {}
    end
end)

AutoSection:NewToggle("Auto Loot", "Grabs All Keycards And Contraband Armor", function(state)
    if state then
        features.autoloot = true
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v:IsA("Folder") and v.Name == "LootTable" then
                table.insert(features.autoloottable, v)
            end
        end
        features.autolootconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Folder") and v.Name == "LootTable" then
                table.insert(features.autoloottable, v)
            end
        end)
        while task.wait(0.1) do
            if features.autoloot then
                xpcall(function()
                    for i = #features.autoloottable, 1, -1 do
                        local v = features.autoloottable[i]
                        if not v or not v.Parent then
                            table.remove(features.autoloottable, i)
                        else
                            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Parent:GetPivot().Position).Magnitude
                            if distance <= 5 then
                                if v:GetAttribute("Cash") ~= 0 then
                                    task.wait(0.1)
                                    game.ReplicatedStorage.Events.Loot.LootObject:FireServer(v, "Cash")
                                end
                                if v:GetAttribute("Valuables") ~= 0 then
                                    task.wait(0.1)
                                    game.ReplicatedStorage.Events.Loot.LootObject:FireServer(v, "Valuables")
                                end
                                for _, v2 in pairs(v:GetChildren()) do
                                    if string.find(string.lower(v2.Name), "keycard") or string.find(string.lower(v2.Name), "operator") or string.find(string.lower(v2.Name), "commander") or string.find(string.lower(v2.Name), "bladedancer") then
                                        task.wait(0.1)
                                        game.ReplicatedStorage.Events.Loot.LootObject:FireServer(v, v2, true)
                                    end
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Auto Loot Error")
                    warn(debug.traceback(err))
                end)
            elseif features.autoloot == false then
                break
            end
        end
    else
        features.autoloot = false
        features.autolootconnect:Disconnect()
        features.autoloottable = {}
    end
end)

AutoSection:NewToggle("Auto Lockpick", "Opens It Skipping The Minigame", function(state)
    if state then
        features.autolockpick = true
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v:IsA("Attachment") and v.Name == "Lockpick" then
                table.insert(features.autolockpicktable, v)
            end
        end
        features.autolockpickconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Attachment") and v.Name == "Lockpick" then
                table.insert(features.autolockpicktable, v)
            end
        end)
        while task.wait(0.1) do
            if features.autolockpick then
                xpcall(function()
                    for i = #features.autolockpicktable, 1, -1 do
                        local v = features.autolockpicktable[i]
                        if not v or not v.Parent then
                            table.remove(features.autolockpicktable, i)
                        else
                            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Parent:GetPivot().Position).Magnitude
                            if distance <= 5 then
                                if not v.Parent.Parent:GetAttribute("Unlocked") then
                                    game.ReplicatedStorage.Events.Loot.MinigameResult:FireServer(v.Parent.Parent, true)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Auto Lockpick Error")
                    warn(debug.traceback(err))
                end)
            elseif features.autolockpick == false then
                break
            end
        end
    else
        features.autolockpick = false
        features.autolockpickconnect:Disconnect()
        features.autolockpicktable = {}
    end
end)

local Fun = Window:NewTab("Fun")
local FunSection = Fun:NewSection("Extra Things I Guess")

FunSection:NewToggle("NPC Hitbox Expander", "Expands NPC Hitboxes", function(state)
    if state then
        features.npchitbox = true
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v and v:IsA("Model") and (v.Name ~= "Broker" and v.Name ~= "Merchant" and v.Name ~= "Rebel Contractor" and v.Name ~= "Rebel Merchant" and v.Name ~= "Vulture Contractor" and v.Name ~= "Vulture Merchant" and v.Name ~= "Scourge") then
                table.insert(features.npchitboxtable, v)
            end
        end
        features.npchitboxconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and (v.Name ~= "Broker" and v.Name ~= "Merchant" and v.Name ~= "Rebel Contractor" and v.Name ~= "Rebel Merchant" and v.Name ~= "Vulture Contractor" and v.Name ~= "Vulture Merchant" and v.Name ~= "Scourge") then
                table.insert(features.npchitboxtable, v)
            end
        end)
        while task.wait(0.1) do
            if features.npchitbox then
               xpcall(function()
                    for i = #features.npchitboxtable, 1, -1 do
                        local v = features.npchitboxtable[i]
                        if not v or not v.Parent then
                            table.remove(features.npchitboxtable, i)
                        else
                            if not v:FindFirstChild("Humanoid") or v.Parent.Name == "Chars" then
                                table.remove(features.npchitboxtable, i)
                            else
                                if v:FindFirstChild("Head") then
                                    v.Head.Size = Vector3.new(5, 5, 5)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("NPC ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.npchitbox == false then
                break
            end
        end
    else
        features.npchitbox = false
        features.npchitboxconnect:Disconnect()
        features.npchitboxtable = {}
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v and v:IsA("Model") then
                if v:FindFirstChild("Humanoid") and v.Parent.Name ~= "Chars" then
                    if v:FindFirstChild("Head") then
                        v.Head.Size = Vector3.new(1, 1, 1)
                    end
                end
            end
        end
    end
end)

FunSection:NewButton("Kit And Active Mission Detection", "For People Hunting Kits Or Tasks", function()
    warn("////////////////////////////////////////////////////////////////////////////////////////////////////////////")
    local Players = game:GetService("Players")

    for _, v in pairs(workspace.Chars:GetChildren()) do
        if v then
            local player = Players:FindFirstChild(v.Name)
            local level = player and player:GetAttribute("Level")
            local bounty = player and player:GetAttribute("Bounty")

            local gear = v:FindFirstChild("CurrentGear")
            if gear then
                local items = {}
                for _, item in pairs(gear:GetChildren()) do
                    items[item.Name] = true
                end

                if items["Operator Helmet"] and items["Operator Vest"] and items["Operator Leggings"] then
                    game.StarterGui:SetCore("SendNotification", {Title = "Operator Detected", Text = v.Name .. " (Level " .. level .. ")" .. " (Bounty $" .. bounty .. ")", Duration = 8,})
                    warn(v.Name .. " (Level " .. level .. ") is an Operator" .. " (Bounty $" .. bounty .. ")")
                elseif items["Operator Helmet MK2"] and items["Operator Vest"] and items["Operator Leggings"] then
                    game.StarterGui:SetCore("SendNotification", {Title = "Operator MK2 Detected", Text = v.Name .. " (Level " .. level .. ")" .. " (Bounty $" .. bounty .. ")", Duration = 8,})
                    warn(v.Name .. " (Level " .. level .. ") is an Operator MK2" .. " (Bounty $" .. bounty .. ")")
                elseif items["Commander Helmet"] and items["Commander Vest"] and items["Commander Leggings"] then
                    game.StarterGui:SetCore("SendNotification", {Title = "Commander Detected", Text = v.Name .. " (Level " .. level .. ")" .. " (Bounty $" .. bounty .. ")", Duration = 8,})
                    warn(v.Name .. " (Level " .. level .. ") is a Commander" .. " (Bounty $" .. bounty .. ")")
                elseif items["Bladedancer Helmet"] and items["Bladedancer Vest"] and items["Bladedancer Leggings"] then
                    game.StarterGui:SetCore("SendNotification", {Title = "Bladedancer Detected", Text = v.Name .. " (Level " .. level .. ")" .. " (Bounty $" .. bounty .. ")", Duration = 8,})
                    warn(v.Name .. " (Level " .. level .. ") is a Bladedancer" .. " (Bounty $" .. bounty .. ")")
                else
                    print(v.Name .. " (Level " .. level .. ") has no detected full set" .. " (Bounty $" .. bounty .. ")")
                end
            end
        end
    end
    warn("////////////////////////////////////////////////////////////////////////////////////////////////////////////")

    warn("////////////////////////////////////////////////////////////////////////////////////////////////////////////")
    local wavetext = workspace.WaveSurvival.Panel.Screen.Screen.Billboard.Panel.TopBar.Title
    if wavetext.Text ~= "" and wavetext.Text ~= " " then
        game.StarterGui:SetCore("SendNotification", {Title = "Potential Active Waves", Text = wavetext.Text, Duration = 8,})
        warn("Potential Waves Active " .. wavetext.Text)
    else
        print("No Waves Detected")
    end
    warn("////////////////////////////////////////////////////////////////////////////////////////////////////////////")

    warn("////////////////////////////////////////////////////////////////////////////////////////////////////////////")
    local active = workspace.ActiveTasks
    local found = false
    for _, v in pairs(active:GetChildren()) do
        if v.Name == "Folder" then
            if #v:GetChildren() == 0 or v:FindFirstChild("Military Metro Security") then
                found = true
                game.StarterGui:SetCore("SendNotification", {Title = "Active Green", Text = "A Green Is Active In This Server", Duration = 8,})
                warn("Active Green Detected")
            end
        end
    end
    if not found then
        print("No Active Green Detected")
    end
    warn("////////////////////////////////////////////////////////////////////////////////////////////////////////////")

    warn("////////////////////////////////////////////////////////////////////////////////////////////////////////////")
    local adlights = workspace.AccessDenied.Military.Alarms
    local ad = false
    for _, v in pairs(adlights:GetDescendants()) do
        if v.Name == "Bottom" and v:IsA("MeshPart") and v.Color == Color3.fromRGB(208, 38, 38) then
            ad = true
        end
    end
    if ad then
        game.StarterGui:SetCore("SendNotification", {Title = "Active AD", Text = "AD Is Active", Duration = 8,})
        warn("Active AD Detected")
    else
        print("No Active AD")
    end
    warn("////////////////////////////////////////////////////////////////////////////////////////////////////////////")
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)

local colors = {
    SchemeColor = Color3.fromRGB(0,255,255),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}
for theme, color in pairs(colors) do
    UISection:NewColorPicker(theme, "Change your "..theme, color, function(color3)
        Library:ChangeColor(theme, color3)
    end)
end
