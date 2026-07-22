local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local infstam = false
local collidedetect = false
local police = false
local keycardguard = false
local camera = false
local civilian = false
local safe = false
local keycard = false
local atm = false
local prox = 50
local polcolor = Color3.fromRGB(255, 0, 0)
local keycardguardcolor = Color3.fromRGB(255, 255, 0)
local camcolor = Color3.fromRGB(255, 165, 0)
local civcolor = Color3.fromRGB(0, 255, 0)
local untiedcivcolor = Color3.fromRGB(255, 0, 0)
local tiedcivcolor = Color3.fromRGB(255, 100, 0)
local noguards = false
local secure = false
local teleportpolice = false
local keyguard = false
local keyguardcolor = Color3.fromRGB(255, 255, 0)
local key = false
local boss = false
local bosscolor = Color3.fromRGB(0, 0, 255)
local crate = false
local camswitch = false
local timedcrate = false
local egg = false
local shadowcrate = false
local alarmbox = false
local painting = false
local masterpainting = false
local rfid = false

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Notoriety", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Things")

MainSection:NewToggle("Infinite Stamina", "No Stamina Limit", function(state)
    if state then
        infstam = true
        while task.wait(0.1) do
            if infstam then
                game.Players.LocalPlayer.Character.Stamina.Value = workspace.Camera.VMCharacter.Stamina.Value
            elseif infstam == false then
                break
            end
        end
    else
        infstam = false
    end
end)

MainSection:NewToggle("Guard Collision Detection", "No Detection For Walking Into Guards", function(state)
    if state then
        collidedetect = true
        while task.wait(0.1) do
            if collidedetect then
                for _, v in pairs(workspace.Police:GetChildren()) do
                    if v then
                        for _, v2 in pairs(v:GetChildren()) do
                            if v2:IsA("Part") or v2:IsA("MeshPart") then
                                if v2.CanTouch ~= false then
                                    v2.CanTouch = false
                                end
                            end
                        end
                    end
                end
            elseif collidedetect == false then
                break
            end
        end
    else
        collidedetect = false
        for _, v in pairs(workspace.Police:GetChildren()) do
            if v then
                for _, v2 in pairs(v:GetChildren()) do
                    if v2:IsA("Part") or v2:IsA("MeshPart") then
                        if v2.CanTouch ~= true then
                            v2.CanTouch = true
                        end
                    end
                end
            end
        end
    end
end)

MainSection:NewToggle("No Detection (Can Sometimes Be Buggy)", "Can't Interact When On But You Can Kill Guards", function(state)
    if state then
        local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        hrp.Anchored = true
        local folder = Instance.new("Folder")
        folder.Name = "PlatformFolder"
        folder.Parent = game.workspace

        local part = Instance.new("Part")
        part.Name = "HoldPlatform"
        part.Size = Vector3.new(8, 1, 8)
        part.Position = Vector3.new(hrp.Position.X, -1000, hrp.Position.Z)
        part.Anchored = true
        part.Material = "ForceField"
        part.Parent = folder

        local part2 = Instance.new("Part")
        part2.Name = "HoldPlatform"
        part2.Size = Vector3.new(8, 1, 8)
        part2.Position = part.Position + Vector3.new(0, 10.5, 0)
        part2.Anchored = true
        part2.Material = "ForceField"
        part2.Parent = folder

        local part3 = Instance.new("Part")
        part3.Name = "HoldPlatform"
        part3.Size = Vector3.new(8, 9.5, 1)
        part3.Position = part.Position + Vector3.new(0, 5.25, 3.5)
        part3.Anchored = true
        part3.Material = "ForceField"
        part3.Parent = folder

        local part4 = Instance.new("Part")
        part4.Name = "HoldPlatform"
        part4.Size = Vector3.new(8, 9.5, 1)
        part4.Position = part.Position + Vector3.new(0, 5.25, -3.5)
        part4.Anchored = true
        part4.Material = "ForceField"
        part4.Parent = folder

        local part5 = Instance.new("Part")
        part5.Name = "HoldPlatform"
        part5.Size = Vector3.new(1, 9.5, 6)
        part5.Position = part.Position + Vector3.new(3.5, 5.25, 0)
        part5.Anchored = true
        part5.Material = "ForceField"
        part5.Parent = folder

        local part6 = Instance.new("Part")
        part6.Name = "HoldPlatform"
        part6.Size = Vector3.new(1, 9.5, 6)
        part6.Position = part.Position + Vector3.new(-3.5, 5.25, 0)
        part6.Anchored = true
        part6.Material = "ForceField"
        part6.Parent = folder

        local old = hrp.CFrame
        hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
        task.wait(0.3)
        local sphere = Instance.new("Part")
        sphere.Name = "AuraSphere"
        sphere.Shape = Enum.PartType.Ball
        sphere.Size = Vector3.new(20, 20, 20)
        sphere.Position = hrp.Position
        sphere.Transparency = 1
        sphere.CanCollide = false
        sphere.Parent = game.workspace
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = hrp
        weld.Part1 = sphere
        weld.Parent = sphere
        task.wait(0.3)
        hrp.CFrame = old
        hrp.Anchored = false
    else
        game.workspace.PlatformFolder:Destroy()
        game.workspace.AuraSphere:Destroy()
    end
end)

