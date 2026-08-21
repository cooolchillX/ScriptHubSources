local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local features = {
    -- fly
    flyconnect = nil,
    -- inf jump
    inputconnect = nil,
    -- noclip
    noclip = false,
    nocliptable = {},
    -- instainteract
    prompts = {},
    insta = false,
    instaconnection = nil,
    -- assetesp
    assettable = {},
    assets = false,
    assetconnect = nil,
    -- doors
    doortable = {},
    doors = false,
    doorconnect = nil,
    -- playeresp
    playerstable = {},
    players = false,
    playersconnect = nil,
    -- keycardesp
    keycardtable = {},
    keycards = false,
    keycardconnect = nil,
    -- batteriesesp
    batteriestable = {},
    batteries = false,
    batteriesconnect = nil,
    -- itemesp
    itemtable = {},
    items = false,
    itemconnect = nil,
    item2connect = nil,
    -- neostykesp
    neostyktable = {},
    neostyks = false,
    neostykconnect = nil,
    -- fakedooresp
    fakedoortable = {},
    fakedoors = false,
    fakedoorconnect = nil,
    -- lockersesp
    lockertable = {},
    lockers = false,
    lockerconnect = nil,
    -- tripwireesp
    tripwiretable = {},
    tripwires = false,
    tripwireconnect = nil,
    -- landmineesp
    landminetable = {},
    landmines = false,
    landmineconnect = nil,
    -- nodeesp
    nodetable = {},
    nodes = false,
    nodeconnect = nil,
    -- entityesp
    entitytable = {},
    entities = false,
    entitiesconnect = nil,
    entities2connect = nil,
    entities3connect = nil,
    entities4connect = nil,
    entities5connect = nil,
    -- generatoresp
    generatortable = {},
    generators = false,
    generatorconnect = nil,
    -- waterpuddleesp
    waterpuddlestable = {},
    waterpuddles = false,
    waterpuddlesconnect = nil,
    -- assetaura
    assetauratable = {},
    assetaura = false,
    assetauraconnect = nil,
    -- keycardaura
    keycardauratable = {},
    keycardaura = false,
    keycardauraconnect = nil,
    -- itemaura
    itemauratable = {},
    itemaura = false,
    itemauraconnect = nil,
    -- neostykaura
    neostykauratable = {},
    neostykaura = false,
    neostykauraconnect = nil,
    -- batteryaura
    batteryauratable = {},
    batteryaura = false,
    batteryauraconnect = nil,
    -- tripwireaura
    tripwireauratable = {},
    tripwireaura = false,
    tripwireauraconnect = nil,
    -- landmineaura
    landmineauratable = {},
    landmineaura = false,
    landmineauraconnect = nil,
    -- grabasset
    grabassettable = {},
    grabasset = false,
    grabassetconnect = nil,
    -- grabkeycard
    grabkeycardtable = {},
    grabkeycard = false,
    grabkeycardconnect = nil,
    -- grabitem
    grabitemtable = {},
    grabitem = false,
    grabitemconnect = nil,
    -- grabneostyk
    grabneostyktable = {},
    grabneostyk = false,
    grabneostykconnect = nil,
    -- grabbattery
    grabbatterytable = {},
    grabbattery = false,
    grabbatteryconnect = nil,
    -- disabledrawer
    disabledrawertable = {},
    disabledrawer = false,
    disabledrawerconnect = nil,
    -- visual
    freezefov = false,
    seethrough = false,
    --notif
    notifid = nil,
    notif = false,
    --anglernotif
    anglerconnect = nil,
    anglernotifconnect = nil,
    --entitynotif
    entityconnect = nil,
    entitynotifconnect = nil,
    --avoider
    risky = false,
    tpdistance = 100,
    avoidconnect = nil,
    -- imagine
    imaginetable = {},
    imagine = false,
    imagineconnect = nil,
    -- eyefestation
    eyefestationtable = {},
    eyefestation = false,
    eyefestationconnect = nil,
    -- pandemonium
    pandemoniumtable = {},
    pandemonium = false,
    pandemoniumconnect = nil,
    -- pipsqueak
    pipsqueaktable = {},
    pipsqueak = false,
    pipsqueakconnect = nil,
    -- harbinger
    harbingertable = {},
    harbinger = false,
    harbingerconnect = nil,
    -- witch
    witchtable = {},
    witch = false,
    witchconnect = nil,
    -- coagulate
    coagulatetable = {},
    coagulate = false,
    coagulateconnect = nil,
    -- skinless
    skinlesstable = {},
    skinless = false,
    skinlessconnect = nil,
    -- edentree
    edentreetable = {},
    edentree = false,
    edentreeconnect = nil,
    -- bobberfish
    bobberfishtable = {},
    bobberfish = false,
    bobberfishconnect = nil,
    --gom
    gom = false,
    -- popup
    popuptable = {},
    popup = false,
    popupconnect = nil,
    -- waterpuddle
    waterpuddletable = {},
    waterpuddle = false,
    waterpuddleconnect = nil,
    -- antifear
    antifeartable = {},
    antifear = false,
    antifearconnect = nil,
    -- triggerlandmine
    triggerlandminetable = {},
    triggerlandmine = false,
    triggerlandmineconnect = nil,
    -- walklandmines
    walklandminetable = {},
    walklandmines = false,
    walklandmineconnect = nil,
    -- fans
    fanstable = {},
    fans = false,
    fansconnect = nil,
    -- counter
    counter = false,
    -- keypad
    keypadtable = {},
    -- autogenerator
    autogeneratortable = {},
    autogenerator = false,
    autogeneratorconnect = nil,
    -- ammo
    ammotable = {},
    ammo = false,
    ammoconnect = nil,
    ammo2connect = nil,
    -- ammoaura
    ammoauratable = {},
    ammoaura = false,
    ammoauraconnect = nil,
    ammoaura2connect = nil,
    -- zombie
    zombietable = {},
    zombie = false,
    zombieconnect = nil,
}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local speed = 1
local moveDir = Vector3.zero
local connection
local connection2
local connection3
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
local function startTPWalk()
    if connection then return end

    connection = RunService.Heartbeat:Connect(function()
        local char = player.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if moveDir.Magnitude > 0 then
            local camCF = camera.CFrame
            local direction = camCF:VectorToWorldSpace(moveDir)
            direction = Vector3.new(direction.X, 0, direction.Z)

            if direction.Magnitude > 0 then
                direction = direction.Unit
                hrp.CFrame = hrp.CFrame + (direction * speed * 0.1)
            end
        end
    end)
end
local function stopTPWalk()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    resetKeys()
end

