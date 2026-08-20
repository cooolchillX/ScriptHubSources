local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local flyconnect
local inputconnect
local noclip = false
local nocliptable = {}
local prompts = {}
local insta = false
local instaconnection
local assettable = {}
local assets = false
local assetconnect
local doortable = {}
local doors = false
local doorconnect
local playerstable = {}
local players = false
local playersconnect
local keycardtable = {}
local keycards = false
local keycardconnect
local batteriestable = {}
local batteries = false
local batteriesconnect
local itemtable = {}
local items = false
local itemconnect
local item2connect
local neostyktable = {}
local neostyks = false
local neostykconnect
local fakedoortable = {}
local fakedoors = false
local fakedoorconnect
local lockertable = {}
local lockers = false
local lockerconnect
local tripwiretable = {}
local tripwires = false
local tripwireconnect
local landminetable = {}
local landmines = false
local landmineconnect
local nodetable = {}
local nodes = false
local nodeconnect
local entitytable = {}
local entities = false
local entitiesconnect
local entities2connect
local entities3connect
local entities4connect
local entities5connect
local generatortable = {}
local generators = false
local generatorconnect
local waterpuddlestable = {}
local waterpuddles = false
local waterpuddlesconnect
local assetauratable = {}
local assetaura = false
local assetauraconnect
local keycardauratable = {}
local keycardaura = false
local keycardauraconnect
local itemauratable = {}
local itemaura = false
local itemauraconnect
local neostykauratable = {}
local neostykaura = false
local neostykauraconnect
local batteryauratable = {}
local batteryaura = false
local batteryauraconnect
local tripwireauratable = {}
local tripwireaura = false
local tripwireauraconnect
local landmineauratable = {}
local landmineaura = false
local landmineauraconnect
local grabassettable = {}
local grabasset = false
local grabassetconnect
local grabkeycardtable = {}
local grabkeycard = false
local grabkeycardconnect
local grabitemtable = {}
local grabitem = false
local grabitemconnect
local grabneostyktable = {}
local grabneostyk = false
local grabneostykconnect
local grabbatterytable = {}
local grabbattery = false
local grabbatteryconnect
local disabledrawertable = {}
local disabledrawer = false
local disabledrawerconnect
local freezefov = false
local seethrough = false
local notifid = nil
local notif = false
local anglerconnect
local anglernotifconnect
local entityconnect
local entitynotifconnect
local risky = false
local tpdistance = 100
local avoidconnect
local imaginetable = {}
local imagine = false
local imagineconnect
local eyefestationtable = {}
local eyefestation = false
local eyefestationconnect
local pandemoniumtable = {}
local pandemonium = false
local pandemoniumconnect
local pipsqueaktable = {}
local pipsqueak = false
local pipsqueakconnect
local harbingertable = {}
local harbinger = false
local harbingerconnect
local witchtable = {}
local witch = false
local witchconnect
local popuptable = {}
local popup = false
local popupconnect
local waterpuddletable = {}
local waterpuddle = false
local waterpuddleconnect
local antifeartable = {}
local antifear = false
local antifearconnect
local triggerlandminetable = {}
local triggerlandmine = false
local triggerlandmineconnect
local walklandminetable = {}
local walklandmines = false
local walklandmineconnect
local fanstable = {}
local fans = false
local fansconnect
local counter = false
local keypadtable = {}
local autogeneratortable = {}
local autogenerator = false
local autogeneratorconnect
local ammotable = {}
local ammo = false
local ammoconnect
local ammo2connect
local ammoauratable = {}
local ammoaura = false
local ammoauraconnect
local ammoaura2connect
local zombietable = {}
local zombie = false
local zombieconnect

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
        flyconnect = RunService.Heartbeat:Connect(function()
            local velocity = root.AssemblyLinearVelocity
            root.AssemblyLinearVelocity = Vector3.zero
            game.workspace.Gravity = 0
        end)
    else
        stopTPWalk3()
        flyconnect:Disconnect()
        game.workspace.Gravity = 196.2
    end
end)

MainSection:NewToggle("Infinite Jump", "Increase Velocity Every Jump", function(state)
    if state then
        inputconnect = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then
                return
            end
            if input.KeyCode == Enum.KeyCode.Space then
                game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity + Vector3.new(0, 60, 0)
            end
        end)
    else
        inputconnect:Disconnect()
    end
end)

MainSection:NewToggle("Noclip", "Clip Through Walls", function(state)
    if state then
        noclip = true
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v and (v:IsA("Part") or v:IsA("MeshPart")) then
                if v.CanCollide then
                    table.insert(nocliptable, v)
                end
            end
        end
        while task.wait(0.1) do
            if noclip then
                for _, v in pairs(nocliptable) do
                    v.CanCollide = false
                end
            elseif noclip == false then
                break
            end
        end
    else
        noclip = false
        for _, v in pairs(nocliptable) do
            v.CanCollide = true
        end
        nocliptable = {}
    end
end)

MainSection:NewToggle("Instant Interaction", "No Need To Hold", function(state)
    if state then
        insta = true
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                table.insert(prompts, v)
            end
        end
        instaconnection = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("ProximityPrompt") then
                table.insert(prompts, v)
            end
        end)
        while task.wait(0.1) do
            if insta then
                xpcall(function()
                    for i = #prompts, 1, -1 do
                        local v = prompts[i]
                        if not v or not v.Parent then
                            table.remove(prompts, i)
                        else
                            v.HoldDuration = 0
                        end
                    end
                end, function(err)
                    warn("Insta Interact Error")
                    warn(debug.traceback(err))
                end)
            elseif insta == false then
                break
            end
        end
    else
        insta = false
        instaconnection:Disconnect()
        prompts = {}
    end
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Behind Walls")