local Remove = Window:NewTab("Remover")
local RemoveSection = Remove:NewSection("See Things Throught Walls")

RemoveSection:NewButton("Remove Glass", "Gets Rid Of All Glass", function()
    for _, v in pairs(workspace.Glass:GetChildren()) do
        v:Destroy()
    end
end)

local RemoveSection = Remove:NewSection("For Stealth Ensure You Kill The Camera Guard First")

RemoveSection:NewToggle("Remove Police (Host Only)", "Gets Rid Of All Police", function(state)
    if state then
        noguards = true
        while task.wait(0.5) do
            if noguards then
                for _, v in pairs(game.workspace.Police:GetChildren()) do
                    if v and not v:FindFirstChild("Lanyard") and not v:FindFirstChild("KeyAccessory") then
                        v.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(5000000, 5000000, 5000000)
                    end
                end
            elseif noguards == false then
                break
            end
        end
    else
        noguards = false
    end
end)

local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Teleport Stuff And Yourself")

TPSection:NewToggle("Teleport Bags To Secure Area", "Secure All Bags", function(state)
    if state then
        secure = true
        while task.wait(0.1) do
            if secure then
                for _, v in pairs(game.workspace.Bags:GetChildren()) do
                    if v.Name == "Bag" then
                        for _, v2 in pairs(v:GetChildren()) do
                            if v2:IsA("UnionOperation") then
                                if game.workspace:GetAttribute("CurrentHeist") == "Trick Or Treat" then
                                    for _, v3 in pairs(workspace.Map.Dumpsters:GetChildren()) do
                                        v2.Position = v3:GetPivot().Position + Vector3.new(0, 5, 0)
                                    end
                                else
                                    v2.Position = game.workspace.BagSecuredArea.FloorPart.Position
                                end
                            end
                        end
                    end
                end
            elseif secure == false then
                break
            end
        end
    else
        secure = false
    end
end)

TPSection:NewButton("Teleport To Secure Area", "Usually The Van", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BagSecuredArea.FloorPart.CFrame + Vector3.new(0, 5, 0)
end)

TPSection:NewKeybind("Teleport Police Infront Of You", "Good Pair With Explosives", Enum.KeyCode.N, function()
	local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local distance = 10
    for _, v in pairs(game.workspace.Police:GetChildren()) do
        v.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, -distance)
    end
end)