local function startTPWalk2()
    if connection2 then return end

    connection2 = RunService.Heartbeat:Connect(function()
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
local function stopTPWalk2()
    if connection2 then
        connection2:Disconnect()
        connection2 = nil
    end
    resetKeys()
end

local function startTPWalk3()
    if connection3 then return end

    connection3 = RunService.Heartbeat:Connect(function()
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
local function stopTPWalk3()
    if connection3 then
        connection3:Disconnect()
        connection3 = nil
    end
    resetKeys()
end

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Pressure", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Useful For Evading Anglers")

MainSection:NewSlider("Set Speed", "Changed How Fast TP Walk Is", 10, 1, function(s) -- 10 (MaxValue) | 1 (MinValue)
    speed = s
end)

MainSection:NewToggle("TP Walk", "Increase Movement Speed", function(state)
    if state then
        startTPWalk()
    else
        stopTPWalk()
    end
end)

MainSection:NewToggle("TP Walk With Better Swimming", "Increase Movement Speed", function(state)
    if state then
        startTPWalk2()
    else
        stopTPWalk2()
    end
end)

MainSection:NewToggle("Fly", "Fly In The Air", function(state)
    if state then
        startTPWalk3()
        local RunService = game:GetService("RunService")
        local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        features.flyconnect = RunService.Heartbeat:Connect(function()
            local velocity = root.AssemblyLinearVelocity
            root.AssemblyLinearVelocity = Vector3.zero
            game.workspace.Gravity = 0
        end)
    else
        stopTPWalk3()
        features.flyconnect:Disconnect()
        game.workspace.Gravity = 196.2
    end
end)

MainSection:NewToggle("Infinite Jump", "Increase Velocity Every Jump", function(state)
    if state then
        features.inputconnect = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then
                return
            end
            if input.KeyCode == Enum.KeyCode.Space then
                game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity + Vector3.new(0, 60, 0)
            end
        end)
    else
        features.inputconnect:Disconnect()
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

MainSection:NewToggle("Instant Interaction", "No Need To Hold", function(state)
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

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Behind Walls")

ESPSection:NewToggle("Asset ESP", "See All Assets", function(state)
    if state then
        features.assets = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(features.assettable, v)
            end
        end
        features.assetconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(features.assettable, v)
            end
        end)
        while task.wait(0.1) do
            if features.assets then
                xpcall(function()
                    for i = #features.assettable, 1, -1 do
                        local v = features.assettable[i]
                        if not v or not v.Parent then
                            table.remove(features.assettable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                if not v:FindFirstChild("ESPHighlight") then
                                    local highlight = Instance.new("Highlight")
                                    highlight.Name = "ESPHighlight"
                                    highlight.FillColor = Color3.new(1, 1, 0)
                                    highlight.OutlineTransparency = 1
                                    highlight.Parent = v
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Asset ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.assets == false then
                break
            end
        end
    else
        features.assets = false
        features.assetconnect:Disconnect()
        features.assettable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                if v:FindFirstChild("ESPHighlight") then
                    v.ESPHighlight:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Door ESP", "See All Doors", function(state)
    if state then
        features.doors = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v:IsA("Model") and (v.Name == "NormalDoor" or v.Name == "DoubleDoor" or v.Name == "DoubleDoorSewer") then
                table.insert(features.doortable, v)
            end
        end
        features.doorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if  v:IsA("Model") and (v.Name == "NormalDoor" or v.Name == "DoubleDoor" or v.Name == "DoubleDoorSewer") then
                table.insert(features.doortable, v)
            end
        end)
        while task.wait(0.1) do
            if features.doors then
                xpcall(function()
                    for i = #features.doortable, 1, -1 do
                        local v = features.doortable[i]
                        if not v or not v.Parent then
                            table.remove(features.doortable, i)
                        else
                            if v.Parent.Name == "DoubleDoor" or v.Parent.Name == "DoubleDoorSewer" then
                                table.remove(features.doortable, i)
                            end
                            if v.Name == "DoubleDoor" or v.Name == "DoubleDoorSewer" then
                                if v:GetAttribute("ProgressDoor") then
                                    for _, door in pairs(v:GetChildren()) do
                                        if door and door:FindFirstChild("OpenValue") then
                                            if not door.OpenValue.Value then
                                                if door:FindFirstChild("Door") then
                                                    if door:GetAttribute("Locked") then
                                                        if not door.Door:FindFirstChild("ESPHighlight") then
                                                            local highlight = Instance.new("Highlight")
                                                            highlight.Name = "ESPHighlight"
                                                            highlight.FillColor = Color3.fromRGB(100, 0, 100)
                                                            highlight.OutlineTransparency = 1
                                                            highlight.Parent = door.Door

                                                            local billboard = Instance.new("BillboardGui")
                                                            billboard.Name = "ESPBillboard"
                                                            billboard.Size = UDim2.new(0, 150, 0, 50)
                                                            billboard.StudsOffset = Vector3.new(0, 5, 0)
                                                            billboard.AlwaysOnTop = true
                                                            billboard.Parent = door.Door

                                                            local label = Instance.new("TextLabel")
                                                            label.Size = UDim2.new(1, 0, 1, 0)
                                                            label.Position = UDim2.new(0, 0, 0, 0)
                                                            label.BackgroundTransparency = 1
                                                            label.TextColor3 = Color3.new(1, 0, 1)
                                                            label.Text = tostring(v.Enter.Value)
                                                            label.Parent = billboard

                                                            local label = Instance.new("TextLabel")
                                                            label.Size = UDim2.new(1, 0, 1, 0)
                                                            label.Position = UDim2.new(0, 0, 0, 25)
                                                            label.BackgroundTransparency = 1
                                                            label.TextColor3 = Color3.new(1, 0, 1)
                                                            label.Text = "Locked"
                                                            label.Parent = billboard
                                                        end
                                                    else
                                                        if not door.Door:FindFirstChild("ESPHighlight") then
                                                            local highlight = Instance.new("Highlight")
                                                            highlight.Name = "ESPHighlight"
                                                            highlight.FillColor = Color3.fromRGB(0, 0, 100)
                                                            highlight.OutlineTransparency = 1
                                                            highlight.Parent = door.Door

                                                            local billboard = Instance.new("BillboardGui")
                                                            billboard.Name = "ESPBillboard"
                                                            billboard.Size = UDim2.new(0, 150, 0, 50)
                                                            billboard.StudsOffset = Vector3.new(0, 5, 0)
                                                            billboard.AlwaysOnTop = true
                                                            billboard.Parent = door.Door

                                                            local label = Instance.new("TextLabel")
                                                            label.Size = UDim2.new(1, 0, 1, 0)
                                                            label.Position = UDim2.new(0, 0, 0, 0)
                                                            label.BackgroundTransparency = 1
                                                            label.TextColor3 = Color3.new(0, 0, 1)
                                                            label.Text = tostring(v.Enter.Value)
                                                            label.Parent = billboard
                                                        end
                                                    end
                                                end
                                            else
                                                if door:FindFirstChild("Door") then
                                                    if door.Door:FindFirstChild("ESPHighlight") then
                                                        door.Door.ESPHighlight:Destroy()
                                                        door.Door.ESPBillboard:Destroy()
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            elseif v.Name == "NormalDoor" then
                                if v:GetAttribute("ProgressDoor") then
                                    if v and v:FindFirstChild("OpenValue") then
                                        if not v.OpenValue.Value then
                                            if v:FindFirstChild("Door") then
                                                if v:GetAttribute("Locked") then
                                                    if not v.Door:FindFirstChild("ESPHighlight") then
                                                        local highlight = Instance.new("Highlight")
                                                        highlight.Name = "ESPHighlight"
                                                        highlight.FillColor = Color3.fromRGB(100, 0, 100)
                                                        highlight.OutlineTransparency = 1
                                                        highlight.Parent = v.Door

                                                        local billboard = Instance.new("BillboardGui")
                                                        billboard.Name = "ESPBillboard"
                                                        billboard.Size = UDim2.new(0, 150, 0, 50)
                                                        billboard.StudsOffset = Vector3.new(0, 5, 0)
                                                        billboard.AlwaysOnTop = true
                                                        billboard.Parent = v.Door

                                                        local label = Instance.new("TextLabel")
                                                        label.Size = UDim2.new(1, 0, 1, 0)
                                                        label.Position = UDim2.new(0, 0, 0, 0)
                                                        label.BackgroundTransparency = 1
                                                        label.TextColor3 = Color3.new(1, 0, 1)
                                                        label.Text = tostring(v.Enter.Value)
                                                        label.Parent = billboard

                                                        local label = Instance.new("TextLabel")
                                                        label.Size = UDim2.new(1, 0, 1, 0)
                                                        label.Position = UDim2.new(0, 0, 0, 25)
                                                        label.BackgroundTransparency = 1
                                                        label.TextColor3 = Color3.new(1, 0, 1)
                                                        label.Text = "Locked"
                                                        label.Parent = billboard
                                                    end
                                                else
                                                    if not v.Door:FindFirstChild("ESPHighlight") then
                                                        local highlight = Instance.new("Highlight")
                                                        highlight.Name = "ESPHighlight"
                                                        highlight.FillColor = Color3.fromRGB(0, 0, 100)
                                                        highlight.OutlineTransparency = 1
                                                        highlight.Parent = v.Door

                                                        local billboard = Instance.new("BillboardGui")
                                                        billboard.Name = "ESPBillboard"
                                                        billboard.Size = UDim2.new(0, 150, 0, 50)
                                                        billboard.StudsOffset = Vector3.new(0, 5, 0)
                                                        billboard.AlwaysOnTop = true
                                                        billboard.Parent = v.Door

                                                        local label = Instance.new("TextLabel")
                                                        label.Size = UDim2.new(1, 0, 1, 0)
                                                        label.Position = UDim2.new(0, 0, 0, 0)
                                                        label.BackgroundTransparency = 1
                                                        label.TextColor3 = Color3.new(0, 0, 1)
                                                        label.Text = tostring(v.Enter.Value)
                                                        label.Parent = billboard
                                                    end
                                                end
                                            end
                                        else
                                            if v:FindFirstChild("Door") then
                                                if v.Door:FindFirstChild("ESPHighlight") then
                                                    v.Door.ESPHighlight:Destroy()
                                                    v.Door.ESPBillboard:Destroy()
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Door ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.doors == false then
                break
            end
        end
    else
        features.doors = false
        features.doorconnect:Disconnect()
        features.doortable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v:IsA("Model") and v.Name == "NormalDoor" then
                if v:FindFirstChild("Door") then
                    if v.Door:FindFirstChild("ESPHighlight") then
                        v.Door.ESPHighlight:Destroy()
                        v.Door.ESPBillboard:Destroy()
                    end
                end
            end
        end
    end
end)

ESPSection:NewToggle("Player ESP", "ESP The Players", function(state)
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
                                    if not character:FindFirstChild("ESPHighlight") then
                                        local highlight = Instance.new("Highlight")
                                        highlight.Name = "ESPHighlight"
                                        highlight.FillColor = Color3.new(0, 1, 0)
                                        highlight.Parent = character
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

ESPSection:NewToggle("Keycard ESP", "See All Keycards", function(state)
    if state then
        features.keycards = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(features.keycardtable, v)
            end
        end
        features.keycardconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(features.keycardtable, v)
            end
        end)
        while task.wait(0.1) do
            if features.keycards then
                xpcall(function()
                    for i = #features.keycardtable, 1, -1 do
                        local v = features.keycardtable[i]
                        if not v or not v.Parent then
                            table.remove(features.keycardtable, i)
                        else
                            if not v:FindFirstChild("ESPBillboard") then
                                if v.Name == "NormalKeyCard" then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 0.25, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(0, 1, 1)
                                    label.TextScaled = true
                                    label.Text = "Keycard"
                                    label.Parent = billboard
                                elseif v.Name == "InnerKeyCard" then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 0.25, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(0, 1, 1)
                                    label.TextScaled = true
                                    label.Text = "Purple Keycard"
                                    label.Parent = billboard
                                elseif v.Name == "RidgeKeyCard" then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 0.25, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(0, 1, 1)
                                    label.TextScaled = true
                                    label.Text = "Yellow Keycard"
                                    label.Parent = billboard
                                elseif v.Name == "PasswordPaper" then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 0.25, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(0, 1, 1)
                                    label.TextScaled = true
                                    label.Text = "Password"
                                    label.Parent = billboard
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Keycard ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.keycards == false then
                break
            end
        end
    else
        features.keycards = false
        features.keycardconnect:Disconnect()
        features.keycardtable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                if v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Battery ESP", "See All Batteries", function(state)
    if state then
        features.batteries = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "battery") then
                table.insert(features.batteriestable, v)
            end
        end
        features.batteriesconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "battery") then
                table.insert(features.batteriestable, v)
            end
        end)
        while task.wait(0.1) do
            if features.batteries then
                xpcall(function()
                    for i = #features.batteriestable, 1, -1 do
                        local v = features.batteriestable[i]
                        if not v or not v.Parent then
                            table.remove(features.batteriestable, i)
                        else
                            if not v:FindFirstChild("ESPBillboard") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESPBillboard"
                                billboard.Size = UDim2.new(0, 50, 0, 50)
                                billboard.StudsOffset = Vector3.new(0, 0, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = v

                                local label = Instance.new("TextLabel")
                                label.Size = UDim2.new(1, 0, 0.25, 0)
                                label.Position = UDim2.new(0, 0, 0, 0)
                                label.BackgroundTransparency = 1
                                label.TextColor3 = Color3.new(1, 1, 0)
                                label.TextScaled = true
                                label.Text = "Battery"
                                label.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Battery ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.batteries == false then
                break
            end
        end
    else
        features.batteries = false
        features.batteriesconnect:Disconnect()
        features.batteriestable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "battery") then
                if v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Item ESP", "See All Items", function(state)
    if state then
        features.items = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                    table.insert(features.itemtable, v)
                end
            end
        end
        features.itemconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                    table.insert(features.itemtable, v)
                end
            end
        end)
        for _, v in pairs(game.workspace.GameplayFolder.DroppedItems:GetChildren()) do
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                    table.insert(features.itemtable, v)
                end
            end
        end
        item2connect = game.workspace.GameplayFolder.DroppedItems.ChildAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                    table.insert(features.itemtable, v)
                end
            end
        end)
        while task.wait(0.1) do
            if features.items then
                xpcall(function()
                    for i = #features.itemtable, 1, -1 do
                        local v = features.itemtable[i]
                        if not v or not v.Parent then
                            table.remove(features.itemtable, i)
                        else
                            if v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                                if not v:FindFirstChild("ESPBillboard") then
                                    if tostring(v:GetAttribute("DisplayName")) ~= "nil" then
                                        local billboard = Instance.new("BillboardGui")
                                        billboard.Name = "ESPBillboard"
                                        billboard.Size = UDim2.new(0, 50, 0, 50)
                                        billboard.StudsOffset = Vector3.new(0, 0, 0)
                                        billboard.AlwaysOnTop = true
                                        billboard.Parent = v

                                        local label = Instance.new("TextLabel")
                                        label.Size = UDim2.new(1, 0, 0.25, 0)
                                        label.Position = UDim2.new(0, 0, 0, 0)
                                        label.BackgroundTransparency = 1
                                        label.TextColor3 = Color3.new(0, 1, 0)
                                        label.TextScaled = true
                                        label.Text = tostring(v:GetAttribute("DisplayName"))
                                        label.Parent = billboard
                                    end
                                end
                            elseif v.Name == "Blacklight" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" then
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 0.25, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(0, 1, 0)
                                    label.TextScaled = true
                                    label.Text = v.Name
                                    label.Parent = billboard
                                end
                            elseif v.Name == "BlueToyRemote" then
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 0.25, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(0, 1, 0)
                                    label.TextScaled = true
                                    label.Text = "Blue Toy Remote"
                                    label.Parent = billboard
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Item ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.items == false then
                break
            end
        end
    else
        features.items = false
        features.itemconnect:Disconnect()
        features.item2connect:Disconnect()
        features.itemtable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                end
            end
        end
        for _, v in pairs(game.workspace.GameplayFolder.DroppedItems:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                end
            end
        end
    end
end)

ESPSection:NewToggle("Locker ESP", "See All Lockers", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Locker" then
                table.insert(features.lockertable, v)
            end
        end
        features.lockerconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Locker" then
                table.insert(features.lockertable, v)
            end
        end)
        features.lockers = true
        while task.wait(0.1) do
            if features.lockers then
                xpcall(function()
                    for i = #features.lockertable, 1, -1 do
                        local v = features.lockertable[i]
                        if not v or not v.Parent then
                            table.remove(features.lockertable, i)
                        else
                            if not v:FindFirstChild("ESPHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "ESPHighlight"
                                highlight.FillColor = Color3.fromRGB(0, 100, 0)
                                highlight.OutlineTransparency = 1
                                highlight.Parent = v
                            end
                        end
                    end
                end, function(err)
                    warn("Locker ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.lockers == false then
                break
            end
        end
    else
        features.lockers = false
        features.lockerconnect:Disconnect()
        features.lockertable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Locker" then
                if v:FindFirstChild("ESPHighlight") then
                    v.ESPHighlight:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("NeoStyk ESP", "See All NeoStyks", function(state)
    if state then
        features.neostyks = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "neostyk") then
                table.insert(features.neostyktable, v)
            end
        end
        features.neostykconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "neostyk") then
                table.insert(features.neostyktable, v)
            end
        end)
        while task.wait(0.1) do
            if features.neostyks then
                xpcall(function()
                    for i = #features.neostyktable, 1, -1 do
                        local v = features.neostyktable[i]
                        if not v or not v.Parent then
                            table.remove(features.neostyktable, i)
                        else
                            if not v:FindFirstChild("ESPBillboard") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESPBillboard"
                                billboard.Size = UDim2.new(0, 50, 0, 50)
                                billboard.StudsOffset = Vector3.new(0, 0, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = v

                                local label = Instance.new("TextLabel")
                                label.Size = UDim2.new(1, 0, 0.25, 0)
                                label.Position = UDim2.new(0, 0, 0, 0)
                                label.BackgroundTransparency = 1
                                label.TextColor3 = Color3.new(0, 1, 1)
                                label.TextScaled = true
                                label.Text = "NeoStyk"
                                label.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("NeoStyk ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.neostyks == false then
                break
            end
        end
    else
        features.neostyks = false
        features.neostykconnect:Disconnect()
        features.neostyktable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "neostyk") then
                if v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Fake Door ESP", "See All Fake Doors", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v.Name == "TricksterRoom" and v:IsA("Model") then
                table.insert(features.fakedoortable, v)
            end
        end
        features.fakedoorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v.Name == "TricksterRoom" and v:IsA("Model") then
                table.insert(features.fakedoortable, v)
            end
        end)
        features.fakedoors = true
        while task.wait(0.1) do
            if features.fakedoors then
                xpcall(function()
                    for i = #features.fakedoortable, 1, -1 do
                        local v = features.fakedoortable[i]
                        if not v or not v.Parent then
                            table.remove(features.fakedoortable, i)
                        else
                            if not v:FindFirstChild("ESPBillboard") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESPBillboard"
                                billboard.Size = UDim2.new(0, 50, 0, 50)
                                billboard.StudsOffset = Vector3.new(0, 0, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = v

                                local label = Instance.new("TextLabel")
                                label.Size = UDim2.new(1, 0, 0.25, 0)
                                label.Position = UDim2.new(0, 0, 0, 0)
                                label.BackgroundTransparency = 1
                                label.TextColor3 = Color3.new(1, 0, 0)
                                label.TextScaled = true
                                label.Text = "Fake Door"
                                label.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Fake Door ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.fakedoors == false then
                break
            end
        end
    else
        features.fakedoors = false
        features.fakedoorconnect:Disconnect()
        features.fakedoortable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v.Name == "TricksterRoom" and v:IsA("Model") then
                if v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Tripwire ESP", "See All Tripwires", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Tripwire" then
                table.insert(features.tripwiretable, v)
            end
        end
        features.tripwireconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Tripwire" then
                table.insert(features.tripwiretable, v)
            end
        end)
        features.tripwires = true
        while task.wait(0.1) do
            if features.tripwires then
                xpcall(function()
                    for i = #features.tripwiretable, 1, -1 do
                        local v = features.tripwiretable[i]
                        if not v or not v.Parent then
                            table.remove(features.tripwiretable, i)
                        else
                            if v:FindFirstChild("Main") then
                                if not v.Main:FindFirstChild("ESPBillboard") and v.Main.Transparency ~= 1 then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v.Main

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 0.25, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(0, 1, 1)
                                    label.TextScaled = true
                                    label.Text = "Tripwire"
                                    label.Parent = billboard
                                elseif v.Main:FindFirstChild("ESPBillboard") and v.Main.Transparency == 1 then
                                    v.Main.ESPBillboard:Destroy()
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Tripwire ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.tripwires == false then
                break
            end
        end
    else
        features.tripwires = false
        features.tripwireconnect:Disconnect()
        features.tripwiretable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Tripwire" then
                if v.Main:FindFirstChild("ESPBillboard") then
                    v.Main.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Landmine ESP", "See All Landmines", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Landmine" then
                table.insert(features.landminetable, v)
            end
        end
        features.landmineconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Landmine" then
                table.insert(features.landminetable, v)
            end
        end)
        features.landmines = true
        while task.wait(0.1) do
            if features.landmines then
                xpcall(function()
                    for i = #features.landminetable, 1, -1 do
                        local v = features.landminetable[i]
                        if not v or not v.Parent then
                            table.remove(features.landminetable, i)
                        else
                            if v:FindFirstChild("Main") then
                                if not v.Main:FindFirstChild("ESPBillboard") and v.Main.Transparency ~= 1 then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v.Main

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 0.25, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(0, 1, 1)
                                    label.TextScaled = true
                                    label.Text = "Landmine"
                                    label.Parent = billboard
                                elseif v.Main:FindFirstChild("ESPBillboard") and v.Main.Transparency == 1 then
                                    v.Main.ESPBillboard:Destroy()
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Landmine ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.landmines == false then
                break
            end
        end
    else
        features.landmines = false
        features.landmineconnect:Disconnect()
        features.landminetable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Landmine" then
                if v.Main:FindFirstChild("ESPBillboard") then
                    v.Main.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Node Monster ESP", "See All Node Monsters", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v:IsA("Part") then
                if v.Name == "A60" or v.Name == "A200" or v.Name == "Bleach" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" or v.Name == "Mirage" then
                    table.insert(features.nodetable, v)
                end
            end
        end
        features.nodeconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v:IsA("Part") then
                if v.Name == "A60" or v.Name == "A200" or v.Name == "Bleach" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" or v.Name == "Mirage" then
                    table.insert(features.nodetable, v)
                end
            end
        end)
        features.nodes = true
        while task.wait(0.1) do
            if features.nodes then
                xpcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for i = #features.nodetable, 1, -1 do
                        local v = features.nodetable[i]
                        if not v or not v.Parent then
                            table.remove(features.nodetable, i)
                        else
                            local distance = (hrp.Position - v.Position).Magnitude
                            local rounded = math.round(distance)
                            if not v:FindFirstChild("ESPBillboard") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESPBillboard"
                                billboard.Size = UDim2.new(0, 100, 0, 25)
                                billboard.StudsOffset = Vector3.new(0, 0, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = v

                                local label = Instance.new("TextLabel")
                                label.Size = UDim2.new(1, 0, 1, 0)
                                label.Position = UDim2.new(0, 0, 0, 0)
                                label.BackgroundTransparency = 1
                                label.TextColor3 = Color3.new(1, 0, 0)
                                label.TextScaled = true
                                label.Text = v.Name .. "[" .. rounded .. "]"
                                label.Parent = billboard
                            elseif v:FindFirstChild("ESPBillboard") then
                                v.ESPBillboard.TextLabel.Text = v.Name .. "[" .. rounded .. "]"
                            end
                        end
                    end
                end, function(err)
                    warn("Node Monster ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.nodes == false then
                break
            end
        end
    else
        features.nodes = false
        features.nodeconnect:Disconnect()
        features.nodetable = {}
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v:IsA("Part") then
                if v.Name == "A60" or v.Name == "A200" or v.Name == "Bleach" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" or v.Name == "Mirage" then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                end
            end
        end
    end
end)

ESPSection:NewToggle("Entity ESP", "See All Entities", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    table.insert(features.entitytable, v)
                end
            end
        end
        for _, v in pairs(game.workspace.GameplayFolder.Monsters:GetDescendants()) do
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    table.insert(features.entitytable, v)
                end
            end
        end
        for _, v in pairs(game.workspace.Camera:GetDescendants()) do
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    table.insert(features.entitytable, v)
                end
            end
        end
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    table.insert(features.entitytable, v)
                end
            end
        end
        features.entitiesconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    task.wait(1)
                    table.insert(features.entitytable, v)
                end
            end
        end)
        features.entities2connect = game.workspace.GameplayFolder.Monsters.DescendantAdded:Connect(function(v)
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    task.wait(1)
                    table.insert(features.entitytable, v)
                end
            end
        end)
        features.entities3connect = game.workspace.Camera.DescendantAdded:Connect(function(v)
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    task.wait(1)
                    table.insert(features.entitytable, v)
                end
            end
        end)
        features.entities4connect = game.workspace.ChildAdded:Connect(function(v)
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    task.wait(1)
                    table.insert(features.entitytable, v)
                end
            end
        end)
        features.entities5connect = game.Workspace.DescendantAdded:Connect(function(v)
            if v.Name == "DwellerModel" and v:IsA("Model") then
                task.wait(0.5)
                table.insert(features.entitytable, v)
            end
        end)
        features.entities = true
        while task.wait(0.1) do
            if features.entities then
                xpcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for i = #features.entitytable, 1, -1 do
                        local v = features.entitytable[i]
                        if not v or not v.Parent then
                            table.remove(features.entitytable, i)
                        else
                            if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Rebarb" then
                                local distance = (hrp.Position - v:GetPivot().Position).Magnitude
                                local rounded = math.round(distance)
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 100, 0, 25)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(1, 0, 0)
                                    label.TextScaled = true
                                    label.Text = v.Name .. "[" .. rounded .. "]"
                                    label.Parent = billboard
                                elseif v:FindFirstChild("ESPBillboard") then
                                    v.ESPBillboard.TextLabel.Text = v.Name .. "[" .. rounded .. "]"
                                end
                            elseif v.Name == "BiggerStatue" then
                                local distance = (hrp.Position - v:GetPivot().Position).Magnitude
                                local rounded = math.round(distance)
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 100, 0, 25)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(1, 0, 0)
                                    label.TextScaled = true
                                    label.Text = "Candlebrute" .. "[" .. rounded .. "]"
                                    label.Parent = billboard
                                elseif v:FindFirstChild("ESPBillboard") then
                                    v.ESPBillboard.TextLabel.Text = "Candlebrute" .. "[" .. rounded .. "]"
                                end
                            elseif v.Name == "Statue" then
                                local distance = (hrp.Position - v:GetPivot().Position).Magnitude
                                local rounded = math.round(distance)
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 100, 0, 25)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(1, 0, 0)
                                    label.TextScaled = true
                                    label.Text = "Candlebearer" .. "[" .. rounded .. "]"
                                    label.Parent = billboard
                                elseif v:FindFirstChild("ESPBillboard") then
                                    v.ESPBillboard.TextLabel.Text = "Candlebearer" .. "[" .. rounded .. "]"
                                end
                            elseif v.Name == "DwellerModel" then
                                local distance = (hrp.Position - v:GetPivot().Position).Magnitude
                                local rounded = math.round(distance)
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 100, 0, 25)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(1, 0, 0)
                                    label.TextScaled = true
                                    label.Text = "WallDweller" .. "[" .. rounded .. "]"
                                    label.Parent = billboard
                                elseif v:FindFirstChild("ESPBillboard") then
                                    v.ESPBillboard.TextLabel.Text = "WallDweller" .. "[" .. rounded .. "]"
                                end
                            elseif v.Name == "SkinlessCorpse" then
                                local distance = (hrp.Position - v:GetPivot().Position).Magnitude
                                local rounded = math.round(distance)
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 100, 0, 25)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(1, 0, 0)
                                    label.TextScaled = true
                                    label.Text = "Skinless" .. "[" .. rounded .. "]"
                                    label.Parent = billboard
                                elseif v:FindFirstChild("ESPBillboard") then
                                    v.ESPBillboard.TextLabel.Text = "Skinless" .. "[" .. rounded .. "]"
                                end
                            elseif v.Name == "Coagulate" then
                                local distance = (hrp.Position - v:GetPivot().Position).Magnitude
                                local rounded = math.round(distance)
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 100, 0, 25)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(1, 0, 0)
                                    label.TextScaled = true
                                    label.Text = "Coagulate" .. "[" .. rounded .. "]"
                                    label.Parent = billboard
                                elseif v:FindFirstChild("ESPBillboard") then
                                    v.ESPBillboard.TextLabel.Text = "Coagulate" .. "[" .. rounded .. "]"
                                end
                            elseif v.Name == "TreeBody" then
                                local distance = (hrp.Position - v.Position).Magnitude
                                local rounded = math.round(distance)
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 100, 0, 25)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(1, 0, 0)
                                    label.TextScaled = true
                                    label.Text = "Eden Tree" .. "[" .. rounded .. "]"
                                    label.Parent = billboard
                                elseif v:FindFirstChild("ESPBillboard") then
                                    v.ESPBillboard.TextLabel.Text = "Eden Tree" .. "[" .. rounded .. "]"
                                end
                            elseif v.Name == "CementShoes" then
                                local distance = (hrp.Position - v:GetPivot().Position).Magnitude
                                local rounded = math.round(distance)
                                if not v:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 100, 0, 25)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(1, 0, 0)
                                    label.TextScaled = true
                                    label.Text = "Cement Shoes" .. "[" .. rounded .. "]"
                                    label.Parent = billboard
                                elseif v:FindFirstChild("ESPBillboard") then
                                    v.ESPBillboard.TextLabel.Text = "Cement Shoes" .. "[" .. rounded .. "]"
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Entity ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.entities == false then
                break
            end
        end
    else
        features.entities = false
        features.entitiesconnect:Disconnect()
        features.entities2connect:Disconnect()
        features.entities3connect:Disconnect()
        features.entities4connect:Disconnect()
        features.entitytable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "BiggerStatue" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "DwellerModel" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                end
            end
        end
        for _, v in pairs(game.workspace.GameplayFolder.Monsters:GetDescendants()) do
            if v and v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "BiggerStatue" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "DwellerModel" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                end
            end
        end
        for _, v in pairs(game.workspace.Camera:GetDescendants()) do
            if v and v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "BiggerStatue" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "DwellerModel" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                end
            end
        end
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "BiggerStatue" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "DwellerModel" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                end
            end
        end
    end