ESPSection:NewToggle("Asset ESP", "See All Assets", function(state)
    if state then
        assets = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(assettable, v)
            end
        end
        assetconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(assettable, v)
            end
        end)
        while task.wait(0.1) do
            if assets then
                xpcall(function()
                    for i = #assettable, 1, -1 do
                        local v = assettable[i]
                        if not v or not v.Parent then
                            table.remove(assettable, i)
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
            elseif assets == false then
                break
            end
        end
    else
        assets = false
        assetconnect:Disconnect()
        assettable = {}
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
        doors = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v:IsA("Model") and (v.Name == "NormalDoor" or v.Name == "DoubleDoor") then
                table.insert(doortable, v)
            end
        end
        doorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if  v:IsA("Model") and (v.Name == "NormalDoor" or v.Name == "DoubleDoor") then
                table.insert(doortable, v)
            end
        end)
        while task.wait(0.1) do
            if doors then
                xpcall(function()
                    for i = #doortable, 1, -1 do
                        local v = doortable[i]
                        if not v or not v.Parent then
                            table.remove(doortable, i)
                        else
                            if v.Parent.Name == "DoubleDoor" then
                                table.remove(doortable, i)
                            end
                            if v.Name == "DoubleDoor" then
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
            elseif doors == false then
                break
            end
        end
    else
        doors = false
        doorconnect:Disconnect()
        doortable = {}
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
            table.insert(playerstable, v)
        end
        playersconnect = game.Players.PlayerAdded:Connect(function(v)
            table.insert(playerstable, v)
        end)
        players = true
        while task.wait(0.1) do
            if players then
                xpcall(function()
                    for i = #playerstable, 1, -1 do
                        local v = playerstable[i]
                        if not v or not v.Parent then
                            table.remove(playerstable, i)
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
            elseif players == false then
                break
            end
        end
    else
        players = false
        playersconnect:Disconnect()
        playerstable = {}
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
        keycards = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(keycardtable, v)
            end
        end
        keycardconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(keycardtable, v)
            end
        end)
        while task.wait(0.1) do
            if keycards then
                xpcall(function()
                    for i = #keycardtable, 1, -1 do
                        local v = keycardtable[i]
                        if not v or not v.Parent then
                            table.remove(keycardtable, i)
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
            elseif keycards == false then
                break
            end
        end
    else
        keycards = false
        keycardconnect:Disconnect()
        keycardtable = {}
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
        batteries = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "battery") then
                table.insert(batteriestable, v)
            end
        end
        batteriesconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "battery") then
                table.insert(batteriestable, v)
            end
        end)
        while task.wait(0.1) do
            if batteries then
                xpcall(function()
                    for i = #batteriestable, 1, -1 do
                        local v = batteriestable[i]
                        if not v or not v.Parent then
                            table.remove(batteriestable, i)
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
            elseif batteries == false then
                break
            end
        end
    else
        batteries = false
        batteriesconnect:Disconnect()
        batteriestable = {}
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
        items = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemtable, v)
                end
            end
        end
        itemconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemtable, v)
                end
            end
        end)
        for _, v in pairs(game.workspace.GameplayFolder.DroppedItems:GetChildren()) do
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemtable, v)
                end
            end
        end
        item2connect = game.workspace.GameplayFolder.DroppedItems.ChildAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemtable, v)
                end
            end
        end)
        while task.wait(0.1) do
            if items then
                xpcall(function()
                    for i = #itemtable, 1, -1 do
                        local v = itemtable[i]
                        if not v or not v.Parent then
                            table.remove(itemtable, i)
                        else
                            if v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" then
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
            elseif items == false then
                break
            end
        end
    else
        items = false
        itemconnect:Disconnect()
        item2connect:Disconnect()
        itemtable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                end
            end
        end
        for _, v in pairs(game.workspace.GameplayFolder.DroppedItems:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
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
                table.insert(lockertable, v)
            end
        end
        lockerconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Locker" then
                table.insert(lockertable, v)
            end
        end)
        lockers = true
        while task.wait(0.1) do
            if lockers then
                xpcall(function()
                    for i = #lockertable, 1, -1 do
                        local v = lockertable[i]
                        if not v or not v.Parent then
                            table.remove(lockertable, i)
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
            elseif lockers == false then
                break
            end
        end
    else
        lockers = false
        lockerconnect:Disconnect()
        lockertable = {}
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
        neostyks = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "neostyk") then
                table.insert(neostyktable, v)
            end
        end
        neostykconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and string.find(string.lower(v.Name), "neostyk") then
                table.insert(neostyktable, v)
            end
        end)
        while task.wait(0.1) do
            if neostyks then
                xpcall(function()
                    for i = #neostyktable, 1, -1 do
                        local v = neostyktable[i]
                        if not v or not v.Parent then
                            table.remove(neostyktable, i)
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
            elseif neostyks == false then
                break
            end
        end
    else
        neostyks = false
        neostykconnect:Disconnect()
        neostyktable = {}
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
                table.insert(fakedoortable, v)
            end
        end
        fakedoorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v.Name == "TricksterRoom" and v:IsA("Model") then
                table.insert(fakedoortable, v)
            end
        end)
        fakedoors = true
        while task.wait(0.1) do
            if fakedoors then
                xpcall(function()
                    for i = #fakedoortable, 1, -1 do
                        local v = fakedoortable[i]
                        if not v or not v.Parent then
                            table.remove(fakedoortable, i)
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
            elseif fakedoors == false then
                break
            end
        end
    else
        fakedoors = false
        fakedoorconnect:Disconnect()
        fakedoortable = {}
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
                table.insert(tripwiretable, v)
            end
        end
        tripwireconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Tripwire" then
                table.insert(tripwiretable, v)
            end
        end)
        tripwires = true
        while task.wait(0.1) do
            if tripwires then
                xpcall(function()
                    for i = #tripwiretable, 1, -1 do
                        local v = tripwiretable[i]
                        if not v or not v.Parent then
                            table.remove(tripwiretable, i)
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
            elseif tripwires == false then
                break
            end
        end
    else
        tripwires = false
        tripwireconnect:Disconnect()
        tripwiretable = {}
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
                table.insert(landminetable, v)
            end
        end
        landmineconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Landmine" then
                table.insert(landminetable, v)
            end
        end)
        landmines = true
        while task.wait(0.1) do
            if landmines then
                xpcall(function()
                    for i = #landminetable, 1, -1 do
                        local v = landminetable[i]
                        if not v or not v.Parent then
                            table.remove(landminetable, i)
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
            elseif landmines == false then
                break
            end
        end
    else
        landmines = false
        landmineconnect:Disconnect()
        landminetable = {}
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
                    table.insert(nodetable, v)
                end
            end
        end
        nodeconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v:IsA("Part") then
                if v.Name == "A60" or v.Name == "A200" or v.Name == "Bleach" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" or v.Name == "Mirage" then
                    table.insert(nodetable, v)
                end
            end
        end)
        nodes = true
        while task.wait(0.1) do
            if nodes then
                xpcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for i = #nodetable, 1, -1 do
                        local v = nodetable[i]
                        if not v or not v.Parent then
                            table.remove(nodetable, i)
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
            elseif nodes == false then
                break
            end
        end
    else
        nodes = false
        nodeconnect:Disconnect()
        nodetable = {}
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
                    table.insert(entitytable, v)
                end
            end
        end
        for _, v in pairs(game.workspace.GameplayFolder.Monsters:GetDescendants()) do
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    table.insert(entitytable, v)
                end
            end
        end
        for _, v in pairs(game.workspace.Camera:GetDescendants()) do
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    table.insert(entitytable, v)
                end
            end
        end
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    table.insert(entitytable, v)
                end
            end
        end
        entitiesconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    task.wait(1)
                    table.insert(entitytable, v)
                end
            end
        end)
        entities2connect = game.workspace.GameplayFolder.Monsters.DescendantAdded:Connect(function(v)
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    task.wait(1)
                    table.insert(entitytable, v)
                end
            end
        end)
        entities3connect = game.workspace.Camera.DescendantAdded:Connect(function(v)
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    task.wait(1)
                    table.insert(entitytable, v)
                end
            end
        end)
        entities4connect = game.workspace.ChildAdded:Connect(function(v)
            if v and (v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody")) then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or v.Name == "SkinlessCorpse" or v.Name == "TreeBody" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    task.wait(1)
                    table.insert(entitytable, v)
                end
            end
        end)
        entities5connect = game.Workspace.DescendantAdded:Connect(function(v)
            if v.Name == "DwellerModel" and v:IsA("Model") then
                task.wait(0.5)
                table.insert(entitytable, v)
            end
        end)
        entities = true
        while task.wait(0.1) do
            if entities then
                xpcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for i = #entitytable, 1, -1 do
                        local v = entitytable[i]
                        if not v or not v.Parent then
                            table.remove(entitytable, i)
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
            elseif entities == false then
                break
            end
        end
    else
        entities = false
        entitiesconnect:Disconnect()
        entities2connect:Disconnect()
        entities3connect:Disconnect()
        entities4connect:Disconnect()
        entitytable = {}
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
                table.insert(generatortable, v)
            end
        end
        generatorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                table.insert(generatortable, v)
            end
        end)
        generators = true
        while task.wait(0.1) do
            if generators then
                xpcall(function()
                    for i = #generatortable, 1, -1 do
                        local v = generatortable[i]
                        if not v or not v.Parent then
                            table.remove(generatortable, i)
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
            elseif generators == false then
                break
            end
        end
    else
        generators = false
        generatorconnect:Disconnect()
        generatortable = {}
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
                table.insert(waterpuddlestable, v)
            end
        end
        waterpuddlesconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "WaterPuddle" then
                table.insert(waterpuddlestable, v)
            end
        end)
        waterpuddles = true
        while task.wait(0.1) do
            if waterpuddles then
                xpcall(function()
                    for i = #waterpuddlestable, 1, -1 do
                        local v = waterpuddlestable[i]
                        if not v or not v.Parent then
                            table.remove(waterpuddlestable, i)
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
            elseif waterpuddles == false then
                break
            end
        end
    else
        waterpuddles = false
        waterpuddlesconnect:Disconnect()
        waterpuddlestable = {}
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
                table.insert(assetauratable, v)
            end
        end
        assetauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(assetauratable, v)
            end
        end)
        assetaura = true
        while task.wait(0.1) do
            if assetaura then
                xpcall(function()
                    for i = #assetauratable, 1, -1 do
                        local v = assetauratable[i]
                        if not v or not v.Parent then
                            table.remove(assetauratable, i)
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
            elseif assetaura == false then
                break
            end
        end
    else
        assetaura = false
        assetauraconnect:Disconnect()
        assetauratable = {}
    end
end)

