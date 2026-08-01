local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local assettable = {}
local assets = false
local assetconnect
local assetscolor = Color3.fromRGB(255, 255, 0)
local doortable = {}
local doors = false
local doorconnect
local doorscolor = Color3.fromRGB(0, 255, 255)
local keycardtable = {}
local keycards = false
local keycardconnect
local itemtable = {}
local items = false
local itemconnect
local neostyktable = {}
local neostyks = false
local neostykconnect
local fakedoortable = {}
local fakedoors = false
local fakedoorconnect
local lockertable = {}
local lockers = false
local lockerconnect
local lockerscolor = Color3.fromRGB(0, 255, 0)
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
local generatortable = {}
local generators = false
local generatorconnect
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
local tripwireauratable = {}
local tripwireaura = false
local tripwireauraconnect
local landmineauratable = {}
local landmineaura = false
local landmineauraconnect
local prompts = {}
local insta = false
local instaconnection
local notifid = nil
local notif = false
local anglerconnect
local anglernotifconnect
local entityconnect
local entitynotifconnect
local antifeartable = {}
local antifear = false
local antifearconnect
local visiblesubspacetable = {}
local visiblesubspace = false
local visiblesubspaceconnect
local triggertripwiretable = {}
local triggertripwire = false
local triggertripwireconnect
local triggerlandminetable = {}
local triggerlandmine = false
local triggerlandmineconnect

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

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Pressure", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Useful For Evading Anglers")

MainSection:NewKeybind("Tp Up", "Tp Up", Enum.KeyCode.PageUp, function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0)
end)

MainSection:NewKeybind("Tp Down", "Tp Down", Enum.KeyCode.PageDown, function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -20, 0)
end)

MainSection:NewToggle("TP Walk", "Increase Movement Speed", function(state)
    if state then
        startTPWalk()
    else
        stopTPWalk()
    end
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Behind Walls")

ESPSection:NewToggle("Asset ESP", "See All Assets", function(state)
    if state then
        assets = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and string.find(string.lower(v.Name), "currency") then
                table.insert(assettable, v)
            end
        end
        assetconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and string.find(string.lower(v.Name), "currency") then
                table.insert(assettable, v)
            end
        end)
        while task.wait(0.1) do
            if assets then
                for i = #assettable, 1, -1 do
                    local v = assettable[i]
                    if not v or not v.Parent then
                        table.remove(assettable, i)
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
            elseif assets == false then
                break
            end
        end
    else
        assets = false
        assetconnect:Disconnect()
        assettable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and string.find(string.lower(v.Name), "currency") then
                if v:FindFirstChild("ESPHighlight") then
                    v.ESPHighlight:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewColorPicker("Asset ESP Color", "Change Its Color", Color3.fromRGB(255,255,0), function(color)
    assetscolor = color
end)

ESPSection:NewToggle("Door ESP", "See All Doors", function(state)
    if state then
        doors = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v.Name == "NormalDoor" and v:IsA("Model") then
                table.insert(doortable, v)
            end
        end
        doorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v.Name == "NormalDoor" and v:IsA("Model") then
                table.insert(doortable, v)
            end
        end)
        while task.wait(0.1) do
            if doors then
                for i = #doortable, 1, -1 do
                    local v = doortable[i]
                    if not v or not v.Parent then
                        table.remove(doortable, i)
                    else
                        if v:FindFirstChild("OpenValue") then
                            if not v.OpenValue.Value then
                                if v:FindFirstChild("Door") then
                                    if not v.Door:FindFirstChild("ESPHighlight") then
                                        local highlight = Instance.new("Highlight")
                                        highlight.Name = "ESPHighlight"
                                        highlight.FillColor = doorscolor
                                        highlight.OutlineTransparency = 1
                                        highlight.Parent = v.Door
                                    elseif v.Door:FindFirstChild("ESPHighlight") then
                                        v.Door.ESPHighlight.FillColor = doorscolor
                                    end
                                end
                            elseif v.OpenValue.Value then
                                if v:FindFirstChild("Door") then
                                    if v.Door:FindFirstChild("ESPHighlight") then
                                        v.Door.ESPHighlight:Destroy()
                                    end
                                end
                            end
                        end
                    end
                end
            elseif doors == false then
                break
            end
        end
    else
        doors = false
        doorconnect:Disconnect()
        doortable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v.Name == "NormalDoor" and v:IsA("Model") then
                if v:FindFirstChild("Door") then
                    if v.Door:FindFirstChild("ESPHighlight") then
                        v.Door.ESPHighlight:Destroy()
                    end
                end
            end
        end
    end
end)