TPSection:NewToggle("Toggle Police Spawn Point", "Make All Police Spawn There", function(state)
    if state then
        local part = Instance.new("Part")
        part.Name = "Waypoint"
        part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        part.Size = Vector3.new(1, 1, 1)
        part.Anchored = true
        part.CanCollide = false
        part.Parent = game.workspace
        local high = Instance.new("Highlight")
        high.FillColor = Color3.new(0, 0, 1)
        high.Parent = part
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESPBillboard"
        billboard.Size = UDim2.new(0, 100, 0, 25)
        billboard.StudsOffset = Vector3.new(0, 0, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = part
        local name = Instance.new("TextLabel")
        name.Name = "name"
        name.Size = UDim2.new(1, 0, 0, 25)
        name.Position = UDim2.new(0, 0, 0, 0)
        name.BackgroundTransparency = 1
        name.TextColor3 = Color3.new(0, 0, 1)
        name.TextScaled = true
        name.Text = "Spawn Point"
        name.Parent = billboard
    else
        game.workspace.Waypoint:Destroy()
    end
end)

TPSection:NewToggle("Teleport Police To Spawn Point", "Make A Pool Of Police", function(state)
    if state then
        teleportpolice = true
        while task.wait(0.1) do
            if teleportpolice then
                for _, v in pairs(game.workspace.Police:GetChildren()) do
                    if v and v:FindFirstChild("HumanoidRootPart") then
                    v.HumanoidRootPart.CFrame = game.workspace.Waypoint.CFrame
                    end
                end
            elseif teleportpolice == false then
                break
            end
        end
    else
        teleportpolice = false
    end
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Throught Walls")

ESPSection:NewSlider("Proximity Size", "How Close Before Proximity ESP Activates", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    prox = s
end)

ESPSection:NewToggle("Police Proximity ESP", "ESP Police", function(state)
    if state then
        police = true
        while wait(0.1) do
            if police then
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(game.workspace.Police:GetChildren()) do
                    if keycardguard then
                        if not v:FindFirstChild("Lanyard") then
                            local distance = (hrp.Position - v.HumanoidRootPart.Position).Magnitude
                            local rounded = math.round(distance)
                            if rounded <= prox then
                                if v and not v:FindFirstChild("PoliceHighlight") then
                                    local highlight = Instance.new("Highlight")
                                    highlight.Name = "PoliceHighlight"
                                    highlight.FillTransparency = 0.5
                                    highlight.FillColor = polcolor
                                    highlight.OutlineTransparency = 0.5
                                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                    highlight.Parent = v
                                elseif v and v:FindFirstChild("PoliceHighlight") then
                                    v.PoliceHighlight.FillColor = polcolor
                                end
                            elseif rounded > prox and v and v:FindFirstChild("PoliceHighlight") then
                                v.PoliceHighlight:Destroy()
                            end
                        end
                    elseif keyguard then
                        if not v:FindFirstChild("KeyAccessory") then
                            local distance = (hrp.Position - v.HumanoidRootPart.Position).Magnitude
                            local rounded = math.round(distance)
                            if rounded <= prox then
                                if v and not v:FindFirstChild("PoliceHighlight") then
                                    local highlight = Instance.new("Highlight")
                                    highlight.Name = "PoliceHighlight"
                                    highlight.FillTransparency = 0.5
                                    highlight.FillColor = polcolor
                                    highlight.OutlineTransparency = 0.5
                                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                    highlight.Parent = v
                                elseif v and v:FindFirstChild("PoliceHighlight") then
                                    v.PoliceHighlight.FillColor = polcolor
                                end
                            elseif rounded > prox and v and v:FindFirstChild("PoliceHighlight") then
                                v.PoliceHighlight:Destroy()
                            end
                        end
                    else
                        local distance = (hrp.Position - v.HumanoidRootPart.Position).Magnitude
                        local rounded = math.round(distance)
                        if rounded <= prox then
                            if v and not v:FindFirstChild("PoliceHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "PoliceHighlight"
                                highlight.FillTransparency = 0.5
                                highlight.FillColor = polcolor
                                highlight.OutlineTransparency = 0.5
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.Parent = v
                            elseif v and v:FindFirstChild("PoliceHighlight") then
                                v.PoliceHighlight.FillColor = polcolor
                            end
                        elseif rounded > prox and v and v:FindFirstChild("PoliceHighlight") then
                            v.PoliceHighlight:Destroy()
                        end
                    end
                end
            elseif police == false then
                break
            end
        end
    else
        police = false
        for _, v2 in pairs(game.workspace.Police:GetChildren()) do
            if v2 and v2:FindFirstChild("PoliceHighlight") then
                v2.PoliceHighlight:Destroy()
            end
        end
    end
end)

ESPSection:NewColorPicker("Police ESP Color", "Change Its Color", Color3.fromRGB(255,0,0), function(color)
    polcolor = color
end)

ESPSection:NewToggle("Keycard Guard Proximity ESP", "ESP Keycard Guards", function(state)
    if state then
        keycardguard = true
        while wait(0.1) do
            if keycardguard then
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(game.workspace.Police:GetChildren()) do
                    if v:FindFirstChild("Lanyard") then
                        if v and not v:FindFirstChild("KeycardGuardHighlight") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "KeycardGuardHighlight"
                            highlight.FillTransparency = 0.5
                            highlight.FillColor = keycardguardcolor
                            highlight.OutlineTransparency = 0.5
                            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                            highlight.Parent = v
                        elseif v and v:FindFirstChild("KeycardGuardHighlight") then
                            v.KeycardGuardHighlight.FillColor = keycardguardcolor
                        end
                    end
                end
            elseif keycardguard == false then
                break
            end
        end
    else
        keycardguard = false
        for _, v2 in pairs(game.workspace.Police:GetChildren()) do
            if v2:FindFirstChild("Lanyard") then
                if v2 and v2:FindFirstChild("KeycardGuardHighlight") then
                    v2.KeycardGuardHighlight:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewColorPicker("Keycard Guard ESP Color", "Change Its Color", Color3.fromRGB(255,255,0), function(color)
    keycardguardcolor = color
end)

ESPSection:NewToggle("Camera Proximity ESP", "ESP Cameras", function(state)
    if state then
        camera = true
        while wait(0.1) do
            if camera then
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(game.workspace.Cameras:GetChildren()) do
                    if v.Name == "Camera" then
                        local distance = (hrp.Position - v.HeadPart.Position).Magnitude
                        local rounded = math.round(distance)
                        if rounded <= prox then
                            if v and not v:FindFirstChild("CameraHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "CameraHighlight"
                                highlight.FillTransparency = 0.5
                                highlight.FillColor = camcolor
                                highlight.OutlineTransparency = 0.5
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.Parent = v
                            elseif v and v:FindFirstChild("CameraHighlight") then
                                v.CameraHighlight.FillColor = camcolor
                            end
                        elseif rounded > prox and v and v:FindFirstChild("CameraHighlight") then
                            v.CameraHighlight:Destroy()
                        end
                    elseif v.Name == "DeathwishCamera" then
                        local distance = (hrp.Position - v.Union.Position).Magnitude
                        local rounded = math.round(distance)
                        if rounded <= prox then
                            if v and not v:FindFirstChild("CameraHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "CameraHighlight"
                                highlight.FillTransparency = 0.5
                                highlight.FillColor = camcolor
                                highlight.OutlineTransparency = 0.5
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.Parent = v
                            elseif v and v:FindFirstChild("CameraHighlight") then
                                v.CameraHighlight.FillColor = camcolor
                            end
                        elseif rounded > prox and v and v:FindFirstChild("CameraHighlight") then
                            v.CameraHighlight:Destroy()
                        end
                    elseif v.Name == "Disabled" then
                        if v and v:FindFirstChild("CameraHighlight") then
                            v.CameraHighlight:Destroy()
                        end
                    end
                end
            elseif camera == false then
                break
            end
        end
    else
        camera = false
        for _, v2 in pairs(game.workspace.Cameras:GetChildren()) do
            if v2 and v2:FindFirstChild("CameraHighlight") then
                v2.CameraHighlight:Destroy()
            end
        end
    end
end)

ESPSection:NewColorPicker("Camera ESP Color", "Change Its Color", Color3.fromRGB(255,165,0), function(color)
    camcolor = color
end)

ESPSection:NewToggle("Civilian Proximity ESP", "ESP Civilians", function(state)
    if state then
        civilian = true
        while wait(0.1) do
            if civilian then
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(game.workspace.Citizens:GetChildren()) do
                    local distance = (hrp.Position - v.HumanoidRootPart.Position).Magnitude
                    local rounded = math.round(distance)
                    if rounded <= prox then
                        if v.Name == "Citizen" then
                            if v and not v:FindFirstChild("CivilianHighlight") and not v:FindFirstChild("MafiaBossHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "CivilianHighlight"
                                highlight.FillTransparency = 0.5
                                highlight.FillColor = civcolor
                                highlight.OutlineTransparency = 0.5
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.Parent = v
                            elseif v and v:FindFirstChild("CivilianHighlight") then
                                v.CivilianHighlight.FillColor = civcolor
                            end
                        elseif v.Name == "CitizenHostage" then
                            if v and not v:FindFirstChild("CivilianHighlight") and not v:FindFirstChild("MafiaBossHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "CivilianHighlight"
                                highlight.FillTransparency = 0.5
                                highlight.FillColor = untiedcivcolor
                                highlight.OutlineTransparency = 0.5
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.Parent = v
                            elseif v and v:FindFirstChild("CivilianHighlight") then
                                v.CivilianHighlight.FillColor = untiedcivcolor
                            end
                        elseif v.Name == "CitizenTied" then
                            if v and not v:FindFirstChild("CivilianHighlight") and not v:FindFirstChild("MafiaBossHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "CivilianHighlight"
                                highlight.FillTransparency = 0.5
                                highlight.FillColor = tiedcivcolor
                                highlight.OutlineTransparency = 0.5
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.Parent = v
                            elseif v and v:FindFirstChild("CivilianHighlight") then
                                v.CivilianHighlight.FillColor = tiedcivcolor
                            end
                        end
                    elseif rounded > prox and v and v:FindFirstChild("CivilianHighlight") then
                        v.CivilianHighlight:Destroy()
                    end
                end
            elseif civilian == false then
                break
            end
        end
    else
        civilian = false
        for _, v2 in pairs(game.workspace.Citizens:GetChildren()) do
            if v2 and v2:FindFirstChild("CivilianHighlight") then
                v2.CivilianHighlight:Destroy()
            end
        end
    end
end)

ESPSection:NewColorPicker("Civilian ESP Color", "Change Its Color", Color3.fromRGB(0,255,0), function(color)
    civcolor = color
end)

ESPSection:NewColorPicker("Untied Civilian ESP Color", "Change Its Color", Color3.fromRGB(255,0,0), function(color)
    untiedcivcolor = color
end)

ESPSection:NewColorPicker("Tied Civilian ESP Color", "Change Its Color", Color3.fromRGB(255,100,0), function(color)
    tiedcivcolor = color
end)

ESPSection:NewToggle("Keycard ESP", "ESP Keycards", function(state)
    if state then
        keycard = true
        while wait(0.1) do
            if keycard then
                for _, v in pairs(game.workspace.Map:GetChildren()) do
                    if v.Name == "KeyCard" then
                        if v and not v.KeyCard:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 50, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 0, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v.KeyCard

                            local label = Instance.new("TextLabel")
                            label.Size = UDim2.new(1, 0, 0.25, 0)
                            label.Position = UDim2.new(0, 0, 0, 0)
                            label.BackgroundTransparency = 1
                            label.TextColor3 = Color3.new(0, 1, 0)
                            label.TextScaled = true
                            label.Text = "Keycard"
                            label.Parent = billboard
                        end
                    end
                end
            elseif keycard == false then
                break
            end
        end
    else
        keycard = false
        for _, v in pairs(game.workspace.Map:GetChildren()) do
            if v.Name == "KeyCard" then
                if v and v.KeyCard:FindFirstChild("ESPBillboard") then
                    v.KeyCard.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Safe ESP", "ESP Safes", function(state)
    if state then
        safe = true
        while wait(0.1) do
            if safe then
                for _, v in pairs(game.workspace.SafeSpots:GetChildren()) do
                    if v.Name ~= "SafesScript" then
                        if v.Name == "CardboardSafeSpot" then
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
                                label.TextColor3 = Color3.new(0, 1, 0)
                                label.TextScaled = true
                                label.Text = "Cardboard Safe"
                                label.Parent = billboard
                            end
                        elseif v.Name == "MetalSafeSpot" then
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
                                label.TextColor3 = Color3.new(0, 1, 0)
                                label.TextScaled = true
                                label.Text = "Metal Safe"
                                label.Parent = billboard
                            end
                        end
                    end
                end
            elseif safe == false then
                break
            end
        end
    else
        safe = false
        for _, v2 in pairs(game.workspace.SafeSpots:GetChildren()) do
            if v2.Name ~= "SafesScript" then
                if v2 and v2:FindFirstChild("ESPBillboard") then
                    v2.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("ATM ESP", "ESP ATMs", function(state)
    if state then
        atm = true
        while wait(0.1) do
            if atm then
                for _, v in pairs(game.workspace.Map:GetChildren()) do
                    if v.Name == "Atm" then
                        local opened = v:FindFirstChild("Opened")
                        if v and opened.Value ~= true and not v:FindFirstChild("ESPBillboard") then
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
                            label.Text = "ATM"
                            label.Parent = billboard
                        elseif v and opened.Value == true and v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard:Destroy()
                        end
                    end
                end
            elseif atm == false then
                break
            end
        end
    else
        atm = false
        for _, v in pairs(game.workspace.Map:GetChildren()) do
            if v.Name == "Atm" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

local Map = Window:NewTab("Heist Specific")
local MapSection = Map:NewSection("The Depot")

MapSection:NewToggle("Key Guard Proximity ESP", "ESP Key Guards", function(state)
    if state then
        keyguard = true
        while wait(0.1) do
            if keyguard then
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(game.workspace.Police:GetChildren()) do
                    if v:FindFirstChild("KeyAccessory") then
                        local distance = (hrp.Position - v.HumanoidRootPart.Position).Magnitude
                        local rounded = math.round(distance)
                        if rounded <= prox then
                            if v and not v:FindFirstChild("KeyGuardHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "KeyGuardHighlight"
                                highlight.FillTransparency = 0.5
                                highlight.FillColor = keyguardcolor
                                highlight.OutlineTransparency = 0.5
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.Parent = v
                            elseif v and v:FindFirstChild("KeyGuardHighlight") then
                                v.KeyGuardHighlight.FillColor = keyguardcolor
                            end
                        elseif rounded > prox and v and v:FindFirstChild("KeyGuardHighlight") then
                            v.KeyGuardHighlight:Destroy()
                        end
                    end
                end
            elseif keyguard == false then
                break
            end
        end
    else
        keyguard = false
        for _, v2 in pairs(game.workspace.Police:GetChildren()) do
            if v2:FindFirstChild("Lanyard") then
                if v2 and v2:FindFirstChild("KeyGuardHighlight") then
                    v2.KeyGuardHighlight:Destroy()
                end
            end
        end
    end
end)

MapSection:NewColorPicker("Key Guard ESP Color", "Change Its Color", Color3.fromRGB(255,255,0), function(color)
    keyguardcolor = color
end)

MapSection:NewToggle("Key ESP", "ESP Keys", function(state)
    if state then
        key = true
        while wait(0.1) do
            if key then
                for _, v in pairs(game.workspace.Map.Keys:GetChildren()) do
                    if v.Name == "Key" then
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
                            label.Text = "Key"
                            label.Parent = billboard
                        end
                    end
                end
            elseif key == false then
                break
            end
        end
    else
        key = false
        for _, v in pairs(game.workspace.Map.Keys:GetChildren()) do
            if v.Name == "Key" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

MapSection:NewToggle("Mafia Boss ESP", "ESP Mafia Boss", function(state)
    if state then
        boss = true
        while wait(0.1) do
            if boss then
                for _, v in pairs(game.workspace.Citizens:GetChildren()) do
                    if v and v:FindFirstChild("Minty Fedora") and not v:FindFirstChild("MafiaBossHighlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "MafiaBossHighlight"
                        highlight.FillTransparency = 0.5
                        highlight.FillColor = bosscolor
                        highlight.OutlineTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.Parent = v
                    elseif v and v:FindFirstChild("MafiaBossHighlight") then
                        v.MafiaBossHighlight.FillColor = bosscolor
                    end
                end
            elseif boss == false then
                break
            end
        end
    else
        boss = false
        for _, v2 in pairs(game.workspace.Citizens:GetChildren()) do
            if v2:FindFirstChild("Minty Fedora") then
                if v2 and v2:FindFirstChild("MafiaBossHighlight") then
                    v2.MafiaBossHighlight:Destroy()
                end
            end
        end
    end
end)

MapSection:NewColorPicker("Mafia Boss ESP Color", "Change Its Color", Color3.fromRGB(0,0,255), function(color)
    bosscolor = color
end)



MapSection:NewToggle("Cam Switch ESP", "ESP Cam Switch", function(state)
    if state then
        camswitch = true
        while wait(0.1) do
            if camswitch then
                for _, v in pairs(game.workspace.Map.CameraBoxes:GetChildren()) do
                    if v.Name == "CamDisabler" then
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
                            label.TextColor3 = Color3.new(0, 1, 1)
                            label.TextScaled = true
                            label.Text = "Cam Switch"
                            label.Parent = billboard
                        end
                    elseif v.Name == "TransportBoatSignal" or v.Name == "pulledSignal" then
                        if v and v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard:Destroy()
                        end
                    end
                end
            elseif camswitch == false then
                break
            end
        end
    else
        camswitch = false
        for _, v in pairs(game.workspace.Map.CameraBoxes:GetChildren()) do
            if v.Name == "CamDisabler" or v.Name == "TransportBoatSignal" or v.Name == "pulledSignal" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

local MapSection = Map:NewSection("Authority")

MapSection:NewToggle("Timed Crate ESP", "ESP Timed Crates", function(state)
    if state then
        timedcrate = true
        while wait(0.1) do
            if timedcrate then
                for _, v in pairs(game.workspace.Map:GetChildren()) do
                    if v.Name == "MilitaryCrateTIMED" then
                        local time = v:FindFirstChild("Timer")
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
                            label.Text = "Crate [" .. time.Value .. "]"
                            label.Parent = billboard
                        elseif v and v:FindFirstChild("ESPBillboard") and v.Name == "MilitaryCrateTIMED" then
                            v.ESPBillboard.TextLabel.Text = "Crate [" .. time.Value .. "]"
                        end
                    elseif v.Name == "MilitaryCrateUNTIMED" then
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
                            label.Text = "Disarmed Crate"
                            label.Parent = billboard
                        elseif v and v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard.TextLabel.Text = "Disarmed Crate"
                        end
                    elseif v.Name == "BoomedBox" or v.Name == "OpenMilitaryCrate" then
                        if v and v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard:Destroy()
                        end
                    end
                end
            elseif timedcrate == false then
                break
            end
        end
    else
        timedcrate = false
        for _, v in pairs(game.workspace.Map:GetChildren()) do
            if v.Name == "MilitaryCrateTIMED" or v.Name == "BoomedBox" or v.Name == "MilitaryCrateUNTIMED" or v.Name == "OpenMilitaryCrate" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

local MapSection = Map:NewSection("Downtown Bank")

MapSection:NewButton("Remove Security Door", "Deletes The Security Door", function()
    for _, v in pairs(game.workspace.Map:GetChildren()) do
        if v.Name == "SecurityDoor" and v:FindFirstChild("Security Door") then
            v["Security Door"]:Destroy()
        end
    end
end)

MapSection:NewToggle("Easter Egg ESP", "ESP Easter Eggs", function(state)
    if state then
        egg = true
        while wait(0.1) do
            if egg then
                for _, v in pairs(game.workspace.EasterEggs:GetChildren()) do
                    if v.Name == "DowntownEgg" then
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
                            label.Text = "Egg"
                            label.Parent = billboard
                        end
                    elseif v.Name == "DowntownEgg"then
                        if v and v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard:Destroy()
                        end
                    end
                end
            elseif egg == false then
                break
            end
        end
    else
        egg = false
        for _, v in pairs(game.workspace.EasterEggs:GetChildren()) do
            if v.Name == "DowntownEgg" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

local MapSection = Map:NewSection("Shadow Raid")

MapSection:NewToggle("Crate ESP", "ESP Crates", function(state)
    if state then
        shadowcrate = true
        while wait(0.1) do
            if shadowcrate then
                for _, v in pairs(game.workspace.Map.ShadowBoxes:GetChildren()) do
                    if v.Name == "RandomCrate" then
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
                            label.TextColor3 = Color3.new(0, 1, 0)
                            label.TextScaled = true
                            label.Text = "Crate"
                            label.Parent = billboard
                        end
                    elseif v.Name == "OpenCrate" then
                        if v and v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard:Destroy()
                        end
                    end
                end
            elseif shadowcrate == false then
                break
            end
        end
    else
        shadowcrate = false
        for _, v in pairs(game.workspace.Map.ShadowBoxes:GetChildren()) do
            if v.Name == "RandomCrate" or v.Name == "OpenCrate" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

MapSection:NewButton("Remove Sewer Gates", "Deletes The Sewer Gates", function()
    for _, v in pairs(game.workspace.Map.Thermals:GetChildren()) do
        if v.Name == "ShadowThermalPaste" then
            v:Destroy()
        end
    end
end)

local MapSection = Map:NewSection("Art Gallery")

MapSection:NewToggle("Place Truss On Exterior Wall", "Simple Free Version Of The Truck Asset", function(state)
    if state then
        local truss = Instance.new("TrussPart")
        truss.Size = Vector3.new(2, 15, 2)
        truss.Position = Vector3.new(72, 16, -45)
        truss.Anchored = true
        truss.Name = "WallClimbTruss"
        truss.Parent = game.workspace
    else
        game.workspace.WallClimbTruss:Destroy()
    end
end)

MapSection:NewToggle("Alarm Box ESP", "ESP Alarm Box", function(state)
    if state then
        alarmbox = true
        while wait(0.1) do
            if alarmbox then
                for _, v in pairs(game.workspace.Map.PowerBoxes:GetChildren()) do
                    if v.Name == "ArtPowerBox" then
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
                            label.TextColor3 = Color3.new(0, 1, 1)
                            label.TextScaled = true
                            label.Text = "Alarm Box"
                            label.Parent = billboard
                        end
                    elseif v.Name == "TransportBoatSignal" or v.Name == "pulledSignal" then
                        if v and v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard:Destroy()
                        end
                    end
                end
            elseif alarmbox == false then
                break
            end
        end
    else
        alarmbox = false
        for _, v in pairs(game.workspace.Map.PowerBoxes:GetChildren()) do
            if v.Name == "ArtPowerBox" or v.Name == "TransportBoatSignal" or v.Name == "pulledSignal" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

MapSection:NewToggle("Painting ESP", "ESP Paintings", function(state)
    if state then
        painting = true
        while wait(0.1) do
            if painting then
                for _, v in pairs(game.workspace.Map.Paintings:GetChildren()) do
                    if v.Name == "Painting" and v:FindFirstChild("LootablePainting") then
                        if v and not v.LootablePainting:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 50, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 0, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v.LootablePainting

                            local label = Instance.new("TextLabel")
                            label.Size = UDim2.new(1, 0, 0.25, 0)
                            label.Position = UDim2.new(0, 0, 0, 0)
                            label.BackgroundTransparency = 1
                            label.TextColor3 = Color3.fromRGB(255, 165, 0)
                            label.TextScaled = true
                            label.Text = "Painting"
                            label.Parent = billboard
                        end
                    end
                end
            elseif painting == false then
                break
            end
        end
    else
        painting = false
        for _, v in pairs(game.workspace.Map.Paintings:GetChildren()) do
            if v.Name == "Painting" then
                if v and v:FindFirstChild("LootablePainting") and v:FindFirstChild("ESPBillboard") then
                    v.LootablePainting.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

MapSection:NewToggle("Masterpiece ESP", "ESP Masterpiece", function(state)
    if state then
        masterpainting = true
        while wait(0.1) do
            if masterpainting then
                for _, v in pairs(game.workspace.Map.Paintings:GetChildren()) do
                    if v.Name == "Painting" and v:FindFirstChild("LootableMasterpiece") then
                        if v and not v.LootableMasterpiece:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 50, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 0, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v.LootableMasterpiece

                            local label = Instance.new("TextLabel")
                            label.Size = UDim2.new(1, 0, 0.25, 0)
                            label.Position = UDim2.new(0, 0, 0, 0)
                            label.BackgroundTransparency = 1
                            label.TextColor3 = Color3.new(1, 0, 0)
                            label.TextScaled = true
                            label.Text = "Masterpiece"
                            label.Parent = billboard
                        end
                    end
                end
            elseif masterpainting == false then
                break
            end
        end
    else
        masterpainting = false
        for _, v in pairs(game.workspace.Map.Paintings:GetChildren()) do
            if v.Name == "Painting" and v:FindFirstChild("LootableMasterpiece") then
                if v and v.LootableMasterpiece:FindFirstChild("ESPBillboard") then
                    v.LootableMasterpiece.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

MapSection:NewButton("Remove Security Door", "Deletes The Security Door", function()
    for _, v in pairs(game.workspace.Map.ArtGallery:GetChildren()) do
        if v.Name == "SecurityRoomDoor1" or v.Name == "SecurityRoomDoor2" or v.Name == "SecurityRoomDoor3" then
            if v:FindFirstChild("Access") then
                v.Access.VaultDoor:Destroy()
            end
        end
    end
end)

MapSection:NewToggle("Walk Throught Laser Doors", "Laser Doors Wont Trigger The Alarm", function(state)
    if state then
        for _, v in pairs(game.workspace.Map.Lasers:GetChildren()) do
            if v.Name == "LaserDoor" and v:FindFirstChild("LaserTouch") then
                v.LaserTouch.CanTouch = false
            end
        end
    else
        for _, v in pairs(game.workspace.Map.Lasers:GetChildren()) do
            if v.Name == "LaserDoor" and v:FindFirstChild("LaserTouch") then
                v.LaserTouch.CanTouch = true
            end
        end
    end
end)

local MapSection = Map:NewSection("The Ozela Heist")

MapSection:NewToggle("Solve RFID And Correct Sequence ESP", "ESP The Right Ozela Box With The Sequence", function(state)
    if state then
        rfid = true
        while task.wait(0.1) do
            if rfid then
                local c1 = ""
                local c2 = ""
                local c3 = ""
                local c4 = ""
                local rfidreader = workspace.prop_stadium_cardReader
                for _, v in pairs(game.workspace:GetChildren()) do
                    if v.Name == "colorBoxRNG" then
                        for _, v2 in pairs(game.workspace.Blueprints.prop_stadium_blueprintTableRNG.prop_stadium_blueprint:GetChildren()) do
                            if v2.Name ~= "main" then
                                if v2:FindFirstChild("serial").SurfaceGui.TextLabel.Text == rfidreader.main.serial.SurfaceGui.TextLabel.Text then
                                    c1 = v2.colors["1"].SurfaceGui.TextLabel.Text
                                    c2 = v2.colors["2"].SurfaceGui.TextLabel.Text
                                    c3 = v2.colors["3"].SurfaceGui.TextLabel.Text
                                    c4 = v2.colors["4"].SurfaceGui.TextLabel.Text
                                end
                            end
                        end
                        if v.serial.SurfaceGui.TextLabel.Text == rfidreader.main.serial.SurfaceGui.TextLabel.Text then
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
                                label.TextColor3 = Color3.new(0, 1, 0)
                                label.TextScaled = true
                                label.Text = "Code: " .. c1 .. c2 .. c3 .. c4
                                label.Parent = billboard
                            end
                        end
                    end
                end
            elseif rfid == false then
                break
            end
        end
    else
        rfid = false
        for _, v in pairs(game.workspace:GetChildren()) do
            if v.Name == "colorBoxRNG" and v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

local MapSection = Map:NewSection("R&B Bank")

MapSection:NewButton("Remove Security Door", "Deletes The Security Door", function()
    for _, v in pairs(game.workspace.Map:GetChildren()) do
        if v.Name == "SecurityDoor" then
            v:Destroy()
        end
    end
end)

MapSection:NewButton("Remove Invis Vault Part", "Removes It So You Can Enter Prematurely", function()
    for _, v in pairs(workspace.InvisibleParts:GetChildren()) do
        if v.Name == "invisibleVaultPart" then
            v:Destroy()
        end
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