AuraSection:NewToggle("Grab All Keycards Near You", "Grabs All Close Keycards", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(keycardauratable, v)
            end
        end
        keycardauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(keycardauratable, v)
            end
        end)
        keycardaura = true
        while task.wait(0.1) do
            if keycardaura then
                xpcall(function()
                    for i = #keycardauratable, 1, -1 do
                        local v = keycardauratable[i]
                        if not v or not v.Parent then
                            table.remove(keycardauratable, i)
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
            elseif keycardaura == false then
                break
            end
        end
    else
        keycardaura = false
        keycardauraconnect:Disconnect()
        keycardauratable = {}
    end
end)

AuraSection:NewToggle("Grab All Items Near You", "Grabs All Close Items", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemauratable, v)
                end
            end
        end
        itemauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemauratable, v)
                end
            end
        end)
        itemaura = true
        while task.wait(0.1) do
            if itemaura then
                xpcall(function()
                    for i = #itemauratable, 1, -1 do
                        local v = itemauratable[i]
                        if not v or not v.Parent then
                            table.remove(itemauratable, i)
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
            elseif itemaura == false then
                break
            end
        end
    else
        itemaura = false
        itemauraconnect:Disconnect()
        itemauratable = {}
    end
end)

AuraSection:NewToggle("Grab All NeoStyks Near You", "Grabs All Close NeoStyks", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and string.find(string.lower(v.Name), "neostyk") then
                table.insert(neostykauratable, v)
            end
        end
        neostykauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and string.find(string.lower(v.Name), "neostyk") then
                table.insert(neostykauratable, v)
            end
        end)
        neostykaura = true
        while task.wait(0.1) do
            if neostykaura then
                xpcall(function()
                    for i = #neostykauratable, 1, -1 do
                        local v = neostykauratable[i]
                        if not v or not v.Parent then
                            table.remove(neostykauratable, i)
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
            elseif neostykaura == false then
                break
            end
        end
    else
        neostykaura = false
        neostykauraconnect:Disconnect()
        neostykauratable = {}
    end
end)