ESPSection:NewColorPicker("Door ESP Color", "Change Its Color", Color3.fromRGB(0,255,255), function(color)
    doorscolor = color
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

ESPSection:NewToggle("Item ESP", "See All Items", function(state)
    if state then
        items = true
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemtable, v)
                end
            end
        end
        itemconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemtable, v)
                end
            end
        end)
        while task.wait(0.1) do
            if items then
                for i = #itemtable, 1, -1 do
                    local v = itemtable[i]
                    if not v or not v.Parent then
                        table.remove(itemtable, i)
                    else
                        if v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" then
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
                                label.Text = v:GetAttribute("DisplayName")
                                label.Parent = billboard
                            end
                        elseif v.Name == "Lantern" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" then
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
            elseif items == false then
                break
            end
        end
    else
        items = false
        itemconnect:Disconnect()
        itemtable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
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
                for i = #lockertable, 1, -1 do
                    local v = lockertable[i]
                    if not v or not v.Parent then
                        table.remove(lockertable, i)
                    else
                        if not v:FindFirstChild("ESPHighlight") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "ESPHighlight"
                            highlight.FillColor = lockerscolor
                            highlight.OutlineTransparency = 1
                            highlight.Parent = v
                        elseif v:FindFirstChild("ESPHighlight") then
                            v.ESPHighlight.FillColor = lockerscolor
                        end
                    end
                end
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

ESPSection:NewColorPicker("Locker ESP Color", "Change Its Color", Color3.fromRGB(0,255,0), function(color)
    lockerscolor = color
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
                for i = #tripwiretable, 1, -1 do
                    local v = tripwiretable[i]
                    if not v or not v.Parent then
                        table.remove(tripwiretable, i)
                    else
                        if not v.Main:FindFirstChild("ESPBillboard") then
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
                        end
                    end
                end
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
                for i = #landminetable, 1, -1 do
                    local v = landminetable[i]
                    if not v or not v.Parent then
                        table.remove(landminetable, i)
                    else
                        if not v.Main:FindFirstChild("ESPBillboard") then
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
                        end
                    end
                end
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
                if v.Name == "A60" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
                    table.insert(nodetable, v)
                end
            end
        end
        nodeconnect = game.workspace.ChildAdded:Connect(function(v)
            if v and v:IsA("Part") then
                if v.Name == "A60" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
                    table.insert(nodetable, v)
                end
            end
        end)
        nodes = true
        while task.wait(0.1) do
            if nodes then
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
                if v.Name == "A60" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
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
            if v and v:IsA("Model") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or (v.Name == "DiVineRoot" and v:FindFirstChild("DwellerModel")) then
                    table.insert(entitytable, v)
                end
            end
        end
        for _, v in pairs(game.workspace.GameplayFolder.Monsters:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or (v.Name == "DiVineRoot" and v:FindFirstChild("DwellerModel")) then
                    table.insert(entitytable, v)
                end
            end
        end
        entitiesconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or (v.Name == "DiVineRoot" and v:FindFirstChild("DwellerModel")) then
                    table.insert(entitytable, v)
                end
            end
        end)
        entities2connect = game.workspace.GameplayFolder.Monsters.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "Statue" or v.Name == "BiggerStatue" or v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" or (v.Name == "DiVineRoot" and v:FindFirstChild("DwellerModel")) then
                    table.insert(entitytable, v)
                end
            end
        end)
        entities = true
        while task.wait(0.1) do
            if entities then
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for i = #entitytable, 1, -1 do
                    local v = entitytable[i]
                    if not v or not v.Parent then
                        table.remove(entitytable, i)
                    else
                        if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" then
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
                        elseif v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" then
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
                        end
                    end
                end
            elseif entities == false then
                break
            end
        end
    else
        entities = false
        entitiesconnect:Disconnect()
        entities2connect:Disconnect()
        entitytable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "BiggerStatue" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "MeatWallDweller" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "RottenWallDweller" or v.Name == "Statue" or v.Name == "WallDweller" or v.Name == "DiVineRoot" then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                end
            end
        end
        for _, v in pairs(game.workspace.GameplayFolder.Monsters:GetDescendants()) do
            if v and v:IsA("Model") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "BiggerStatue" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "MeatWallDweller" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "RottenWallDweller" or v.Name == "Statue" or v.Name == "WallDweller" or v.Name == "DiVineRoot" then
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
                if v:FindFirstChild("Fixed") then
                    table.insert(generatortable, v)
                end
            end
        end
        generatorconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                if v:FindFirstChild("Fixed") then
                    table.insert(generatortable, v)
                end
            end
        end)
        generators = true
        while task.wait(0.1) do
            if generators then
                for i = #generatortable, 1, -1 do
                    local v = generatortable[i]
                    if not v or not v.Parent then
                        table.remove(generatortable, i)
                    else
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

local Aura = Window:NewTab("Aura")
local AuraSection = Aura:NewSection("Grab Things Close To You")

AuraSection:NewToggle("Grab All Assets Near You", "Grabs All Close Assets", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and string.find(string.lower(v.Name), "currency") then
                table.insert(assetauratable, v)
            end
        end
        assetauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and string.find(string.lower(v.Name), "currency") then
                table.insert(assetauratable, v)
            end
        end)
        assetaura = true
        while task.wait(0.1) do
            if assetaura then
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
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemauratable, v)
                end
            end
        end
        itemauraconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") then
                if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                    table.insert(itemauratable, v)
                end
            end
        end)
        itemaura = true
        while task.wait(0.1) do
            if itemaura then
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