end)

ESPSection:NewToggle("Generator ESP", "See All Generators", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                table.insert(features.generatortable, v)
            end
        end
        features.generatorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                table.insert(features.generatortable, v)
            end
        end)
        features.generators = true
        while task.wait(0.1) do
            if features.generators then
                xpcall(function()
                    for i = #features.generatortable, 1, -1 do
                        local v = features.generatortable[i]
                        if not v or not v.Parent then
                            table.remove(features.generatortable, i)
                        else
                            if v:FindFirstChild("Fixed") then
                                if v.Fixed.Value ~= 100 and not v.Model:FindFirstChild("ESPBillboard") then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 0, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v.Model

                                    local label = Instance.new("TextLabel")
                                    label.Size = UDim2.new(1, 0, 0.25, 0)
                                    label.Position = UDim2.new(0, 0, 0, 0)
                                    label.BackgroundTransparency = 1
                                    label.TextColor3 = Color3.new(0, 0, 1)
                                    label.TextScaled = true
                                    label.Text = "Generator"
                                    label.Parent = billboard
                                elseif v.Fixed.Value == 100 and v.Model:FindFirstChild("ESPBillboard") then
                                    v.Model.ESPBillboard:Destroy()
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Generator ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.generators == false then
                break
            end
        end
    else
        features.generators = false
        features.generatorconnect:Disconnect()
        features.generatortable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                if v.Model:FindFirstChild("ESPBillboard") then
                    v.Model.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Water Puddle ESP", "See All Water Puddles", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "WaterPuddle" then
                table.insert(features.waterpuddlestable, v)
            end
        end
        features.waterpuddlesconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "WaterPuddle" then
                table.insert(features.waterpuddlestable, v)
            end
        end)
        features.waterpuddles = true
        while task.wait(0.1) do
            if features.waterpuddles then
                xpcall(function()
                    for i = #features.waterpuddlestable, 1, -1 do
                        local v = features.waterpuddlestable[i]
                        if not v or not v.Parent then
                            table.remove(features.waterpuddlestable, i)
                        else
                            if v and not v:FindFirstChild("ESPBillboard") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESPBillboard"
                                billboard.Size = UDim2.new(0, 50, 0, 50)
                                billboard.StudsOffset = Vector3.new(0, 0, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = v

                                local label = Instance.new("TextLabel")
                                label.Size = UDim2.new(1, 0, 0.25, 0)
                                label.Position = UDim2.new(0, 0, 0, 0)
                                label.BackgroundTransparency = 1
                                label.TextColor3 = Color3.new(1, 1, 0)
                                label.TextScaled = true
                                label.Text = "Water Puddle"
                                label.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Water Puddle ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.waterpuddles == false then
                break
            end
        end
    else
        features.waterpuddles = false
        features.waterpuddlesconnect:Disconnect()
        features.waterpuddlestable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "WaterPuddle" then
                if v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

local Aura = Window:NewTab("Aura")
local AuraSection = Aura:NewSection("Grab Things Close To You")

AuraSection:NewToggle("Grab All Assets Near You", "Grabs All Close Assets", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(features.assetauratable, v)
            end
        end
        features.assetauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(features.assetauratable, v)
            end
        end)
        features.assetaura = true
        while task.wait(0.1) do
            if features.assetaura then
                xpcall(function()
                    for i = #features.assetauratable, 1, -1 do
                        local v = features.assetauratable[i]
                        if not v or not v.Parent then
                            table.remove(features.assetauratable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ProxyPart.Position).Magnitude
                                if distance <= 15 then
                                    fireproximityprompt(v.ProxyPart.ProximityPrompt)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Grab All Assets Error")
                    warn(debug.traceback(err))
                end)
            elseif features.assetaura == false then
                break
            end
        end
    else
        features.assetaura = false
        features.assetauraconnect:Disconnect()
        features.assetauratable = {}
    end
end)

AuraSection:NewToggle("Grab All Keycards Near You", "Grabs All Close Keycards", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(features.keycardauratable, v)
            end
        end
        features.keycardauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(features.keycardauratable, v)
            end
        end)
        features.keycardaura = true
        while task.wait(0.1) do
            if features.keycardaura then
                xpcall(function()
                    for i = #features.keycardauratable, 1, -1 do
                        local v = features.keycardauratable[i]
                        if not v or not v.Parent then
                            table.remove(features.keycardauratable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ProxyPart.Position).Magnitude
                                if distance <= 15 then
                                    fireproximityprompt(v.ProxyPart.ProximityPrompt)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Grab All Keycards Error")
                    warn(debug.traceback(err))
                end)
            elseif features.keycardaura == false then
                break
            end
        end
    else
        features.keycardaura = false
        features.keycardauraconnect:Disconnect()
        features.keycardauratable = {}
    end
end)