AuraSection:NewToggle("Grab All Batteries Near You", "Grabs All Close Batteries", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and string.find(string.lower(v.Name), "battery") then
                table.insert(batteryauratable, v)
            end
        end
        batteryauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and string.find(string.lower(v.Name), "battery") then
                table.insert(batteryauratable, v)
            end
        end)
        batteryaura = true
        while task.wait(0.1) do
            if batteryaura then
                xpcall(function()
                    for i = #batteryauratable, 1, -1 do
                        local v = batteryauratable[i]
                        if not v or not v.Parent then
                            table.remove(batteryauratable, i)
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
            elseif batteryaura == false then
                break
            end
        end
    else
        batteryaura = false
        batteryauraconnect:Disconnect()
        batteryauratable = {}
    end
end)

AuraSection:NewToggle("Disarm Nearby Tripwires", "Disarms Them When Close", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Tripwire" then
                table.insert(tripwireauratable, v)
            end
        end
        tripwireauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Tripwire" then
                table.insert(tripwireauratable, v)
            end
        end)
        tripwireaura = true
        while task.wait(0.1) do
            if tripwireaura then
                xpcall(function()
                    for i = #tripwireauratable, 1, -1 do
                        local v = tripwireauratable[i]
                        if not v or not v.Parent then
                            table.remove(tripwireauratable, i)
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
            elseif tripwireaura == false then
                break
            end
        end
    else
        tripwireaura = false
        tripwireauraconnect:Disconnect()
        tripwireauratable = {}
    end
end)

AuraSection:NewToggle("Disarm Nearby Landmines", "Diarms Them When Close", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(landmineauratable, v)
            end
        end
        landmineauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(landmineauratable, v)
            end
        end)
        landmineaura = true
        while task.wait(0.1) do
            if landmineaura then
                xpcall(function()
                    for i = #landmineauratable, 1, -1 do
                        local v = landmineauratable[i]
                        if not v or not v.Parent then
                            table.remove(landmineauratable, i)
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
            elseif landmineaura == false then
                break
            end
        end
    else
        landmineaura = false
        landmineauraconnect:Disconnect()
        landmineauratable = {}
    end
end)

