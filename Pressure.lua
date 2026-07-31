local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local assets = false
local assetscolor = Color3.fromRGB(255, 255, 0)
local doors = false
local doorscolor = Color3.fromRGB(0, 255, 255)
local keycards = false
local keycardscolor = Color3.fromRGB(0, 255, 0)
local items = false
local neostyks = false
local fakedoors = false
local lockers = false
local lockerscolor = Color3.fromRGB(0, 255, 0)
local tripwires = false
local landmines = false
local nodes = false
local entities = false
local generators = false
local subspaces = false
local assetaura = false
local keycardaura = false
local itemaura = false
local neostykaura = false
local prompts = {}
local insta = false
local instaconnection
local anglerconnect
local entityconnect
local antifear = false
local visiblesubspace = false

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local speed = 1
local moveDir = Vector3.zero
local connection
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end

    if input.KeyCode == Enum.KeyCode.W then
        moveDir += Vector3.new(0, 0, -1)
    elseif input.KeyCode == Enum.KeyCode.S then
        moveDir += Vector3.new(0, 0, 1)
    elseif input.KeyCode == Enum.KeyCode.A then
        moveDir += Vector3.new(-1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.D then
        moveDir += Vector3.new(1, 0, 0)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then
        moveDir -= Vector3.new(0, 0, -1)
    elseif input.KeyCode == Enum.KeyCode.S then
        moveDir -= Vector3.new(0, 0, 1)
    elseif input.KeyCode == Enum.KeyCode.A then
        moveDir -= Vector3.new(-1, 0, 0)
    elseif input.KeyCode == Enum.KeyCode.D then
        moveDir -= Vector3.new(1, 0, 0)
    end
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
            direction = Vector3.new(direction.X, 0, direction.Z).Unit
            hrp.CFrame = hrp.CFrame + (direction * speed * 0.1)
        end
    end)
end
local function stopTPWalk()
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Pressure", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Useful For Evading Anglers")

MainSection:NewKeybind("Tp Up", "Tp Up", Enum.KeyCode.B, function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0)
end)

MainSection:NewKeybind("Tp Down", "Tp Down", Enum.KeyCode.N, function()
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
        while task.wait(0.1) do
            if assets then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and string.find(string.lower(v.Name), "currency") then
                        if not v:FindFirstChild("ESPHighlight") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "ESPHighlight"
                            highlight.FillColor = assetscolor
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
        while task.wait(0.1) do
            if doors then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v.Name == "NormalDoor" and v:IsA("Model") then
                        if v:FindFirstChild("OpenValue") then
                            if not v.OpenValue.Value then
                                if v:FindFirstChild("Door") then
                                    if not v.Door:FindFirstChild("ESPHighlight") then
                                        local highlight = Instance.new("Highlight")
                                        highlight.Name = "ESPHighlight"
                                        highlight.FillColor = doorscolor
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
        while task.wait(0.1) do
            if keycards then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
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
                            label.Text = "Keycard"
                            label.Parent = billboard
                        end
                    end
                end
            elseif keycards == false then
                break
            end
        end
    else
        keycards = false
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
        while task.wait(0.1) do
            if items then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") then
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
        lockers = true
        while task.wait(0.1) do
            if lockers then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") and v.Name == "Locker" then
                        if not v:FindFirstChild("ESPHighlight") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "ESPHighlight"
                            highlight.FillColor = lockerscolor
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
        while task.wait(0.1) do
            if neostyks then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") and string.find(string.lower(v.Name), "neostyk") then
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
        fakedoors = true
        while task.wait(0.1) do
            if fakedoors then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v.Name == "TricksterRoom" and v:IsA("Model") then
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
        tripwires = true
        while task.wait(0.1) do
            if tripwires then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") and v.Name == "Tripwire" then
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
        landmines = true
        while task.wait(0.1) do
            if landmines then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") and v.Name == "Landmine" then
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
        nodes = true
        while task.wait(0.1) do
            if nodes then
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(game.workspace:GetChildren()) do
                    if v and v:IsA("Part") then
                        if v.Name == "A60" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
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
                end
            elseif nodes == false then
                break
            end
        end
    else
        nodes = false
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
        entities = true
        while task.wait(0.1) do
            if entities then
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") then
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
                for _, v in pairs(game.workspace.GameplayFolder.Monsters:GetDescendants()) do
                    if v and v:IsA("Model") then
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
                        elseif v.Name == "DiVineRoot" and v:FindFirstChild("DwellerModel") then
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
        generators = true
        while task.wait(0.1) do
            if generators then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
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
            elseif generators == false then
                break
            end
        end
    else
        generators = false
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and (v.Name == "PresetGenerator" or v.Name == "Generator") then
                if v.Model:FindFirstChild("ESPBillboard") then
                    v.Model.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Subspace ESP", "See All Subspaces", function(state)
    if state then
        subspaces = true
        while task.wait(0.1) do
            if subspaces then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") and v.Name == "Landmine" and v.Main.Transparency ~= 0 then
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
                            label.Text = "Subspace"
                            label.Parent = billboard
                        end
                    end
                end
            elseif subspaces == false then
                break
            end
        end
    else
        subspaces = false
        for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
            if v and v:IsA("Model") and v.Name == "Landmine" then
                if v.Main:FindFirstChild("ESPBillboard") then
                    v.Main.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

local Aura = Window:NewTab("Aura")
local AuraSection = Aura:NewSection("Grab Things Close To You")

AuraSection:NewToggle("Grab All Assets Near You", "Grabs All Close Assets", function(state)
    if state then
        assetaura = true
        while task.wait(0.1) do
            if assetaura then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and string.find(string.lower(v.Name), "currency") then
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
    end
end)

AuraSection:NewToggle("Grab All Keycards Near You", "Grabs All Close Keycards", function(state)
    if state then
        keycardaura = true
        while task.wait(0.1) do
            if keycardaura then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and (v.Name == "NormalKeyCard" or v.Name == "InnerKeyCard" or v.Name == "RidgeKeyCard" or v.Name == "PasswordPaper") then
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
    end
end)

AuraSection:NewToggle("Grab All Items Near You", "Grabs All Close Items", function(state)
    if state then
        itemaura = true
        while task.wait(0.1) do
            if itemaura then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") then
                        if v.Name == "Lantern" or v.Name == "Blacklight" or v.Name == "Book" or v.Name == "CodeBreacher" or v.Name == "Defib" or v.Name == "DwellerPiece" or v.Name == "HealthBoost" or v.Name == "Notebook" or v.Name == "SPRINT" or v.Name == "ToyRemote" or v.Name == "WindupLight" or v.Name == "FlashBeacon" or v.Name == "Flashlight" or v.Name == "Gravelight" or v.Name == "Gummylight" or v.Name == "Medkit" or v.Name == "Scanner" or v.Name == "Splorglight" or v.Name == "BlueToyRemote" then
                            if v:FindFirstChild("ProxyPart") then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ProxyPart.Position).Magnitude
                                if distance <= 15 then
                                    fireproximityprompt(v.ProxyPart.ProximityPrompt)
                                end
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
    end
end)