AuraSection:NewToggle("Grab All Items Near You", "Grabs All Close Items", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                    table.insert(features.itemauratable, v)
                end
            end
        end
        features.itemauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                    table.insert(features.itemauratable, v)
                end
            end
        end)
        features.itemaura = true
        while task.wait(0.1) do
            if features.itemaura then
                xpcall(function()
                    for i = #features.itemauratable, 1, -1 do
                        local v = features.itemauratable[i]
                        if not v or not v.Parent then
                            table.remove(features.itemauratable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ProxyPart.Position).Magnitude
                                if distance <= 15 then
                                    fireproximityprompt(v.ProxyPart.ProximityPrompt)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Grab All Items Error")
                    warn(debug.traceback(err))
                end)
            elseif features.itemaura == false then
                break
            end
        end
    else
        features.itemaura = false
        features.itemauraconnect:Disconnect()
        features.itemauratable = {}
    end
end)

AuraSection:NewToggle("Grab All NeoStyks Near You", "Grabs All Close NeoStyks", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and string.find(string.lower(v.Name), "neostyk") then
                table.insert(features.neostykauratable, v)
            end
        end
        features.neostykauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and string.find(string.lower(v.Name), "neostyk") then
                table.insert(features.neostykauratable, v)
            end
        end)
        features.neostykaura = true
        while task.wait(0.1) do
            if features.neostykaura then
                xpcall(function()
                    for i = #features.neostykauratable, 1, -1 do
                        local v = features.neostykauratable[i]
                        if not v or not v.Parent then
                            table.remove(features.neostykauratable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ProxyPart.Position).Magnitude
                                if distance <= 15 then
                                    fireproximityprompt(v.ProxyPart.ProximityPrompt)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Grab All NeoStyks Error")
                    warn(debug.traceback(err))
                end)
            elseif features.neostykaura == false then
                break
            end
        end
    else
        features.neostykaura = false
        features.neostykauraconnect:Disconnect()
        features.neostykauratable = {}
    end
end)

AuraSection:NewToggle("Grab All Batteries Near You", "Grabs All Close Batteries", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and string.find(string.lower(v.Name), "battery") then
                table.insert(features.batteryauratable, v)
            end
        end
        features.batteryauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and string.find(string.lower(v.Name), "battery") then
                table.insert(features.batteryauratable, v)
            end
        end)
        features.batteryaura = true
        while task.wait(0.1) do
            if features.batteryaura then
                xpcall(function()
                    for i = #features.batteryauratable, 1, -1 do
                        local v = features.batteryauratable[i]
                        if not v or not v.Parent then
                            table.remove(features.batteryauratable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ProxyPart.Position).Magnitude
                                if distance <= 15 then
                                    fireproximityprompt(v.ProxyPart.ProximityPrompt)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Grab All NeoStyks Error")
                    warn(debug.traceback(err))
                end)
            elseif features.batteryaura == false then
                break
            end
        end
    else
        features.batteryaura = false
        features.batteryauraconnect:Disconnect()
        features.batteryauratable = {}
    end
end)

AuraSection:NewToggle("Disarm Nearby Tripwires", "Disarms Them When Close", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Tripwire" then
                table.insert(features.tripwireauratable, v)
            end
        end
        features.tripwireauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Tripwire" then
                table.insert(features.tripwireauratable, v)
            end
        end)
        features.tripwireaura = true
        while task.wait(0.1) do
            if features.tripwireaura then
                xpcall(function()
                    for i = #features.tripwireauratable, 1, -1 do
                        local v = features.tripwireauratable[i]
                        if not v or not v.Parent then
                            table.remove(features.tripwireauratable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ProxyPart.Position).Magnitude
                                if distance <= 15 then
                                    fireproximityprompt(v.ProxyPart.ProximityPrompt)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Disarm Near Tripwires Error")
                    warn(debug.traceback(err))
                end)
            elseif features.tripwireaura == false then
                break
            end
        end
    else
        features.tripwireaura = false
        features.tripwireauraconnect:Disconnect()
        features.tripwireauratable = {}
    end
end)

AuraSection:NewToggle("Disarm Nearby Landmines", "Diarms Them When Close", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(features.landmineauratable, v)
            end
        end
        features.landmineauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(features.landmineauratable, v)
            end
        end)
        features.landmineaura = true
        while task.wait(0.1) do
            if features.landmineaura then
                xpcall(function()
                    for i = #features.landmineauratable, 1, -1 do
                        local v = features.landmineauratable[i]
                        if not v or not v.Parent then
                            table.remove(features.landmineauratable, i)
                        else
                            if v:FindFirstChild("ProximityPrompt") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
                                if distance <= 15 then
                                    fireproximityprompt(v.ProximityPrompt)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Disarm Near Landmines Error")
                    warn(debug.traceback(err))
                end)
            elseif features.landmineaura == false then
                break
            end
        end
    else
        features.landmineaura = false
        features.landmineauraconnect:Disconnect()
        features.landmineauratable = {}
    end
end)

AuraSection:NewToggle("Grab Assets Through Walls", "Simpler Grab All Assets", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(features.grabassettable, v)
            end
        end
        features.grabassetconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(features.grabassettable, v)
            end
        end)
        features.grabasset = true
        while task.wait(0.1) do
            if features.grabasset then
                xpcall(function()
                    for i = #features.grabassettable, 1, -1 do
                        local v = features.grabassettable[i]
                        if not v or not v.Parent then
                            table.remove(features.grabassettable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                v.ProxyPart.ProximityPrompt.RequiresLineOfSight = false
                                v.ProxyPart.ProximityPrompt.MaxActivationDistance = 15
                            end
                        end
                    end
                end, function(err)
                    warn("Grab Assets Through Walls Error")
                    warn(debug.traceback(err))
                end)
            elseif features.grabasset == false then
                break
            end
        end
    else
        features.grabasset = false
        features.grabassetconnect:Disconnect()
        features.grabassettable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                if v:FindFirstChild("ProxyPart") then
                    v.ProxyPart.ProximityPrompt.RequiresLineOfSight = true
                    v.ProxyPart.ProximityPrompt.MaxActivationDistance = 6
                end
            end
        end
    end
end)