AuraSection:NewToggle("Grab Assets Through Walls", "Simpler Grab All Assets", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(grabassettable, v)
            end
        end
        grabassetconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "currency") or string.find(string.lower(v.Name), "blueprint")) then
                table.insert(grabassettable, v)
            end
        end)
        grabasset = true
        while task.wait(0.1) do
            if grabasset then
                xpcall(function()
                    for i = #grabassettable, 1, -1 do
                        local v = grabassettable[i]
                        if not v or not v.Parent then
                            table.remove(grabassettable, i)
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
            elseif grabasset == false then
                break
            end
        end
    else
        grabasset = false
        grabassetconnect:Disconnect()
        grabassettable = {}
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
                table.insert(grabkeycardtable, v)
            end
        end
        grabkeycardconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
                table.insert(grabkeycardtable, v)
            end
        end)
        grabkeycard = true
        while task.wait(0.1) do
            if grabkeycard then
                xpcall(function()
                    for i = #grabkeycardtable, 1, -1 do
                        local v = grabkeycardtable[i]
                        if not v or not v.Parent then
                            table.remove(grabkeycardtable, i)
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
            elseif grabkeycard == false then
                break
            end
        end
    else
        grabkeycard = false
        grabkeycardconnect:Disconnect()
        grabkeycardtable = {}
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
                    table.insert(grabitemtable, v)
                end
            end
        end
        grabitemconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(grabitemtable, v)
                end
            end
        end)
        grabitem = true
        while task.wait(0.1) do
            if grabitem then
                xpcall(function()
                    for i = #grabitemtable, 1, -1 do
                        local v = grabitemtable[i]
                        if not v or not v.Parent then
                            table.remove(grabitemtable, i)
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
            elseif grabitem == false then
                break
            end
        end
    else
        grabitem = false
        grabitemconnect:Disconnect()
        grabitemtable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote") then
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
                table.insert(grabneostyktable, v)
            end
        end
        grabneostykconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "neostyk")) then
                table.insert(grabneostyktable, v)
            end
        end)
        grabneostyk = true
        while task.wait(0.1) do
            if grabneostyk then
                xpcall(function()
                    for i = #grabneostyktable, 1, -1 do
                        local v = grabneostyktable[i]
                        if not v or not v.Parent then
                            table.remove(grabneostyktable, i)
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
            elseif grabneostyk == false then
                break
            end
        end
    else
        grabneostyk = false
        grabneostykconnect:Disconnect()
        grabneostyktable = {}
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
                table.insert(grabbatterytable, v)
            end
        end
        grabbatteryconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "battery")) then
                table.insert(grabbatterytable, v)
            end
        end)
        grabbattery = true
        while task.wait(0.1) do
            if grabbattery then
                xpcall(function()
                    for i = #grabbatterytable, 1, -1 do
                        local v = grabbatterytable[i]
                        if not v or not v.Parent then
                            table.remove(grabbatterytable, i)
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
            elseif grabbattery == false then
                break
            end
        end
    else
        grabbattery = false
        grabbatteryconnect:Disconnect()
        grabbatterytable = {}
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
                table.insert(disabledrawertable, v)
            end
        end
        disabledrawerconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (v.Name == "HighLight" or v.Name == "Door") then
                table.insert(disabledrawertable, v)
            end
        end)
        disabledrawer = true
        while task.wait(0.1) do
            if disabledrawer then
                xpcall(function()
                    for i = #disabledrawertable, 1, -1 do
                        local v = disabledrawertable[i]
                        if not v or not v.Parent then
                            table.remove(disabledrawertable, i)
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
            elseif disabledrawer == false then
                break
            end
        end
    else
        disabledrawer = false
        disabledrawerconnect:Disconnect()
        disabledrawertable = {}
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
        freezefov = true
        local fov = game.workspace.Camera.FieldOfView
        while task.wait(0.05) do
            if freezefov then
                if game.workspace:FindFirstChild("Camera") then
                    game.workspace.Camera.FieldOfView = fov
                end
            elseif freezefov == false then
                break
            end
        end
    else
        freezefov = false
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
        seethrough = true
        while task.wait(0.1) do
            if seethrough then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v and v:IsA("Model") and (v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "BigFlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote") then
                        for _, v2 in pairs(v:GetDescendants()) do
                            if v2:IsA("Part") or v2:IsA("MeshPart") then
                                v2.Material = "ForceField"
                            end
                        end
                    end
                end
            elseif seethrough == false then
                break
            end
        end
    else
        seethrough = false
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
        notifid = "rbxassetid://2389339814"
    elseif currentOption == "Default Ding" then
        notifid = "rbxassetid://130017098772572"
    elseif currentOption == "Steam" then
        notifid = "rbxassetid://139308638407157"
    elseif currentOption == "Default Low" then
        notifid = "rbxassetid://17208372272"
    elseif currentOption == "XBOX" then
        notifid = "rbxassetid://117934611310434"
    elseif currentOption == "GTA5" then
        notifid = "rbxassetid://116627196004523"
    elseif currentOption == "Discord" then
        notifid = "rbxassetid://117715907633385"
    end
    if game.SoundService:FindFirstChild("CustomNotifSound") then
        game.SoundService.CustomNotifSound.SoundId = notifid
        game.SoundService.CustomNotifSound:Play()
    end
end)


NotifSection:NewToggle("Notification Sound", "Sounds For Node Monster And Entity", function(state)
    if state then
        notif = true
        if not game.SoundService:FindFirstChild("CustomNotifSound") then
            local sound = Instance.new("Sound")
            sound.Name = "CustomNotifSound"
            sound.SoundId = notifid
            sound.Volume = 1
            sound.Parent = game.SoundService
        end
    else
        notif = false
        if game.SoundService:FindFirstChild("CustomNotifSound") then
            game.SoundService.CustomNotifSound:Destroy()
        end
    end
end)

NotifSection:NewToggle("Node Monster Notifications", "Notify When A Node Monster Spawns", function(state)
    if state then
        anglerconnect = game.workspace.ChildAdded:Connect(function(v)
            if v:IsA("Part") then
                if v.Name == "A60" or v.Name == "A200" or v.Name == "Bleach" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" or v.Name == "Mirage" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = v.Name .. " Has Spawned", Duration = 4,})
                    if notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                end
            end
        end)
    else
        anglerconnect:Disconnect()
    end
end)

