local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "RUNAWAYS", Duration = 4,})

local infjump
local npcesptable = {}
local npcesp = false
local npcespconnect
local lootableesptable = {}
local lootableesp = false
local lootableespconnect
local looselootesptable = {}
local looselootesp = false
local looselootespconnect
local cashesptable = {}
local cashesp = false
local cashespconnect
local range = 10
local killauratable = {}
local killaura = false
local killauraconnect
local damageobjecttable = {}
local damageobject = false
local damageobjectconnect
local cashtable = {}
local cash = false
local cashconnect
local glasstable = {}
local glass = false
local glassconnect
local boost = 1

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

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Things")

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

MainSection:NewToggle("Infinite Jump", "Increase Velocity Every Jump", function(state)
    if state then
        infjump = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then
                return
            end
            if input.KeyCode == Enum.KeyCode.Space then
                game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity + Vector3.new(0, 60, 0)
            end
        end)
    else
        infjump:Disconnect()
    end
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Through Walls")

ESPSection:NewToggle("NPC ESP", "See NPC's Through Walls", function(state)
    if state then
        npcesp = true
        for _, v in pairs(game.workspace.NPCs:GetChildren()) do
            table.insert(npcesptable, v)
        end
        npcespconnect = game.workspace.NPCs.ChildAdded:Connect(function(v)
            table.insert(npcesptable, v)
        end)
        while task.wait(0.1) do
            if npcesp then
                xpcall(function()
                    for i = #npcesptable, 1, -1 do
                        local v = npcesptable[i]
                        if not v or not v.Parent then
                            table.remove(npcesptable, i)
                        else
                            if not v:FindFirstChild("ESPHighlight") then
                                if v.Humanoid.Health > 0 then
                                    local highlight = Instance.new("Highlight")
                                    highlight.Name = "ESPHighlight"
                                    highlight.FillColor = Color3.fromRGB(100, 0, 0)
                                    highlight.OutlineTransparency = 1
                                    highlight.Parent = v
                                end
                            elseif v:FindFirstChild("ESPHighlight") then
                                if v.Humanoid.Health <= 0 then
                                    v.ESPHighlight:Destroy()
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("NPC ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif npcesp == false then
                break
            end
        end
    else
        npcesp = false
        npcespconnect:Disconnect()
        npcesptable = {}
        for _, v in pairs(game.workspace.NPCs:GetChildren()) do
            if v:FindFirstChild("ESPHighlight") then
                v.ESPHighlight:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Lootable Object ESP", "See Lootable Objects Through Walls", function(state)
    if state then
        lootableesp = true
        for _, v in pairs(game.workspace.Map:GetDescendants()) do
            if v:IsA("NumberValue") and v.Name == "Health" then
                table.insert(lootableesptable, v)
            end
        end
        lootableespconnect = game.workspace.Map.DescendantAdded:Connect(function(v)
            if v:IsA("NumberValue") and v.Name == "Health" then
                table.insert(lootableesptable, v)
            end
        end)
        while task.wait(0.1) do
            if lootableesp then
                xpcall(function()
                    for i = #lootableesptable, 1, -1 do
                        local v = lootableesptable[i]
                        if not v or not v.Parent then
                            table.remove(lootableesptable, i)
                        else
                            if not v.Parent:FindFirstChild("ESPBillboard") then
                                if v.Value > 0 then
                                    local billboard = Instance.new("BillboardGui")
                                    billboard.Name = "ESPBillboard"
                                    billboard.Size = UDim2.new(0, 50, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 1, 0)
                                    billboard.AlwaysOnTop = true
                                    billboard.Parent = v.Parent

                                    local textLabel = Instance.new("TextLabel")
                                    textLabel.Size = UDim2.new(1, 0, 0.4, 0)
                                    textLabel.Position = UDim2.new(0, 0, 0, 0)
                                    textLabel.BackgroundTransparency = 0
                                    textLabel.TextColor3 = Color3.new(0, 1, 0)
                                    textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
                                    textLabel.AutomaticSize = "XY"
                                    textLabel.BorderSizePixel = 0
                                    textLabel.Text = v.Parent.Name
                                    textLabel.Parent = billboard
                                end
                            elseif v.Parent:FindFirstChild("ESPBillboard") then
                                if v.Value <= 0 then
                                    v.Parent.ESPBillboard:Destroy()
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Lootable ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif lootableesp == false then
                break
            end
        end
    else
        lootableesp = false
        lootableespconnect:Disconnect()
        lootableesptable = {}
        for _, v in pairs(game.workspace.Map:GetDescendants()) do
            if v.Name == "ESPBillboard" then
                v:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Loose Loot ESP", "See Loose Loot Through Walls", function(state)
    if state then
        looselootesp = true
        for _, v in pairs(game.workspace.Loot:GetChildren()) do
            table.insert(looselootesptable, v)
        end
        looselootespconnect = game.workspace.Loot.ChildAdded:Connect(function(v)
            table.insert(looselootesptable, v)
        end)
        while task.wait(0.1) do
            if looselootesp then
                xpcall(function()
                    for i = #looselootesptable, 1, -1 do
                        local v = looselootesptable[i]
                        if not v or not v.Parent then
                            table.remove(looselootesptable, i)
                        else
                            if not v:FindFirstChild("ESPBillboard") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESPBillboard"
                                billboard.Size = UDim2.new(0, 50, 0, 50)
                                billboard.StudsOffset = Vector3.new(0, 1, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = v

                                local textLabel = Instance.new("TextLabel")
                                textLabel.Size = UDim2.new(1, 0, 0.4, 0)
                                textLabel.Position = UDim2.new(0, 0, 0, 0)
                                textLabel.BackgroundTransparency = 0
                                textLabel.TextColor3 = Color3.new(0, 1, 1)
                                textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
                                textLabel.AutomaticSize = "XY"
                                textLabel.BorderSizePixel = 0
                                textLabel.Text = v.Name
                                textLabel.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Loose Loot ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif looselootesp == false then
                break
            end
        end
    else
        looselootesp = false
        looselootespconnect:Disconnect()
        looselootesptable = {}
        for _, v in pairs(game.workspace.Loot:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Cash ESP", "See Cash Through Walls", function(state)
    if state then
        cashesp = true
        for _, v in pairs(game.workspace.Cash:GetChildren()) do
            table.insert(cashesptable, v)
        end
        cashespconnect = game.workspace.Cash.ChildAdded:Connect(function(v)
            table.insert(cashesptable, v)
        end)
        while task.wait(0.1) do
            if cashesp then
                xpcall(function()
                    for i = #cashesptable, 1, -1 do
                        local v = cashesptable[i]
                        if not v or not v.Parent then
                            table.remove(cashesptable, i)
                        else
                            if not v:FindFirstChild("ESPBillboard") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESPBillboard"
                                billboard.Size = UDim2.new(0, 50, 0, 50)
                                billboard.StudsOffset = Vector3.new(0, 1, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = v

                                local textLabel = Instance.new("TextLabel")
                                textLabel.Size = UDim2.new(1, 0, 0.4, 0)
                                textLabel.Position = UDim2.new(0, 0, 0, 0)
                                textLabel.BackgroundTransparency = 0
                                textLabel.TextColor3 = Color3.new(1, 0, 1)
                                textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
                                textLabel.AutomaticSize = "XY"
                                textLabel.BorderSizePixel = 0
                                textLabel.Text = v.Name
                                textLabel.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Cash ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif cashesp == false then
                break
            end
        end
    else
        cashesp = false
        cashespconnect:Disconnect()
        cashesptable = {}
        for _, v in pairs(game.workspace.Cash:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

local Aura = Window:NewTab("Aura")
local AuraSection = Aura:NewSection("Do Things Near You")

AuraSection:NewSlider("Trigger Range", "Distance Before It Tries Attacking", 50, 10, function(s) -- 50 (MaxValue) | 10 (MinValue)
    range = s
end)

AuraSection:NewToggle("Kill Aura", "Kill Things Near You", function(state)
    if state then
        killaura = true
        for _, v in pairs(game.workspace.NPCs:GetChildren()) do
            table.insert(killauratable, v)
        end
        killauraconnect = game.workspace.NPCs.ChildAdded:Connect(function(v)
            table.insert(killauratable, v)
        end)
        while task.wait(0.1) do
            if killaura then
                xpcall(function()
                    for i = #killauratable, 1, -1 do
                        local v = killauratable[i]
                        if not v or not v.Parent then
                            table.remove(killauratable, i)
                        else
                            if v:FindFirstChild("Torso") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Torso.Position).Magnitude
                                if distance <= range then
                                    if v.Humanoid.Health > 0 then
                                        game.ReplicatedStorage.FlowClient.ClientRunner.Event:FireServer("NPCs", "Damage", v.Humanoid, 1000)
                                    end
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Kill Aura Error")
                    warn(debug.traceback(err))
                end)
            elseif killaura == false then
                break
            end
        end
    else
        killaura = false
        killauraconnect:Disconnect()
        killauratable = {}
    end
end)

AuraSection:NewToggle("Damage Objects Aura", "Damage Things Near You", function(state)
    if state then
        damageobject = true
        for _, v in pairs(game.workspace.Map:GetDescendants()) do
            if v:IsA("NumberValue") and v.Name == "Health" then
                table.insert(damageobjecttable, v)
            end
        end
        damageobjectconnect = game.workspace.Map.DescendantAdded:Connect(function(v)
            if v:IsA("NumberValue") and v.Name == "Health" then
                table.insert(damageobjecttable, v)
            end
        end)
        while task.wait(0.1) do
            if damageobject then
                xpcall(function()
                    for i = #damageobjecttable, 1, -1 do
                        local v = damageobjecttable[i]
                        if not v or not v.Parent then
                            table.remove(damageobjecttable, i)
                        else
                            if v.Value > 0 then
                                if v.Parent:FindFirstChild("HealthBar") then
                                    local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Parent.HealthBar.Position).Magnitude
                                    if distance <= range then
                                        game.ReplicatedStorage.FlowClient.ClientRunner.Event:FireServer("DamageToOpen", "Damage", v.Parent, 1000, "melee")
                                    end
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Damage Aura Error")
                    warn(debug.traceback(err))
                end)
            elseif damageobject == false then
                break
            end
        end
    else
        damageobject = false
        damageobjectconnect:Disconnect()
        damageobjecttable = {}
    end
end)

AuraSection:NewToggle("Collect Cash Aura", "Collects Nearby Money", function(state)
    if state then
        cash = true
        for _, v in pairs(game.workspace.Cash:GetChildren()) do
            table.insert(cashtable, v)
        end
        cashconnect = game.workspace.Cash.ChildAdded:Connect(function(v)
            table.insert(cashtable, v)
        end)
        while task.wait(0.1) do
            if cash then
                xpcall(function()
                    for i = #cashtable, 1, -1 do
                        local v = cashtable[i]
                        if not v or not v.Parent then
                            table.remove(cashtable, i)
                        else
                            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.TouchSensor.Position).Magnitude
                            if distance <= range then
                                game.ReplicatedStorage.FlowClient.ClientRunner.Event:FireServer("Cash", "Collect", v.Cash)
                            end
                        end
                    end
                end, function(err)
                    warn("Cash Aura Error")
                    warn(debug.traceback(err))
                end)
            elseif cash == false then
                break
            end
        end
    else
        cash = false
        cashconnect:Disconnect()
        cashtable = {}
    end
end)

AuraSection:NewToggle("Break Windows Aura", "Destroys All Glass", function(state)
    if state then
        glass = true
        for _, v in pairs(game.workspace.Map:GetDescendants()) do
            if v.Name == "Glass" then
                table.insert(glasstable, v)
            end
        end
        glassconnect = game.workspace.Map.DescendantAdded:Connect(function(v)
            if v.Name == "Glass" then
                table.insert(glasstable, v)
            end
        end)
        while task.wait(0.1) do
            if glass then
                xpcall(function()
                    for i = #glasstable, 1, -1 do
                        local v = glasstable[i]
                        if not v or not v.Parent then
                            table.remove(glasstable, i)
                        else
                            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
                            if distance <= range then
                                game.ReplicatedStorage.FlowClient.ClientRunner.Event:FireServer("Effects", "BreakGlass", v)
                            end
                        end
                    end
                end, function(err)
                    warn("Break Glass Aura Error")
                    warn(debug.traceback(err))
                end)
            elseif glass == false then
                break
            end
        end
    else
        glass = false
        glassconnect:Disconnect()
        glasstable = {}
    end
end)

local Car = Window:NewTab("Vehicle")
local CarSection = Car:NewSection("Modify Your Car")

CarSection:NewSlider("Boost Amount", "How much To Multiply It By", 5, 1, function(s) -- 5 (MaxValue) | 1 (MinValue)
    boost = s
end)

CarSection:NewButton("Boost Acceleration", "Apply The Buff", function()
    for _, v in pairs(game.workspace.Vehicles:GetChildren()) do
        if v.Name ~= "Police" then
            if v:FindFirstChild("VehicleProperty") then
                v.VehicleProperty:SetAttribute("Acceleration", v.VehicleProperty:GetAttribute("Acceleration") * boost)
                game.StarterGui:SetCore("SendNotification", {Title = "Boosted", Text = "New Value:" .. tostring(v.VehicleProperty:GetAttribute("Acceleration")), Duration = 4,})
            end
        end
    end
end)

CarSection:NewButton("Boost Torque", "Apply The Buff", function()
    for _, v in pairs(game.workspace.Vehicles:GetChildren()) do
        if v.Name ~= "Police" then
            if v:FindFirstChild("VehicleProperty") then
                v.VehicleProperty:SetAttribute("Torque", v.VehicleProperty:GetAttribute("Torque") * boost)
                game.StarterGui:SetCore("SendNotification", {Title = "Boosted", Text = "New Value:" .. tostring(v.VehicleProperty:GetAttribute("Torque")), Duration = 4,})
            end
        end
    end
end)

CarSection:NewButton("Boost Top Speed", "Apply The Buff", function()
    for _, v in pairs(game.workspace.Vehicles:GetChildren()) do
        if v.Name ~= "Police" then
            if v:FindFirstChild("VehicleProperty") then
                v.VehicleProperty:SetAttribute("TopSpeedMPH", v.VehicleProperty:GetAttribute("TopSpeedMPH") * boost)
                game.StarterGui:SetCore("SendNotification", {Title = "Boosted", Text = "New Value:" .. tostring(v.VehicleProperty:GetAttribute("TopSpeedMPH")), Duration = 4,})
            end
        end
    end
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