AuraSection:NewToggle("Grab Keycards Through Walls", "Simpler Grab All Keycards", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(features.grabkeycardtable, v)
            end
        end
        features.grabkeycardconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(features.grabkeycardtable, v)
            end
        end)
        features.grabkeycard = true
        while task.wait(0.1) do
            if features.grabkeycard then
                xpcall(function()
                    for i = #features.grabkeycardtable, 1, -1 do
                        local v = features.grabkeycardtable[i]
                        if not v or not v.Parent then
                            table.remove(features.grabkeycardtable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                v.ProxyPart.ProximityPrompt.RequiresLineOfSight = false
                                v.ProxyPart.ProximityPrompt.MaxActivationDistance = 15
                            end
                        end
                    end
                end, function(err)
                    warn("Grab Keycards Through Walls Error")
                    warn(debug.traceback(err))
                end)
            elseif features.grabkeycard == false then
                break
            end
        end
    else
        features.grabkeycard = false
        features.grabkeycardconnect:Disconnect()
        features.grabkeycardtable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                if v:FindFirstChild("ProxyPart") then
                    v.ProxyPart.ProximityPrompt.RequiresLineOfSight = true
                    v.ProxyPart.ProximityPrompt.MaxActivationDistance = 6
                end
            end
        end
    end
end)

AuraSection:NewToggle("Grab Items Through Walls", "Simpler Grab All Items", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(features.grabitemtable, v)
                end
            end
        end
        features.grabitemconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint" then
                    table.insert(features.grabitemtable, v)
                end
            end
        end)
        features.grabitem = true
        while task.wait(0.1) do
            if features.grabitem then
                xpcall(function()
                    for i = #features.grabitemtable, 1, -1 do
                        local v = features.grabitemtable[i]
                        if not v or not v.Parent then
                            table.remove(features.grabitemtable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                v.ProxyPart.ProximityPrompt.RequiresLineOfSight = false
                                v.ProxyPart.ProximityPrompt.MaxActivationDistance = 15
                            end
                        end
                    end
                end, function(err)
                    warn("Grab Items Through Walls Error")
                    warn(debug.traceback(err))
                end)
            elseif features.grabitem == false then
                break
            end
        end
    else
        features.grabitem = false
        features.grabitemconnect:Disconnect()
        features.grabitemtable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" or v.Name == "CrateBlacklight" or v.Name == "CrateBook" or v.Name == "CrateCodeBreacher" or v.Name == "CrateDefib" or v.Name == "CrateFlashBeacon" or v.Name == "CrateFlashlight" or v.Name == "CrateGravelight" or v.Name == "CrateGummylight" or v.Name == "CrateHealthBoost" or v.Name == "CrateLantern" or v.Name == "CrateMedkit" or v.Name == "CrateWindupLight" or v.Name == "DoubleSprint") then
                if v:FindFirstChild("ProxyPart") then
                    v.ProxyPart.ProximityPrompt.RequiresLineOfSight = true
                    v.ProxyPart.ProximityPrompt.MaxActivationDistance = 6
                end
            end
        end
    end
end)

AuraSection:NewToggle("Grab Neostyks Through Walls", "Simpler Grab All Neostyks", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "neostyk")) then
                table.insert(features.grabneostyktable, v)
            end
        end
        features.grabneostykconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "neostyk")) then
                table.insert(features.grabneostyktable, v)
            end
        end)
        features.grabneostyk = true
        while task.wait(0.1) do
            if features.grabneostyk then
                xpcall(function()
                    for i = #features.grabneostyktable, 1, -1 do
                        local v = features.grabneostyktable[i]
                        if not v or not v.Parent then
                            table.remove(features.grabneostyktable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                v.ProxyPart.ProximityPrompt.RequiresLineOfSight = false
                                v.ProxyPart.ProximityPrompt.MaxActivationDistance = 15
                            end
                        end
                    end
                end, function(err)
                    warn("Grab Neostyks Through Walls Error")
                    warn(debug.traceback(err))
                end)
            elseif features.grabneostyk == false then
                break
            end
        end
    else
        features.grabneostyk = false
        features.grabneostykconnect:Disconnect()
        features.grabneostyktable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "neostyk")) then
                if v:FindFirstChild("ProxyPart") then
                    v.ProxyPart.ProximityPrompt.RequiresLineOfSight = true
                    v.ProxyPart.ProximityPrompt.MaxActivationDistance = 6
                end
            end
        end
    end
end)

AuraSection:NewToggle("Grab Batteries Through Walls", "Simpler Grab All Batteries", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "battery")) then
                table.insert(features.grabbatterytable, v)
            end
        end
        features.grabbatteryconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "battery")) then
                table.insert(features.grabbatterytable, v)
            end
        end)
        features.grabbattery = true
        while task.wait(0.1) do
            if features.grabbattery then
                xpcall(function()
                    for i = #features.grabbatterytable, 1, -1 do
                        local v = features.grabbatterytable[i]
                        if not v or not v.Parent then
                            table.remove(features.grabbatterytable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                v.ProxyPart.ProximityPrompt.RequiresLineOfSight = false
                                v.ProxyPart.ProximityPrompt.MaxActivationDistance = 15
                            end
                        end
                    end
                end, function(err)
                    warn("Grab Batteries Through Walls Error")
                    warn(debug.traceback(err))
                end)
            elseif features.grabbattery == false then
                break
            end
        end
    else
        features.grabbattery = false
        features.grabbatteryconnect:Disconnect()
        features.grabbatterytable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "battery")) then
                if v:FindFirstChild("ProxyPart") then
                    v.ProxyPart.ProximityPrompt.RequiresLineOfSight = true
                    v.ProxyPart.ProximityPrompt.MaxActivationDistance = 6
                end
            end
        end
    end
end)

AuraSection:NewToggle("Disable All Drawer And Item Locker Prompts", "Helps You Not Click The Wrong Prompt", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "HighLight" or v.Name == "Door") then
                table.insert(features.disabledrawertable, v)
            end
        end
        features.disabledrawerconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v.Name == "HighLight" or v.Name == "Door") then
                table.insert(features.disabledrawertable, v)
            end
        end)
        features.disabledrawer = true
        while task.wait(0.1) do
            if features.disabledrawer then
                xpcall(function()
                    for i = #features.disabledrawertable, 1, -1 do
                        local v = features.disabledrawertable[i]
                        if not v or not v.Parent then
                            table.remove(features.disabledrawertable, i)
                        else
                            if (v.Parent.Name == "Drawer" and v.Parent:IsA("Folder")) or v.Parent.Name == "ItemLocker" then
                                v.ProximityPrompt.Enabled = false
                            end
                        end
                    end
                end, function(err)
                    warn("Disable Drawer Prompts Error")
                    warn(debug.traceback(err))
                end)
            elseif features.disabledrawer == false then
                break
            end
        end
    else
        features.disabledrawer = false
        features.disabledrawerconnect:Disconnect()
        features.disabledrawertable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "HighLight" or v.Name == "Door") then
                if v:FindFirstChild("ProximityPrompt") then
                    v.ProximityPrompt.Enabled = true
                end
            end
        end
    end
end)

local Visual = Window:NewTab("Visual")
local VisualSection = Visual:NewSection("Change How You See Stuff")

VisualSection:NewSlider("Fov Changer", "Change Your Field Of View", 120, 90, function(s) -- 120 (MaxValue) | 90 (MinValue)
    workspace.Camera.FieldOfView = s
end)

VisualSection:NewToggle("Freeze Current Fov", "Keeps Your Fov The Same", function(state)
    if state then
        features.freezefov = true
        local fov = game.workspace.Camera.FieldOfView
        while task.wait(0.05) do
            if features.freezefov then
                if game.workspace:FindFirstChild("Camera") then
                    game.workspace.Camera.FieldOfView = fov
                end
            elseif features.freezefov == false then
                break
            end
        end
    else
        features.freezefov = false
    end
end)

VisualSection:NewToggle("FullBright", "Brighten The Game", function(state)
    if state then
        local lighting = game:GetService("Lighting")
        lighting.ClockTime = 14
        lighting.GlobalShadows = false
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
        lighting.Brightness = 5
        lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        local lighting = game:GetService("Lighting")
        lighting.ClockTime = 0
        lighting.GlobalShadows = true
        lighting.Ambient = Color3.fromRGB(128, 128, 128)
        lighting.Brightness = 1
        lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end
end)

VisualSection:NewButton("Remove Fog From Modifiers", "Removes The Restless Dreams Modifier Fog", function()
    local lighting = game:GetService("Lighting")
    local atmosphere = lighting:FindFirstChildOfClass("Atmosphere")
    lighting.FogStart = 0
    lighting.FogEnd = 100000
    atmosphere.Density = 0
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FogParticle") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.FogParticle.PlayerFog:Destroy()
    end
end)

VisualSection:NewToggle("See Through View Model", "Makes Ur Body See Through", function(state)
    if state then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v and (v:IsA("Part") or v:IsA("MeshPart")) then
                v.Material = "ForceField"
                v.Color = Color3.new(1, 1, 1)
            end
        end
    else
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v and (v:IsA("Part") or v:IsA("MeshPart")) then
                v.Material = "Plastic"
            end
        end
    end
end)

VisualSection:NewToggle("See Through Held Item", "Makes Ur Held Item See Through", function(state)
    if state then
        features.seethrough = true
        while task.wait(0.1) do
            if features.seethrough then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v and v:IsA("Model") and (v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote") then
                        for _, v2 in pairs(v:GetDescendants()) do
                            if v2:IsA("Part") or v2:IsA("MeshPart") then
                                v2.Material = "ForceField"
                            end
                        end
                    end
                end
            elseif features.seethrough == false then
                break
            end
        end
    else
        features.seethrough = false
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v and v:IsA("Model") and (v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote") then
                for _, v2 in pairs(v:GetDescendants()) do
                    if v2:IsA("Part") or v2:IsA("MeshPart") then
                        v2.Material = "Plastic"
                    end
                end
            end
        end
    end
end)

local Notif = Window:NewTab("Notification")
local NotifSection = Notif:NewSection("Notify For Specific Things")

NotifSection:NewDropdown("Choose A Sound", "Choose The Notification Sound You Want", {"Windows 10", "Default Ding", "Steam", "Default Low", "XBOX", "GTA5", "Discord"}, function(currentOption)
    if currentOption == "Windows 10" then
        features.notifid = "rbxassetid://2389339814"
    elseif currentOption == "Default Ding" then
        features.notifid = "rbxassetid://130017098772572"
    elseif currentOption == "Steam" then
        features.notifid = "rbxassetid://139308638407157"
    elseif currentOption == "Default Low" then
        features.notifid = "rbxassetid://17208372272"
    elseif currentOption == "XBOX" then
        features.notifid = "rbxassetid://117934611310434"
    elseif currentOption == "GTA5" then
        features.notifid = "rbxassetid://116627196004523"
    elseif currentOption == "Discord" then
        features.notifid = "rbxassetid://117715907633385"
    end
    if game.SoundService:FindFirstChild("CustomNotifSound") then
        game.SoundService.CustomNotifSound.SoundId = features.notifid
        game.SoundService.CustomNotifSound:Play()
    end
end)


NotifSection:NewToggle("Notification Sound", "Sounds For Node Monster And Entity", function(state)
    if state then
        features.notif = true
        if not game.SoundService:FindFirstChild("CustomNotifSound") then
            local sound = Instance.new("Sound")
            sound.Name = "CustomNotifSound"
            sound.SoundId = notifid
            sound.Volume = 1
            sound.Parent = game.SoundService
        end
    else
        features.notif = false
        if game.SoundService:FindFirstChild("CustomNotifSound") then
            game.SoundService.CustomNotifSound:Destroy()
        end
    end
end)

NotifSection:NewToggle("Node Monster Notifications", "Notify When A Node Monster Spawns", function(state)
    if state then
        features.anglerconnect = game.workspace.ChildAdded:Connect(function(v)
            if v:IsA("Part") then
                if v.Name == "A60" or v.Name == "A200" or v.Name == "Bleach" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" or v.Name == "Mirage" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = v.Name .. " Has Spawned", Duration = 4,})
                    if features.notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                end
            end
        end)
    else
        features.anglerconnect:Disconnect()
    end
end)

NotifSection:NewToggle("Entity Notifications", "Notify When A Entity Spawns", function(state)
    if state then
        features.entityconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Rebarb" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = v.Name .. " Has Spawned", Duration = 4,})
                    if features.notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "BiggerState" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Candlebrute" .. " Has Spawned", Duration = 4,})
                    if features.notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.name == "State" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Candlebearer" .. " Has Spawned", Duration = 4,})
                    if features.notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "WallDweller" .. " Has Spawned", Duration = 4,})
                    if features.notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "SkinlessCorpse" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Skinless" .. " Has Spawned", Duration = 4,})
                    if features.notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "TreeBody" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Eden Tree" .. " Has Spawned", Duration = 4,})
                    if features.notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "CementShoes" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Cement Shoes" .. " Has Spawned", Duration = 4,})
                    if features.notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                end
            end
        end)
    else
        features.entityconnect:Disconnect()
    end