NotifSection:NewToggle("Entity Notifications", "Notify When A Entity Spawns", function(state)
    if state then
        entityconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") or (v:IsA("MeshPart") and v.Name == "TreeBody") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Rebarb" or v.Name == "Coagulate" or v.Name == "CementShoes" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = v.Name .. " Has Spawned", Duration = 4,})
                    if notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "BiggerState" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Candlebrute" .. " Has Spawned", Duration = 4,})
                    if notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.name == "State" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Candlebearer" .. " Has Spawned", Duration = 4,})
                    if notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "WallDweller" .. " Has Spawned", Duration = 4,})
                    if notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "SkinlessCorpse" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Skinless" .. " Has Spawned", Duration = 4,})
                    if notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "TreeBody" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Eden Tree" .. " Has Spawned", Duration = 4,})
                    if notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                elseif v.Name == "CementShoes" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Cement Shoes" .. " Has Spawned", Duration = 4,})
                    if notif then
                        if game.SoundService:FindFirstChild("CustomNotifSound") then
                            game.SoundService.CustomNotifSound:Play()
                        end
                    end
                end
            end
        end)
    else
        entityconnect:Disconnect()
    end
end)

NotifSection:NewToggle("Notify Node Monster In Chat", "Says It In Chat", function(state)
    if state then
        anglernotifconnect = game.workspace.ChildAdded:Connect(function(v)
            if v:IsA("Part") then
                if v.Name == "A60" or v.Name == "A200" or v.Name == "Bleach" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" or v.Name == "Mirage" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(v.Name .. " Has Spawned")
                end
            end
        end)
    else
        anglernotifconnect:Disconnect()
    end
end)

NotifSection:NewToggle("Notify Entity In Chat", "Say It In Chat", function(state)
    if state then
        entitynotifconnect = game.workspace.DescendantAdded:Connect(function(v)
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
        entitynotifconnect:Disconnect()
    end
end)

local Anti = Window:NewTab("Anti")
local AntiSection = Anti:NewSection("Prevent Things")

AntiSection:NewToggle("Allow Risky Avoiding", "Allows Teleporting For Pandemonium And Pipsqueak", function(state)
    if state then
        risky = true
    else
        risky = false
    end
end)

AntiSection:NewSlider("Teleport Distance", "How Close Before It Telports", 500, 100, function(s) -- 500 (MaxValue) | 100 (MinValue)
    tpdistance = s
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
        avoidconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v:IsA("Part") then
                if not risky then
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
                            if distance <= tpdistance then
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
                            if distance > tpdistance then
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
        avoidconnect:Disconnect()
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
                table.insert(imaginetable, v)
            end
        end
        imagineconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v:IsA("Part") and v.Name == "FriendPart" then
                table.insert(imaginetable, v)
            end
        end)
        imagine = true
        while task.wait(0.1) do
            if imagine then
                xpcall(function()
                    for i = #imaginetable, 1, -1 do
                        local v = imaginetable[i]
                        if not v or not v.Parent then
                            table.remove(imaginetable, i)
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
            elseif imagine == false then
                break
            end
        end
    else
        imagine = false
        imagineconnect:Disconnect()
        imaginetable = {}
    end
end)

AntiSection:NewToggle("Anti Eyefestation", "Stops Eyefestation From Making You Look", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Eyefestation" then
                table.insert(eyefestationtable, v)
            end
        end
        eyefestationconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Eyefestation" then
                table.insert(eyefestationtable, v)
            end
        end)
        eyefestation = true
        while task.wait(0.1) do
            if eyefestation then
                xpcall(function()
                    for i = #eyefestationtable, 1, -1 do
                        local v = eyefestationtable[i]
                        if not v or not v.Parent then
                            table.remove(eyefestationtable, i)
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
            elseif eyefestation == false then
                break
            end
        end
    else
        eyefestation = false
        eyefestationconnect:Disconnect()
        eyefestationtable = {}
    end
end)

AntiSection:NewToggle("Anti Pandemonium", "Removes Pandemonium", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v.Name == "Pandemonium" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
                table.insert(pandemoniumtable, v)
            end
        end
        pandemoniumconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v.Name == "Pandemonium" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
                table.insert(pandemoniumtable, v)
            end
        end)
        pandemonium = true
        while task.wait(0.1) do
            if pandemonium then
                xpcall(function()
                    for i = #pandemoniumtable, 1, -1 do
                        local v = pandemoniumtable[i]
                        if not v or not v.Parent then
                            table.remove(pandemoniumtable, i)
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
            elseif pandemonium == false then
                break
            end
        end
    else
        pandemonium = false
        pandemoniumconnect:Disconnect()
        pandemoniumtable = {}
    end
end)

AntiSection:NewToggle("Anti Pipsqueak", "Removes Pipsqueak", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v.Name == "Pipsqueak" then
                table.insert(pipsqueaktable, v)
            end
        end
        pipsqueakconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v.Name == "Pipsqueak" then
                table.insert(pipsqueaktable, v)
            end
        end)
        pipsqueak = true
        while task.wait(0.1) do
            if pipsqueak then
                xpcall(function()
                    for i = #pipsqueaktable, 1, -1 do
                        local v = pipsqueaktable[i]
                        if not v or not v.Parent then
                            table.remove(pipsqueaktable, i)
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
            elseif pipsqueak == false then
                break
            end
        end
    else
        pipsqueak = false
        pipsqueakconnect:Disconnect()
        pipsqueaktable = {}
    end
end)

AntiSection:NewToggle("Anti Harbinger", "Removes Harbinger", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v.Name == "Harbinger" then
                table.insert(harbingertable, v)
            end
        end
        harbingerconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v.Name == "Harbinger" then
                table.insert(harbingertable, v)
            end
        end)
        harbinger = true
        while task.wait(0.1) do
            if harbinger then
                xpcall(function()
                    for i = #harbingertable, 1, -1 do
                        local v = harbingertable[i]
                        if not v or not v.Parent then
                            table.remove(harbingertable, i)
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
            elseif harbinger == false then
                break
            end
        end
    else
        harbinger = false
        harbingerconnect:Disconnect()
        harbingertable = {}
    end
end)

AntiSection:NewToggle("Anti Witching Hour", "Removes Witching Hour", function(state)
    if state then
        for _, v in pairs(game.workspace:GetChildren()) do
            if v and v.Name == "WitchingHour" then
                table.insert(witchtable, v)
            end
        end
        witchconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v.Name == "WitchingHour" then
                table.insert(witchtable, v)
            end
        end)
        witch = true
        while task.wait(0.1) do
            if witch then
                xpcall(function()
                    for i = #witchtable, 1, -1 do
                        local v = witchtable[i]
                        if not v or not v.Parent then
                            table.remove(witchtable, i)
                        else
                            if v then
                                v:Destroy()
                            end
                        end
                    end
                end, function(err)
                    warn("Anti Witching Hour Error")
                    warn(debug.traceback(err))
                end)
            elseif witch == false then
                break
            end
        end
    else
        witch = false
        witchconnect:Disconnect()
        witchtable = {}
    end
end)