local Visual = Window:NewTab("Visual")
local VisualSection = Visual:NewSection("Change How You See Stuff")

VisualSection:NewSlider("Fov Changer", "Change Your Field Of View", 120, 90, function(s) -- 120 (MaxValue) | 90 (MinValue)
    workspace.Camera.FieldOfView = s
end)

VisualSection:NewToggle("FullBright", "Brighten The Game", function(state)
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

VisualSection:NewButton("Remove Fog From Modifiers", "Removes The Restless Dreams Modifier Fog", function()
    local lighting = game:GetService("Lighting")
    lighting.FogEnd = 100000
    game.Players.LocalPlayer.Character.HumanoidRootPart.FogParticle.PlayerFog:Destroy()
end)

local Other = Window:NewTab("Others")
local OtherSection = Other:NewSection("Extra Things")

OtherSection:NewToggle("Instant Interaction", "No Need To Hold", function(state)
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
                for i = #prompts, 1, -1 do
                    local v = prompts[i]
                    if not v or not v.Parent then
                        table.remove(prompts, i)
                    else
                        v.HoldDuration = 0
                    end
                end
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

OtherSection:NewDropdown("Choose A Sound", "Choose The Notification Sound You Want", {"Windows 10", "Default Ding", "Steam", "Default Low", "XBOX", "GTA5", "Discord"}, function(currentOption)
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
    end
end)


OtherSection:NewToggle("Notification Sound", "Sounds For Node Monster And Entity", function(state)
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

OtherSection:NewToggle("Node Monster Notifications", "Notify When A Node Monster Spawns", function(state)
    if state then
        anglerconnect = game.workspace.ChildAdded:Connect(function(v)
            if v:IsA("Part") then
                if v.Name == "A60" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
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

OtherSection:NewToggle("Notify Node Monster In Chat", "Says It In Chat", function(state)
    if state then
        anglernotifconnect = game.workspace.ChildAdded:Connect(function(v)
            if v:IsA("Part") then
                if v.Name == "A60" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(v.Name .. " Has Spawned")
                end
            end
        end)
    else
        anglernotifconnect:Disconnect()
    end
end)

OtherSection:NewToggle("Entity Notifications", "Notify When A Entity Spawns", function(state)
    if state then
        entityconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "MeatWallDweller" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" then
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
                end
            end
        end)
    else
        entityconnect:Disconnect()
    end
end)

OtherSection:NewToggle("Notify Entity In Chat", "Say It In Chat", function(state)
    if state then
        entitynotifconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "MeatWallDweller" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(v.Name .. " Has Spawned")
                elseif v.Name == "BiggerState" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync("Candlebrute Has Spawned")
                elseif v.name == "State" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync("Candlebearer Has Spawned")
                elseif v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" then
                    game.TextChatService.TextChannels.RBXGeneral:SendAsync("WallDweller Has Spawned")
                end
            end
        end)
    else
        entitynotifconnect:Disconnect()
    end
end)

OtherSection:NewToggle("No Locker Claustrophobia", "Prevents You From Getting Kicked Out", function(state)
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
                for i = #antifeartable, 1, -1 do
                    local v = antifeartable[i]
                    if not v or not v.Parent then
                        table.remove(antifeartable, i)
                    else
                        v:SetAttribute("ClaustrophobiaStartTime", 9999)
                        v:SetAttribute("ClaustrophobiaKickOutTime", 9999)
                    end
                end
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

OtherSection:NewToggle("Make Subspace Tripmines Visible", "Makes All Subspaces Visible", function(state)
    if state then
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Landmine" then
                table.insert(visiblesubspacetable, v)
            end
        end
        visiblesubspaceconnect = game.workspace.GameplayFolder.Rooms.DescendantAdded:Connect(function(v)
            if v and v:IsA("Model") and v.Name == "Landmine" then
                table.insert(visiblesubspacetable, v)
            end
        end)
        visiblesubspace = true
        while task.wait(0.1) do
            if visiblesubspace then
                for i = #antifeartable, 1, -1 do
                    local v = antifeartable[i]
                    if not v or not v.Parent then
                        table.remove(antifeartable, i)
                    else
                        for _, v2 in pairs(v:GetChildren()) do
                            if v2:IsA("MeshPart") then
                                v2.Transparency = 0
                            end
                        end
                    end
                end
            elseif visiblesubspace == false then
                break
            end
        end
    else
        visiblesubspace = false
        visiblesubspaceconnect:Disconnect()
        visiblesubspacetable = {}
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Landmine" then
                for _, v2 in pairs(v:GetChildren()) do
                    if v2:IsA("MeshPart") then
                        v2.Transparency = 0.97
                    end
                end
            end
        end
    end
end)

OtherSection:NewButton("Remove Imaginary Friends", "Remove Those Annoying People", function()
    game.workspace.FriendPart:Destroy()
end)

OtherSection:NewToggle("Trigger All Landmines", "Cause Landmines To Detonate", function(state)
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

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