end)

NotifSection:NewToggle("Notify Node Monster In Chat", "Says It In Chat", function(state)
    if state then
        features.anglernotifconnect = game.workspace.ChildAdded:Connect(function(v)
            if v:IsA("Part") then
                if v.Name == "A60" or v.Name == "A200" or v.Name == "Bleach" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" or v.Name == "Mirage" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(v.Name .. " Has Spawned")
                end
            end
        end)
    else
        features.anglernotifconnect:Disconnect()
    end
end)

NotifSection:NewToggle("Notify Entity In Chat", "Say It In Chat", function(state)
    if state then
        features.entitynotifconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Rebarb" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(v.Name .. " Has Spawned")
                elseif v.Name == "BiggerState" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync("Candlebrute Has Spawned")
                elseif v.name == "State" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync("Candlebearer Has Spawned")
                elseif v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync("WallDweller Has Spawned")
                elseif v.Name == "SkinlessCorpse" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync("Skinless Has Spawned")
                elseif v.Name == "TreeBody" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync("Eden Tree Has Spawned")
                elseif v.Name == "CementShoes" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync("Cement Shoes Has Spawned")
                end
            end
        end)
    else
        features.entitynotifconnect:Disconnect()
    end
end)

local Anti = Window:NewTab("Anti")
local AntiSection = Anti:NewSection("Prevent Things")

AntiSection:NewToggle("Allow Risky Avoiding", "Allows Teleporting For Pandemonium And Pipsqueak", function(state)
    if state then
        features.risky = true
    else
        features.risky = false
    end
end)

AntiSection:NewSlider("Teleport Distance", "How Close Before It Telports", 500, 100, function(s) -- 500 (MaxValue) | 100 (MinValue)
    features.tpdistance = s
end)

AntiSection:NewToggle("Avoid Node Monsters", "Avoids Active Node Monsters", function(state)
    if state then
        local gui = Instance.new("ScreenGui")
        gui.Name = "Avoider"
        gui.Parent = game.Players.LocalPlayer.PlayerGui
        local label = Instance.new("TextLabel")
        label.Name = "Text"
        label.Text = "Status: Waiting"
        label.TextScaled = true
        label.Position = UDim2.new(0, 0, 0, 0)
        label.Size = UDim2.new(0, 200, 0, 50)
        label.Parent = gui
        local cando = false
        local name = ""
        local old = nil
        local finished = false
        features.avoidconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v:IsA("Part") then
                if not features.risky then
                    if v.Name == "Pandemonium" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
                        label.Text = "Status: Risky Is False For " .. v.Name
                        task.wait(1)
                        label.Text = "Status: Waiting"
                    end
                else
                    if v.Name == "Pandemonium" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" or v.Name == "Pipsqueak" then
                        cando = true
                        name = v.Name
                        label.Text = "Status: Detected " .. v.Name
                    end
                end
                if v.Name == "A60" or v.Name == "Bleach" or v.Name == "Angler" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" then
                    cando = true
                    name = v.Name
                    label.Text = "Status: Detected " .. v.Name
                end
            end
            if cando then
                local target = game.workspace:FindFirstChild(name)
                local doonce = false
                while task.wait(0.05) do
                    if not doonce then
                        if target and target.Parent then
                            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - target.Position).Magnitude
                            if distance <= features.tpdistance then
                                doonce = true
                                old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                label.Text = "Status: Teleporting"
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old + Vector3.new(100,200,100)
                            end
                        else
                            doonce = false
                            name = ""
                            cando = false
                            label.Text = "Status: Waiting"
                            break
                        end
                    end
                    if doonce then
                        if target and target.Parent then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old + Vector3.new(100,200,100)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            local distance = (old.Position - target.Position).Magnitude
                            if distance > features.tpdistance then
                                doonce = false
                                label.Text = "Status: Detected " .. name
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old
                            end
                        else
                            doonce = false
                            name = ""
                            cando = false
                            finished = true
                            break
                        end
                    end
                end
                if finished then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old
                    label.Text = "Status: Returning Back"
                    task.wait(1)
                    label.Text = "Status: Waiting"
                    finished = false
                    old = nil
                end
            end
        end)
    else
        features.avoidconnect:Disconnect()
        game.Players.LocalPlayer.PlayerGui.Avoider:Destroy()
    end
end)

AntiSection:NewToggle("Counter Entities Using Raycast", "Eyefest, Turret, Searchlight, Pip, Pande, Skinless, Eden", function(state)
    if state then
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local function createWall(name, size, offset)
            local character = player.Character
            local hrp = character:WaitForChild("HumanoidRootPart")
            local wall = Instance.new("Part")
            wall.Name = name
            wall.Size = size
            wall.CFrame = hrp.CFrame * CFrame.new(offset)
            wall.Anchored = false
            wall.CanCollide = false
            wall.Material = "ForceField"
            wall.Transparency = 0
            wall.Massless = true
            wall.Parent = game.workspace
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = hrp
            weld.Part1 = wall
            weld.Parent = wall
            return wall
        end
        local character = player.Character
        createWall("PlayerBoxFront", Vector3.new(8.2, 10.2, 1), Vector3.new(0, 0, -4))
        createWall("PlayerBoxBack", Vector3.new(8.2, 10.2, 1), Vector3.new(0, 0, 4))
        createWall("PlayerBoxLeft", Vector3.new(1, 10.2, 8.2), Vector3.new(-4, 0, 0))
        createWall("PlayerBoxRight", Vector3.new(1, 10.2, 8.2), Vector3.new(4, 0, 0))
        createWall("PlayerBoxTop", Vector3.new(8.2, 1, 8.2), Vector3.new(0, 5, 0))
        createWall("PlayerBoxBottom", Vector3.new(8.2, 1, 8.2), Vector3.new(0, -5, 0))
    else
        for _, v in pairs(game.workspace:GetChildren()) do
            if v.Name == "PlayerBoxFront" or v.Name == "PlayerBoxBack" or v.Name == "PlayerBoxLeft" or v.Name == "PlayerBoxRight" or v.Name == "PlayerBoxTop" or v.Name == "PlayerBoxBottom" then
                v:Destroy()
            end
        end
    end
end)

AntiSection:NewToggle("Remove Imaginary Friends", "Remove Those Annoying People", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v:IsA("Part") and v.Name == "FriendPart" then
                table.insert(features.imaginetable, v)
            end
        end
        features.imagineconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v:IsA("Part") and v.Name == "FriendPart" then
                table.insert(features.imaginetable, v)
            end
        end)
        features.imagine = true
        while task.wait(0.1) do
            if features.imagine then
                xpcall(function()
                    for i = #features.imaginetable, 1, -1 do
                        local v = features.imaginetable[i]
                        if not v or not v.Parent then
                            table.remove(features.imaginetable, i)
                        else
                            if v then
                                v:Destroy()
                            end
                        end
                    end
                end, function(err)
                    warn("Imagine Friend Error")
                    warn(debug.traceback(err))
                end)
            elseif features.imagine == false then
                break
            end
        end
    else
        features.imagine = false
        features.imagineconnect:Disconnect()
        features.imaginetable = {}
    end
end)

AntiSection:NewToggle("Anti Eyefestation", "Stops Eyefestation From Making You Look", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Eyefestation" then
                table.insert(features.eyefestationtable, v)
            end
        end
        features.eyefestationconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Eyefestation" then
                table.insert(features.eyefestationtable, v)
            end
        end)
        features.eyefestation = true
        while task.wait(0.1) do
            if features.eyefestation then
                xpcall(function()
                    for i = #features.eyefestationtable, 1, -1 do
                        local v = features.eyefestationtable[i]
                        if not v or not v.Parent then
                            table.remove(features.eyefestationtable, i)
                        else
                            if v then
                                v.Active.Value = false
                            end
                        end
                    end
                end, function(err)
                    warn("Anti Eyefestation Error")
                    warn(debug.traceback(err))
                end)
            elseif features.eyefestation == false then
                break
            end
        end
    else
        features.eyefestation = false
        features.eyefestationconnect:Disconnect()
        features.eyefestationtable = {}
    end
end)

AntiSection:NewToggle("Anti Pandemonium", "Removes Pandemonium", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v.Name == "Pandemonium" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
                table.insert(features.pandemoniumtable, v)
            end
        end
        features.pandemoniumconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v.Name == "Pandemonium" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
                table.insert(features.pandemoniumtable, v)
            end
        end)
        features.pandemonium = true
        while task.wait(0.1) do
            if features.pandemonium then
                xpcall(function()
                    for i = #features.pandemoniumtable, 1, -1 do
                        local v = features.pandemoniumtable[i]
                        if not v or not v.Parent then
                            table.remove(features.pandemoniumtable, i)
                        else
                            if v then
                                v:Destroy()
                            end
                        end
                    end
                end, function(err)
                    warn("Anti Pandemonium Error")
                    warn(debug.traceback(err))
                end)
            elseif features.pandemonium == false then
                break
            end
        end
    else
        features.pandemonium = false
        features.pandemoniumconnect:Disconnect()
        features.pandemoniumtable = {}
    end
end)

AntiSection:NewToggle("Anti Pipsqueak", "Removes Pipsqueak", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v.Name == "Pipsqueak" then
                table.insert(features.pipsqueaktable, v)
            end
        end
        features.pipsqueakconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v.Name == "Pipsqueak" then
                table.insert(features.pipsqueaktable, v)
            end
        end)
        features.pipsqueak = true
        while task.wait(0.1) do
            if features.pipsqueak then
                xpcall(function()
                    for i = #features.pipsqueaktable, 1, -1 do
                        local v = features.pipsqueaktable[i]
                        if not v or not v.Parent then
                            table.remove(features.pipsqueaktable, i)
                        else
                            if v then
                                v:Destroy()
                            end
                        end
                    end
                end, function(err)
                    warn("Anti Pipsqueak Error")
                    warn(debug.traceback(err))
                end)
            elseif features.pipsqueak == false then
                break
            end
        end
    else
        features.pipsqueak = false
        features.pipsqueakconnect:Disconnect()
        features.pipsqueaktable = {}
    end
end)