AntiSection:NewToggle("Anti Popups", "Remove Painters Popups", function(state)
    if state then
        for _, v in pairs(game.Players.LocalPlayer.PlayerGui.Main.Popups:GetChildren()) do
            if v and v:IsA("Frame") and v.Name == "Popup" then
                table.insert(popuptable, v)
            end
        end
        popupconnect = game.Players.LocalPlayer.PlayerGui.Main.Popups.ChildAdded:Connect(function(v)
            if v and v:IsA("Frame") and v.Name == "Popup" then
                table.insert(popuptable, v)
            end
        end)
        popup = true
        while task.wait(0.1) do
            if popup then
                xpcall(function()
                    for i = #popuptable, 1, -1 do
                        local v = popuptable[i]
                        if not v or not v.Parent then
                            table.remove(popuptable, i)
                        else
                            v:Destroy()
                        end
                    end
                end, function(err)
                    warn("Popup Error")
                    warn(debug.traceback(err))
                end)
            elseif popup == false then
                break
            end
        end
    else
        popup = false
        popupconnect:Disconnect()
        popuptable = {}
    end
end)

AntiSection:NewToggle("No Slipping On Water Puddles", "Prevents You From Slipping On Water Puddles", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "WaterPuddle" then
                table.insert(waterpuddletable, v)
            end
        end
        waterpuddleconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "WaterPuddle" then
                table.insert(waterpuddletable, v)
            end
        end)
        waterpuddle = true
        while task.wait(0.1) do
            if waterpuddle then
                xpcall(function()
                    for i = #waterpuddletable, 1, -1 do
                        local v = waterpuddletable[i]
                        if not v or not v.Parent then
                            table.remove(waterpuddletable, i)
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
            elseif waterpuddle == false then
                break
            end
        end
    else
        waterpuddle = false
        waterpuddleconnect:Disconnect()
        waterpuddletable = {}
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
                table.insert(antifeartable, v)
            end
        end
        antifearconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Locker" then
                table.insert(antifeartable, v)
            end
        end)
        antifear = true
        while task.wait(0.1) do
            if antifear then
                xpcall(function()
                    for i = #antifeartable, 1, -1 do
                        local v = antifeartable[i]
                        if not v or not v.Parent then
                            table.remove(antifeartable, i)
                        else
                            v:SetAttribute("ClaustrophobiaStartTime", 9999)
                            v:SetAttribute("ClaustrophobiaKickOutTime", 9999)
                        end
                    end
                end, function(err)
                    warn("No Claustrophobia Error")
                    warn(debug.traceback(err))
                end)
            elseif antifear == false then
                break
            end
        end
    else
        antifear = false
        antifearconnect:Disconnect()
        antifeartable = {}
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
                table.insert(triggerlandminetable, v)
            end
        end
        triggerlandmineconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(triggerlandminetable, v)
            end
        end)
        triggerlandmine = true
        while task.wait(0.1) do
            if triggerlandmine then
                xpcall(function()
                    for i = #triggerlandminetable, 1, -1 do
                        local v = triggerlandminetable[i]
                        if not v or not v.Parent then
                            table.remove(triggerlandminetable, i)
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
            elseif triggerlandmine == false then
                break
            end
        end
    else
        triggerlandmine = false
        triggerlandmineconnect:Disconnect()
        triggerlandminetable = {}
    end
end)

FunSection:NewToggle("Walk On Landmines", "Prevents You From Triggering Landmines", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(walklandminetable, v)
            end
        end
        walklandmineconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                table.insert(walklandminetable, v)
            end
        end)
        walklandmines = true
        while task.wait(0.1) do
            if walklandmines then
                xpcall(function()
                    for i = #walklandminetable, 1, -1 do
                        local v = walklandminetable[i]
                        if not v or not v.Parent then
                            table.remove(walklandminetable, i)
                        else
                            v.CanTouch = false
                        end
                    end
                end, function(err)
                    warn("Walk On Landmine Error")
                    warn(debug.traceback(err))
                end)
            elseif walklandmines == false then
                break
            end
        end
    else
        walklandmines = false
        walklandmineconnect:Disconnect()
        walklandminetable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Part") and v.Name == "LandmineSpawn" then
                v.CanTouch = true
            end
        end
    end