AuraSection:NewToggle("Grab All NeoStyks Near You", "Grabs All Close NeoStyks", function(state)
    if state then
        neostykaura = true
        while task.wait(0.1) do
            if neostykaura then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and string.find(string.lower(v.Name), "neostyk") then
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

OtherSection:NewToggle("Node Monster Notifications", "Notify When A Node Monster Spawns", function(state)
    if state then
        anglerconnect = game.workspace.ChildAdded:Connect(function(v)
            if v:IsA("Part") then
                if v.Name == "A60" or v.Name == "Angler" or v.Name == "Harbinger" or v.Name == "Pandemonium" or v.Name == "Pipsqueak" or v.Name == "WitchingHour" or v.Name == "Blitz" or v.Name == "Froger" or v.Name == "Chainsmoker" or v.Name == "Pinkie" or v.Name == "RidgeAngler" or v.Name == "RidgeChainsmoker" or v.Name == "RidgePinkie" or v.Name == "RidgeBlitz" or v.Name == "RidgeFroger" or v.Name == "RidgePandemonium" or v.Name == "Anglemonium" or v.Name == "Frogermonium" or v.Name == "Blitzemonium" or v.Name == "Pandesmoker" or v.Name == "Pinkimonium" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = v.Name .. " Has Spawned", Duration = 4,})
                end
            end
        end)
    else
        anglerconnect:Disconnect()
    end
end)

OtherSection:NewToggle("Entity Notifications", "Notify When A Entity Spawns", function(state)
    if state then
        entityconnect = game.workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") then
                if v.Name == "Eyefestation" or v.Name == "Baldi" or v.Name == "BiggerStatue" or v.Name == "DiVine" or v.Name == "Lopee" or v.Name == "MeatWallDweller" or v.Name == "NoGood" or v.Name == "Fish" or v.Name == "Rebarb" or v.Name == "RottenWallDweller" or v.Name == "Statue" or v.Name == "WallDweller" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = v.Name .. " Has Spawned", Duration = 4,})
                elseif v.Name == "BiggerState" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Candlebrute" .. " Has Spawned", Duration = 4,})
                elseif v.name == "State" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "Candlebearer" .. " Has Spawned", Duration = 4,})
                elseif v.Name == "MeatWallDweller" or v.Name == "RottenWallDweller" or v.Name == "WallDweller" then
                    game.StarterGui:SetCore("SendNotification", {Title = "Alert", Text = "WallDweller" .. " Has Spawned", Duration = 4,})
                end
            end
        end)
    else
        entityconnect:Disconnect()
    end
end)

OtherSection:NewToggle("No Locker Claustrophobia", "Prevents You From Getting Kicked Out", function(state)
    if state then
        antifear = true
        while task.wait(0.1) do
            if antifear then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") and v.Name == "Locker" then
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
        visiblesubspace = true
        while task.wait(0.1) do
            if visiblesubspace then
                for _, v in pairs(game.workspace.GameplayFolder.Rooms:GetDescendants()) do
                    if v and v:IsA("Model") and v.Name == "Landmine" then
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

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)