AntiSection:NewToggle("Anti Harbinger", "Removes Harbinger", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v.Name == "Harbinger" then
                table.insert(features.harbingertable, v)
            end
        end
        features.harbingerconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v.Name == "Harbinger" then
                table.insert(features.harbingertable, v)
            end
        end)
        features.harbinger = true
        while task.wait(0.1) do
            if features.harbinger then
                xpcall(function()
                    for i = #features.harbingertable, 1, -1 do
                        local v = features.harbingertable[i]
                        if not v or not v.Parent then
                            table.remove(features.harbingertable, i)
                        else
                            if v then
                                v:Destroy()
                            end
                        end
                    end
                end, function(err)
                    warn("Anti Harbinger Error")
                    warn(debug.traceback(err))
                end)
            elseif features.harbinger == false then
                break
            end
        end
    else
        features.harbinger = false
        features.harbingerconnect:Disconnect()
        features.harbingertable = {}
    end
end)

AntiSection:NewToggle("Anti Witching Hour", "Removes Witching Hour", function(state)
    if state then
        local Module = require(game.Players.LocalPlayer.PlayerGui.Main.Client.MainClient.WitchingHour)
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v.Name == "WitchingHour" then
                table.insert(features.witchtable, v)
            end
        end
        features.witchconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v.Name == "WitchingHour" then
                table.insert(features.witchtable, v)
            end
        end)
        features.witch = true
        while task.wait(0.1) do
            if features.witch then
                xpcall(function()
                    for i = #features.witchtable, 1, -1 do
                        local v = features.witchtable[i]
                        if not v or not v.Parent then
                            table.remove(features.witchtable, i)
                        else
                            if v then
                                if v == Module.Model then
                                    Module.Delete()
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Anti Witching Hour Error")
                    warn(debug.traceback(err))
                end)
            elseif features.witch == false then
                break
            end
        end
    else
        features.witch = false
        features.witchconnect:Disconnect()
        features.witchtable = {}
    end
end)

AntiSection:NewToggle("Anti Coagulate", "Removes Coagulate", function(state)
    if state then
        local Module = require(game.Players.LocalPlayer.PlayerGui.Main.Client.MainClient.LocalCoagulate)
        local idleAnimation = game.Players.LocalPlayer.PlayerGui.Main.Client.MainClient.LocalCoagulate.Idle
        local walkAnimation = game.Players.LocalPlayer.PlayerGui.Main.Client.MainClient.LocalCoagulate.Walk
        for _, v in pairs(game.workspace.Camera:GetChildren()) do
            if v and v.Name == "Coagulate" then
                table.insert(features.coagulatetable, v)
            end
        end
        features.coagulateconnect = game.workspace.Camera.ChildAdded:Connect(function(v)
            if v and v.Name == "Coagulate" then
                table.insert(features.coagulatetable, v)
            end
        end)
        features.coagulate = true
        while task.wait(0.1) do
            if features.coagulate then
                xpcall(function()
                    for i = #features.coagulatetable, 1, -1 do
                        local v = features.coagulatetable[i]
                        if not v or not v.Parent then
                            table.remove(features.coagulatetable, i)
                        else
                            if v then
                                task.wait(2)
                                local idleTrack
                                local walkTrack
                                for _, track in pairs(game.workspace.CurrentCamera.Coagulate.Humanoid.Animator:GetPlayingAnimationTracks()) do
                                    if idleAnimation and track.Animation.AnimationId == idleAnimation.AnimationId then
                                        idleTrack = track
                                    elseif walkAnimation and track.Animation.AnimationId == walkAnimation.AnimationId then
                                        walkTrack = track
                                    end
                                end
                                Module.Despawn(true, idleTrack, walkTrack)
                            end
                            table.remove(features.coagulatetable, i)
                        end
                    end
                end, function(err)
                    warn("Anti Coagulate Error")
                    warn(debug.traceback(err))
                end)
            elseif features.coagulate == false then
                break
            end
        end
    else
        features.coagulate = false
        features.coagulateconnect:Disconnect()
        features.coagulatetable = {}
    end
end)

AntiSection:NewToggle("Anti Skinless", "Removes Skinless", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v.Name == "SkinlessCorpse" then
                table.insert(features.skinlesstable, v)
            end
        end
        features.skinlessconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v.Name == "SkinlessCorpse" then
                table.insert(features.skinlesstable, v)
            end
        end)
        features.skinless = true
        while task.wait(0.1) do
            if features.skinless then
                xpcall(function()
                    for i = #features.skinlesstable, 1, -1 do
                        local v = features.skinlesstable[i]
                        if not v or not v.Parent then
                            table.remove(features.skinlesstable, i)
                        else
                            if v then
                                firesignal(game:GetService("ReplicatedStorage").Events.Skinless_Despawn.OnClientEvent)
                            end
                        end
                    end
                end, function(err)
                    warn("Anti Skinless Error")
                    warn(debug.traceback(err))
                end)
            elseif features.skinless == false then
                break
            end
        end
    else
        features.skinless = false
        features.skinlessconnect:Disconnect()
        features.skinlesstable = {}
    end
end)

AntiSection:NewToggle("Anti Eden Trees", "Kills Eden Trees", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                table.insert(features.edentreetable, v)
            end
        end
        features.edentreeconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                table.insert(features.edentreetable, v)
            end
        end)
        features.edentree = true
        while task.wait(0.1) do
            if features.edentree then
                xpcall(function()
                    for i = #features.edentreetable, 1, -1 do
                        local v = features.edentreetable[i]
                        if not v or not v.Parent then
                            table.remove(features.edentreetable, i)
                        else
                            if v then
                                if not v:FindFirstChild("TreeBody") then
                                    table.remove(features.edentreetable, i)
                                elseif v:FindFirstChild("TreeBody") then
                                    firesignal(v.RemoteEvent.OnClientEvent, "Kill")
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Anti Eden Tree Error")
                    warn(debug.traceback(err))
                end)
            elseif features.edentree == false then
                break
            end
        end
    else
        features.edentree = false
        features.edentreeconnect:Disconnect()
        features.edentreetable = {}
    end
end)

AntiSection:NewToggle("Anti Bobber Fish", "Removes The Bobber Fish", function(state)
    if state then
        local Module = require(game.Players.LocalPlayer.PlayerGui.Main.Client.MainClient.LocalFish)
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v and v.Name == "Fish" then
                table.insert(features.bobberfishtable, v)
            end
        end
        features.bobberfishconnect = game.Players.LocalPlayer.Character.ChildAdded:Connect(function(v)
            if v and v.Name == "Fish" then
                table.insert(features.bobberfishtable, v)
            end
        end)
        features.bobberfish = true
        while task.wait(0.1) do
            if features.bobberfish then
                xpcall(function()
                    for i = #features.bobberfishtable, 1, -1 do
                        local v = features.bobberfishtable[i]
                        if not v or not v.Parent then
                            table.remove(features.bobberfishtable, i)
                        else
                            if v then
                                task.wait(1)
                                Module.HideAll()
                            end
                        end
                    end
                end, function(err)
                    warn("Anti Bobber Fish Error")
                    warn(debug.traceback(err))
                end)
            elseif features.bobberfish == false then
                break
            end
        end
    else
        features.bobberfish = false
        features.bobberfishconnect:Disconnect()
        features.bobberfishtable = {}
    end
end)

AntiSection:NewToggle("Anti GOM", "Make Him Think Ur In A Locker", function(state)
    if state then
        local Module = require(game.Players.LocalPlayer.PlayerGui.Main.Client.MainClient)
        features.gom = true
        while task.wait(0.1) do
            if features.gom then
                Module.LockerState = true
            elseif features.gom == false then
                break
            end
        end
    else
        local Module = require(game.Players.LocalPlayer.PlayerGui.Main.Client.MainClient)
        features.gom = false
        Module.LockerState = false
    end
end)

AntiSection:NewToggle("Anti Popups", "Remove Painters Popups", function(state)
    if state then
        for _, v in pairs(game.Players.LocalPlayer.PlayerGui.Main:GetChildren()) do
            if v and v:IsA("Frame") and v.Name == "Popups" then
                table.insert(features.popuptable, v)
            end
        end
        features.popupconnect = game.Players.LocalPlayer.PlayerGui.Main.ChildAdded:Connect(function(v)
            if v and v:IsA("Frame") and v.Name == "Popups" then
                table.insert(features.popuptable, v)
            end
        end)
        features.popup = true
        while task.wait(0.1) do
            if features.popup then
                xpcall(function()
                    for i = #features.popuptable, 1, -1 do
                        local v = features.popuptable[i]
                        if not v or not v.Parent then
                            table.remove(features.popuptable, i)
                        else
                            v:Destroy()
                        end
                    end
                end, function(err)
                    warn("Popup Error")
                    warn(debug.traceback(err))
                end)
            elseif features.popup == false then
                break
            end
        end
    else
        features.popup = false
        features.popupconnect:Disconnect()
        features.popuptable = {}
    end
end)

AntiSection:NewToggle("No Slipping On Water Puddles", "Prevents You From Slipping On Water Puddles", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "WaterPuddle" then
                table.insert(features.waterpuddletable, v)
            end
        end
        features.waterpuddleconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "WaterPuddle" then
                table.insert(features.waterpuddletable, v)
            end
        end)
        features.waterpuddle = true
        while task.wait(0.1) do
            if features.waterpuddle then
                xpcall(function()
                    for i = #features.waterpuddletable, 1, -1 do
                        local v = features.waterpuddletable[i]
                        if not v or not v.Parent then
                            table.remove(features.waterpuddletable, i)
                        else
                            if v:FindFirstChild("HitBox") then
                                v.HitBox.CanTouch = false
                            end
                        end
                    end
                end, function(err)
                    warn("No Slip Water Puddles Error")
                    warn(debug.traceback(err))
                end)
            elseif features.waterpuddle == false then
                break
            end
        end
    else
        features.waterpuddle = false
        features.waterpuddleconnect:Disconnect()
        features.waterpuddletable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "WaterPuddle" then
                if v:FindFirstChild("HitBox") then
                    v.HitBox.CanTouch = true
                end
            end
        end
    end
end)

AntiSection:NewToggle("No Locker Claustrophobia", "Prevents You From Getting Kicked Out", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Locker" then
                table.insert(features.antifeartable, v)
            end
        end
        features.antifearconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Locker" then
                table.insert(features.antifeartable, v)
            end
        end)
        features.antifear = true
        while task.wait(0.1) do
            if features.antifear then
                xpcall(function()
                    for i = #features.antifeartable, 1, -1 do
                        local v = features.antifeartable[i]
                        if not v or not v.Parent then
                            table.remove(features.antifeartable, i)
                        else
                            v:SetAttribute("ClaustrophobiaStartTime", 9999)
                            v:SetAttribute("ClaustrophobiaKickOutTime", 9999)
                        end
                    end
                end, function(err)
                    warn("No Claustrophobia Error")
                    warn(debug.traceback(err))
                end)
            elseif features.antifear == false then
                break
            end
        end
    else
        features.antifear = false
        features.antifearconnect:Disconnect()
        features.antifeartable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Locker" then
                v:SetAttribute("ClaustrophobiaStartTime", 9)
                v:SetAttribute("ClaustrophobiaKickOutTime", 10)
            end
        end
    end
end)

local Fun = Window:NewTab("Fun")
local FunSection = Fun:NewSection("Fun Stuff To Entertain")

FunSection:NewToggle("Trigger All Landmines", "Cause Landmines To Detonate", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(features.triggerlandminetable, v)
            end
        end
        features.triggerlandmineconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(features.triggerlandminetable, v)
            end
        end)
        features.triggerlandmine = true
        while task.wait(0.1) do
            if features.triggerlandmine then
                xpcall(function()
                    for i = #features.triggerlandminetable, 1, -1 do
                        local v = features.triggerlandminetable[i]
                        if not v or not v.Parent then
                            table.remove(features.triggerlandminetable, i)
                        else
                            if v:FindFirstChild("TouchInterest") then
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                            end
                        end
                    end
                end, function(err)
                    warn("Trigger Landmine Error")
                    warn(debug.traceback(err))
                end)
            elseif features.triggerlandmine == false then
                break
            end
        end
    else
        features.triggerlandmine = false
        features.triggerlandmineconnect:Disconnect()
        features.triggerlandminetable = {}
    end
end)