end)

FunSection:NewToggle("Remove Abomination Fans", "Deletes All During Chase", function(state)
    if state then
        fans = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "chasefanmodel")) then
                table.insert(fanstable, v)
            end
        end
        fansconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "chasefanmodel")) then
                table.insert(fanstable, v)
            end
        end)
        while task.wait(0.1) do
            if fans then
                xpcall(function()
                    for i = #fanstable, 1, -1 do
                        local v = fanstable[i]
                        if not v or not v.Parent then
                            table.remove(fanstable, i)
                        else
                            v:Destroy()
                        end
                    end
                end, function(err)
                    warn("Delete Fans Error")
                    warn(debug.traceback(err))
                end)
            elseif fans == false then
                break
            end
        end
    else
        fans = false
        fansconnect:Disconnect()
        fanstable = {}
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
        counter = true
        while task.wait(0.05) do
            if counter then
                label.Text = "Room: " .. tostring(game.Players.LocalPlayer.PlayerFolder.DoorsOpened.Value)
            elseif counter == false then
                break
            end
        end
    else
        counter = false
        game.Players.LocalPlayer.PlayerGui.Counter:Destroy()
    end
end)

FunSection:NewButton("Bruteforce Door", "Can Cause Ping Spikes, Must Be Touching Door", function()
    for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
        if v:IsA("RemoteFunction") and v.Parent.Name == "Main" then
            table.insert(keypadtable, v)
        end
    end
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in ipairs(keypadtable) do
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
    keypadtable = {}
end)

local Complete = Window:NewTab("Completion")
local CompleteSection = Complete:NewSection("Finish Specific Tasks Quickly")

CompleteSection:NewToggle("Generator Auto Complete", "Completes The Generator", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                table.insert(autogeneratortable, v)
            end
        end
        autogeneratorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                table.insert(autogeneratortable, v)
            end
        end)
        autogenerator = true
        while task.wait(0.1) do
            if autogenerator then
                xpcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for i = #autogeneratortable, 1, -1 do
                        local v = autogeneratortable[i]
                        if not v or not v.Parent then
                            table.remove(autogeneratortable, i)
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
            elseif autogenerator == false then
                break
            end
        end
    else
        autogenerator = false
        autogeneratorconnect:Disconnect()
        autogeneratortable = {}
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
        ammo = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(ammotable, v)
            end
        end
        for _, v in pairs(game.workspace.RoomsFolder:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(ammotable, v)
            end
        end
        ammoconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(ammotable, v)
            end
        end)
        ammo2connect = game.workspace.RoomsFolder.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(ammotable, v)
            end
        end)
        while task.wait(0.1) do
            if ammo then
                xpcall(function()
                    for i = #ammotable, 1, -1 do
                        local v = ammotable[i]
                        if not v or not v.Parent then
                            table.remove(ammotable, i)
                        else
                            if not v:FindFirstChild("ESPHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "ESPHighlight"
                                highlight.FillColor = assetscolor
                                highlight.OutlineTransparency = 1
                                highlight.Parent = v
                            elseif v:FindFirstChild("ESPHighlight") then
                                v.ESPHighlight.FillColor = assetscolor
                            end
                        end
                    end
                end, function(err)
                    warn("Ammo ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif ammo == false then
                break
            end
        end
    else
        ammo = false
        ammoconnect:Disconnect()
        ammo2connect:Disconnect()
        ammotable = {}
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
                table.insert(ammoauratable, v)
            end
        end
        for _, v in pairs(game.workspace.RoomsFolder:GetDescendants()) do
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(ammoauratable, v)
            end
        end
        ammoauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(ammoauratable, v)
            end
        end)
        ammoaura2connect = game.workspace.RoomsFolder.DescendantAdded:Connect(function(v)
            if v and (string.find(string.lower(v.Name), "shell") or string.find(string.lower(v.Name), "smallammobox")) then
                table.insert(ammoauratable, v)
            end
        end)
        ammoaura = true
        while task.wait(0.1) do
            if ammoaura then
                xpcall(function()
                    for i = #ammoauratable, 1, -1 do
                        local v = ammoauratable[i]
                        if not v or not v.Parent then
                            table.remove(ammoauratable, i)
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
            elseif ammoaura == false then
                break
            end
        end
    else
        ammoaura = false
        ammoauraconnect:Disconnect()
        ammoaura2connect:Disconnect()
        ammoauratable = {}
    end
end)

HeartSection:NewToggle("Zombie ESP", "See All Zombies", function(state)
    if state then
        zombie = true
        for _, v in pairs(game.workspace.ReplicatedAI:GetDescendants()) do
            if v and v.Name == "ZombieModel" then
                table.insert(zombietable, v)
            end
        end
        zombieconnect = game.workspace.ReplicatedAI.DescendantAdded:Connect(function(v)
            if v and v.Name == "ZombieModel" then
                table.insert(zombietable, v)
            end
        end)
        while task.wait(0.1) do
            if zombie then
                xpcall(function()
                    for i = #zombietable, 1, -1 do
                        local v = zombietable[i]
                        if not v or not v.Parent then
                            table.remove(zombietable, i)
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
            elseif zombie == false then
                break
            end
        end
    else
        zombie = false
        zombieconnect:Disconnect()
        zombietable = {}
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