FunSection:NewToggle("Walk On Landmines", "Prevents You From Triggering Landmines", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(features.walklandminetable, v)
            end
        end
        features.walklandmineconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(features.walklandminetable, v)
            end
        end)
        features.walklandmines = true
        while task.wait(0.1) do
            if features.walklandmines then
                xpcall(function()
                    for i = #features.walklandminetable, 1, -1 do
                        local v = features.walklandminetable[i]
                        if not v or not v.Parent then
                            table.remove(features.walklandminetable, i)
                        else
                            v.CanTouch = false
                        end
                    end
                end, function(err)
                    warn("Walk On Landmine Error")
                    warn(debug.traceback(err))
                end)
            elseif features.walklandmines == false then
                break
            end
        end
    else
        features.walklandmines = false
        features.walklandmineconnect:Disconnect()
        features.walklandminetable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                v.CanTouch = true
            end
        end
    end
end)

FunSection:NewToggle("Remove Abomination Fans", "Deletes All During Chase", function(state)
    if state then
        features.fans = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "chasefanmodel")) then
                table.insert(features.fanstable, v)
            end
        end
        features.fansconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "chasefanmodel")) then
                table.insert(features.fanstable, v)
            end
        end)
        while task.wait(0.1) do
            if features.fans then
                xpcall(function()
                    for i = #features.fanstable, 1, -1 do
                        local v = features.fanstable[i]
                        if not v or not v.Parent then
                            table.remove(features.fanstable, i)
                        else
                            v:Destroy()
                        end
                    end
                end, function(err)
                    warn("Delete Fans Error")
                    warn(debug.traceback(err))
                end)
            elseif features.fans == false then
                break
            end
        end
    else
        features.fans = false
        features.fansconnect:Disconnect()
        features.fanstable = {}
    end
end)

FunSection:NewToggle("Room Counter", "Tells You What Room Ur On", function(state)
    if state then
        local gui = Instance.new("ScreenGui")
        gui.Name = "Counter"
        gui.Parent = game.Players.LocalPlayer.PlayerGui
        local label = Instance.new("TextLabel")
        label.Name = "Text"
        label.Text = "Room: " .. tostring(game.Players.LocalPlayer.PlayerFolder.DoorsOpened.Value)
        label.TextScaled = true
        label.Position = UDim2.new(0, 0, 0, 50)
        label.Size = UDim2.new(0, 200, 0, 50)
        label.Parent = gui
        features.counter = true
        while task.wait(0.05) do
            if features.counter then
                label.Text = "Room: " .. tostring(game.Players.LocalPlayer.PlayerFolder.DoorsOpened.Value)
            elseif features.counter == false then
                break
            end
        end
    else
        features.counter = false
        game.Players.LocalPlayer.PlayerGui.Counter:Destroy()
    end
end)

FunSection:NewButton("Bruteforce Door", "Can Cause Ping Spikes, Must Be Touching Door", function()
    for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
        if v:IsA("RemoteFunction") and v.Parent.Name == "Main" then
            table.insert(features.keypadtable, v)
        end
    end
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in ipairs(features.keypadtable) do
        local distance = (v.Parent.Position - hrp.Position).Magnitude
        if distance <= 10 then
            local remote = v
            for i = 0, 9999 do
                task.spawn(function()
                    local code = string.format("%04d", i)
                    remote:InvokeServer(code)
                end)
            end
        end
    end
    features.keypadtable = {}
end)

local Complete = Window:NewTab("Completion")
local CompleteSection = Complete:NewSection("Finish Specific Tasks Quickly")

CompleteSection:NewToggle("Generator Auto Complete", "Completes The Generator", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                table.insert(features.autogeneratortable, v)
            end
        end
        features.autogeneratorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                table.insert(features.autogeneratortable, v)
            end
        end)
        features.autogenerator = true
        while task.wait(0.1) do
            if features.autogenerator then
                xpcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for i = #features.autogeneratortable, 1, -1 do
                        local v = features.autogeneratortable[i]
                        if not v or not v.Parent then
                            table.remove(features.autogeneratortable, i)
                        else
                            if v:FindFirstChild("RemoteEvent") then
                                local distance = (hrp.Position - v:GetPivot().Position).Magnitude
                                if v.Fixed.Value ~= 100 and distance <= 10 then
                                    v.RemoteEvent:FireServer(true)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Auto Generator Error")
                    warn(debug.traceback(err))
                end)
            elseif features.autogenerator == false then
                break
            end
        end
    else
        features.autogenerator = false
        features.autogeneratorconnect:Disconnect()
        features.autogeneratortable = {}
    end
end)

CompleteSection:NewButton("Deactivate Turrets", "Goes To The Box And Deactivates Turrets", function()
    local cando = false
    local something = false
    local object = nil
    local old = nil
    for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
        if v and v:IsA("Model") and v.Name == "TurretControls" then
            if v:FindFirstChild("Colored") then
                if v.Colored.Color == Color3.fromRGB(255, 98, 20) then
                    something = true
                elseif v.Colored.Color == Color3.fromRGB(0, 167, 97) then
                    game.StarterGui:SetCore("SendNotification", {Title = "Notification", Text = "Detected Control Box", Duration = 4,})
                    cando = true
                    object = v
                end
            end
        end
    end
    if not cando then
        if something then
            game.StarterGui:SetCore("SendNotification", {Title = "Error", Text = "Control Already Deactivated", Duration = 4,})
        end
    end
    if cando then
        old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local doonce = false
        while task.wait(0.05) do
            if object.Colored.Color == Color3.fromRGB(0, 167, 97) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = object:GetPivot()
                fireproximityprompt(object.Highlight.ProximityPrompt)
            elseif object.Colored.Color == Color3.fromRGB(255, 98, 20) then
                break
            end
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old
        game.StarterGui:SetCore("SendNotification", {Title = "Notification", Text = "Teleporting Back", Duration = 4,})
    end
end)

CompleteSection:NewButton("Complete Seachlights Ending After Cannons", "Completes The Lever Part Of Seachlights", function()
    local lever2 = nil
    local lever3 = nil
    local lever4 = nil
    local lever5 = nil
    local done = ""
    for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
        if v.Parent.Name == "Triggers" then
            if v.Name == "Lever2" then
                lever2 = v
            elseif v.Name == "Lever3" then
                lever3 = v
            elseif v.Name == "Lever4" then
                lever4 = v
            elseif v.Name == "Lever5" then
                lever5 = v
            end
        end
    end
    while task.wait(0.05) do
        if done == "" then
            if lever2.Highlight:FindFirstChild("ProximityPrompt") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lever2:GetPivot()
                fireproximityprompt(lever2.Highlight.ProximityPrompt)
            else
                done = "2"
            end
        elseif done == "2" then
            if lever3.Highlight:FindFirstChild("ProximityPrompt") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lever3:GetPivot()
                fireproximityprompt(lever3.Highlight.ProximityPrompt)
            else
                done = "3"
            end
        elseif done == "3" then
            if lever4.Highlight:FindFirstChild("ProximityPrompt") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lever4:GetPivot()
                fireproximityprompt(lever4.Highlight.ProximityPrompt)
            else
                done = "4"
            end
        elseif done == "4" then
            if lever5.Highlight:FindFirstChild("ProximityPrompt") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lever5:GetPivot()
                fireproximityprompt(lever5.Highlight.ProximityPrompt)
            else
                done = "5"
            end
        elseif done == "5" then
            game.StarterGui:SetCore("SendNotification", {Title = "Notification", Text = "Finished Final Part", Duration = 4,})
            break
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.GameplayFolder.Rooms.SearchlightsEnding.Interactables.LargeRoundDoor:GetPivot()
end)

local Heart = Window:NewTab("Operation Heartburn")
local HeartSection = Heart:NewSection("Options For This Gamemode")

HeartSection:NewToggle("Ammo ESP", "See All Ammo", function(state)
    if state then
        features.ammo = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(features.ammotable, v)
            end
        end
        for _, v in pairs(game.workspace.RoomsFolder:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(features.ammotable, v)
            end
        end
        features.ammoconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(features.ammotable, v)
            end
        end)
        features.ammo2connect = game.workspace.RoomsFolder.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(features.ammotable, v)
            end
        end)
        while task.wait(0.1) do
            if features.ammo then
                xpcall(function()
                    for i = #features.ammotable, 1, -1 do
                        local v = features.ammotable[i]
                        if not v or not v.Parent then
                            table.remove(features.ammotable, i)
                        else
                            if not v:FindFirstChild("ESPHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "ESPHighlight"
                                highlight.FillColor = Color3.new(1, 1, 0)
                                highlight.OutlineTransparency = 1
                                highlight.Parent = v
                            end
                        end
                    end
                end, function(err)
                    warn("Ammo ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.ammo == false then
                break
            end
        end
    else
        features.ammo = false
        features.ammoconnect:Disconnect()
        features.ammo2connect:Disconnect()
        features.ammotable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                if v:FindFirstChild("ESPHighlight") then
                    v.ESPHighlight:Destroy()
                end
            end
        end
        for _, v in pairs(game.workspace.RoomsFolder:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                if v:FindFirstChild("ESPHighlight") then
                    v.ESPHighlight:Destroy()
                end
            end
        end
    end
end)

HeartSection:NewToggle("Grab All Ammo Near You", "Grabs All Close Ammo", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(features.ammoauratable, v)
            end
        end
        for _, v in pairs(game.workspace.RoomsFolder:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(features.ammoauratable, v)
            end
        end
        features.ammoauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(features.ammoauratable, v)
            end
        end)
        features.ammoaura2connect = game.workspace.RoomsFolder.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(features.ammoauratable, v)
            end
        end)
        features.ammoaura = true
        while task.wait(0.1) do
            if features.ammoaura then
                xpcall(function()
                    for i = #features.ammoauratable, 1, -1 do
                        local v = features.ammoauratable[i]
                        if not v or not v.Parent then
                            table.remove(features.ammoauratable, i)
                        else
                            if v:FindFirstChild("ProxyPart") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ProxyPart.Position).Magnitude
                                if distance <= 5 then
                                    fireproximityprompt(v.ProxyPart.ProximityPrompt)
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Grab All Ammo Error")
                    warn(debug.traceback(err))
                end)
            elseif features.ammoaura == false then
                break
            end
        end
    else
        features.ammoaura = false
        features.ammoauraconnect:Disconnect()
        features.ammoaura2connect:Disconnect()
        features.ammoauratable = {}
    end
end)

HeartSection:NewToggle("Zombie ESP", "See All Zombies", function(state)
    if state then
        features.zombie = true
        for _, v in pairs(game.workspace.ReplicatedAI:GetDescendants()) do
            if v and v.Name == "ZombieModel" then
                table.insert(features.zombietable, v)
            end
        end
        features.zombieconnect = game.workspace.ReplicatedAI.DescendantAdded:Connect(function(v)
            if v and v.Name == "ZombieModel" then
                table.insert(features.zombietable, v)
            end
        end)
        while task.wait(0.1) do
            if features.zombie then
                xpcall(function()
                    for i = #features.zombietable, 1, -1 do
                        local v = features.zombietable[i]
                        if not v or not v.Parent then
                            table.remove(features.zombietable, i)
                        else
                            if not v:FindFirstChild("ESPHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "ESPHighlight"
                                highlight.FillColor = Color3.fromRGB(100, 0, 0)
                                highlight.OutlineTransparency = 1
                                highlight.Parent = v
                            end
                            if v:IsDescendantOf(game.workspace.GameplayFolder.Debris) and v:FindFirstChild("ESPHighlight") then
                                v.ESPHighlight:Destroy()
                            end
                        end
                    end
                end, function(err)
                    warn("Zombie ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif features.zombie == false then
                break
            end
        end
    else
        features.zombie = false
        features.zombieconnect:Disconnect()
        features.zombietable = {}
        for _, v in pairs(game.workspace.ReplicatedAI:GetDescendants()) do
            if v and v.Name == "ZombieModel" then
                if v:FindFirstChild("ESPHighlight") then
                    v.ESPHighlight:Destroy()
                end
            end
        end
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
