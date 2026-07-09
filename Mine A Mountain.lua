local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local t1esp = false
local t2esp = false
local t3esp = false
local t4esp = false
local t5esp = false
local t6esp = false
local instantinteract = false

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Mine A Mountain", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Things")

MainSection:NewSlider("WalkSpeed", "Move Faster", 50, 16, function(s) -- 50 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Through Walls")

ESPSection:NewToggle("Common ESP", "ESP For Tier 1 Crystals", function(state)
    if state then
        t1esp = true
        while task.wait(0.1) do
            if t1esp then
                local crystal = workspace.Things.Crystals
                local droppedcrystal = workspace.DroppedCrystals
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(crystal:GetChildren()) do
                    if v:GetAttribute("Tier") == 1 then
                        local numdistance = (hrp.Position - v.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
                for _, v2 in pairs(droppedcrystal:GetChildren()) do
                    if v2:GetAttribute("Tier") == 1 then
                        local numdistance = (hrp.Position - v2.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v2:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v2

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v2:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v2:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v2.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v2:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v2:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v2:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v2:FindFirstChild("ESPBillboard") then
                            v2.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
            elseif t1esp == false then
                break
            end
        end

    else
        t1esp = false
        local crystal = workspace.Things.Crystals
        local droppedcrystal = workspace.DroppedCrystals
        for _, v in pairs(crystal:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 1 then
                v.ESPBillboard:Destroy()
            end
        end
        for _, v2 in pairs(droppedcrystal:GetChildren()) do
            if v2:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 1 then
                v2.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Uncommon ESP", "ESP For Tier 2 Crystals", function(state)
    if state then
        t2esp = true
        while task.wait(0.1) do
            if t2esp then
                local crystal = workspace.Things.Crystals
                local droppedcrystal = workspace.DroppedCrystals
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(crystal:GetChildren()) do
                    if v:GetAttribute("Tier") == 2 then
                        local numdistance = (hrp.Position - v.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
                for _, v2 in pairs(droppedcrystal:GetChildren()) do
                    if v2:GetAttribute("Tier") == 2 then
                        local numdistance = (hrp.Position - v2.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v2:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v2

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v2:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v2:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v2.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v2:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v2:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v2:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v2:FindFirstChild("ESPBillboard") then
                            v2.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
            elseif t2esp == false then
                break
            end
        end

    else
        t2esp = false
        local crystal = workspace.Things.Crystals
        local droppedcrystal = workspace.DroppedCrystals
        for _, v in pairs(crystal:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 2 then
                v.ESPBillboard:Destroy()
            end
        end
        for _, v2 in pairs(droppedcrystal:GetChildren()) do
            if v2:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 2 then
                v2.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Rare ESP", "ESP For Tier 3 Crystals", function(state)
    if state then
        t3esp = true
        while task.wait(0.1) do
            if t3esp then
                local crystal = workspace.Things.Crystals
                local droppedcrystal = workspace.DroppedCrystals
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(crystal:GetChildren()) do
                    if v:GetAttribute("Tier") == 3 then
                        local numdistance = (hrp.Position - v.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
                for _, v2 in pairs(droppedcrystal:GetChildren()) do
                    if v2:GetAttribute("Tier") == 3 then
                        local numdistance = (hrp.Position - v2.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v2:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v2

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v2:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v2:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v2.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v2:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v2:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v2:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v2:FindFirstChild("ESPBillboard") then
                            v2.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
            elseif t3esp == false then
                break
            end
        end

    else
        t3esp = false
        local crystal = workspace.Things.Crystals
        local droppedcrystal = workspace.DroppedCrystals
        for _, v in pairs(crystal:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 3 then
                v.ESPBillboard:Destroy()
            end
        end
        for _, v2 in pairs(droppedcrystal:GetChildren()) do
            if v2:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 3 then
                v2.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Epic ESP", "ESP For Tier 4 Crystals", function(state)
    if state then
        t4esp = true
        while task.wait(0.1) do
            if t4esp then
                local crystal = workspace.Things.Crystals
                local droppedcrystal = workspace.DroppedCrystals
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(crystal:GetChildren()) do
                    if v:GetAttribute("Tier") == 4 then
                        local numdistance = (hrp.Position - v.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
                for _, v2 in pairs(droppedcrystal:GetChildren()) do
                    if v2:GetAttribute("Tier") == 4 then
                        local numdistance = (hrp.Position - v2.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v2:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v2

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v2:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v2:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v2.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v2:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v2:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v2:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v2:FindFirstChild("ESPBillboard") then
                            v2.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
            elseif t4esp == false then
                break
            end
        end

    else
        t4esp = false
        local crystal = workspace.Things.Crystals
        local droppedcrystal = workspace.DroppedCrystals
        for _, v in pairs(crystal:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 4 then
                v.ESPBillboard:Destroy()
            end
        end
        for _, v2 in pairs(droppedcrystal:GetChildren()) do
            if v2:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 4 then
                v2.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Legendary ESP", "ESP For Tier 5 Crystals", function(state)
    if state then
        t5esp = true
        while task.wait(0.1) do
            if t5esp then
                local crystal = workspace.Things.Crystals
                local droppedcrystal = workspace.DroppedCrystals
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(crystal:GetChildren()) do
                    if v:GetAttribute("Tier") == 5 then
                        local numdistance = (hrp.Position - v.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
                for _, v2 in pairs(droppedcrystal:GetChildren()) do
                    if v2:GetAttribute("Tier") == 5 then
                        local numdistance = (hrp.Position - v2.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v2:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v2

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v2:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v2:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v2.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v2:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v2:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v2:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v2:FindFirstChild("ESPBillboard") then
                            v2.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
            elseif t5esp == false then
                break
            end
        end

    else
        t5esp = false
        local crystal = workspace.Things.Crystals
        local droppedcrystal = workspace.DroppedCrystals
        for _, v in pairs(crystal:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 5 then
                v.ESPBillboard:Destroy()
            end
        end
        for _, v2 in pairs(droppedcrystal:GetChildren()) do
            if v2:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 5 then
                v2.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Mythical ESP", "ESP For Tier 6 Crystals", function(state)
    if state then
        t6esp = true
        while task.wait(0.1) do
            if t6esp then
                local crystal = workspace.Things.Crystals
                local droppedcrystal = workspace.DroppedCrystals
                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                for _, v in pairs(crystal:GetChildren()) do
                    if v:GetAttribute("Tier") == 6 then
                        local numdistance = (hrp.Position - v.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
                for _, v2 in pairs(droppedcrystal:GetChildren()) do
                    if v2:GetAttribute("Tier") == 6 then
                        local numdistance = (hrp.Position - v2.Position).Magnitude
                        local rounded = math.round(numdistance)
                        if not v2:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 100)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v2

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0.25, 0)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = v2:GetAttribute("CrystalName")
                            name.Parent = billboard

                            local size = Instance.new("TextLabel")
                            size.Name = "size"
                            size.Size = UDim2.new(0.5, 0, 0.25, 0)
                            size.Position = UDim2.new(0, 0, 0, 25)
                            size.BackgroundTransparency = 1
                            size.TextColor3 = Color3.fromRGB(200, 200, 200)
                            size.TextScaled = true
                            size.Text = v2:GetAttribute("SizeClassName")
                            size.Parent = billboard

                            local tier = Instance.new("TextLabel")
                            tier.Name = "tier"
                            tier.Size = UDim2.new(0.5, 0, 0.25, 0)
                            tier.Position = UDim2.new(0.5, 0, 0, 25)
                            tier.BackgroundTransparency = 1
                            tier.TextColor3 = v2.Color
                            tier.TextScaled = true
                            tier.Text = "Tier " .. v2:GetAttribute("Tier")
                            tier.Parent = billboard

                            local value = Instance.new("TextLabel")
                            value.Name = "value"
                            value.Size = UDim2.new(0.5, 0, 0.25, 0)
                            value.Position = UDim2.new(0, 0, 0, 50)
                            value.BackgroundTransparency = 1
                            value.TextColor3 = Color3.new(1, 1, 0)
                            value.TextScaled = true
                            value.Text = "$" .. v2:GetAttribute("Value")
                            value.Parent = billboard

                            local weight = Instance.new("TextLabel")
                            weight.Name = "weight"
                            weight.Size = UDim2.new(0.5, 0, 0.25, 0)
                            weight.Position = UDim2.new(0.5, 0, 0, 50)
                            weight.BackgroundTransparency = 1
                            weight.TextColor3 = Color3.new(0, 1, 1)
                            weight.TextScaled = true
                            weight.Text = v2:GetAttribute("WeightKg") .. "kg"
                            weight.Parent = billboard

                            local distance = Instance.new("TextLabel")
                            distance.Name = "distance"
                            distance.Size = UDim2.new(1, 0, 0.25, 0)
                            distance.Position = UDim2.new(0, 0, 0, 75)
                            distance.BackgroundTransparency = 1
                            distance.TextColor3 = Color3.new(0, 0, 0)
                            distance.TextScaled = true
                            distance.Text = "[" .. rounded .. " studs]"
                            distance.Parent = billboard
                        elseif v2:FindFirstChild("ESPBillboard") then
                            v2.ESPBillboard.distance.Text = "[" .. rounded .. " studs]"
                        end
                    end
                end
            elseif t6esp == false then
                break
            end
        end

    else
        t6esp = false
        local crystal = workspace.Things.Crystals
        local droppedcrystal = workspace.DroppedCrystals
        for _, v in pairs(crystal:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 6 then
                v.ESPBillboard:Destroy()
            end
        end
        for _, v2 in pairs(droppedcrystal:GetChildren()) do
            if v2:FindFirstChild("ESPBillboard") and v:GetAttribute("Tier") == 6 then
                v2.ESPBillboard:Destroy()
            end
        end
    end
end)

local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Teleport To Things")

TPSection:NewButton("Teleport To Spawn", "Teleport To The Spawn", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    hrp.CFrame = CFrame.new(-12.0329285, 29.2260914, 1069.58264, 0.993910015, -5.4116983e-21, -0.110194623, 5.00377022e-21, 1, -3.9784229e-21, 0.110194623, 3.40280576e-21, 0.993910015)
end)

TPSection:NewButton("Teleport To Common Crystal", "Teleport To A Tier 1", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local crystal = workspace.Things.Crystals
    local droppedcrystal = workspace.DroppedCrystals

    local count = 0

    for _, v in pairs(droppedcrystal:GetChildren()) do
        if v.Name == "DroppedCrystal_T1" then
            local part = Instance.new("Part")
            part.Name = "TPPart"
            part.Position = v.Position
            part.Size = Vector3.new(5, 1, 5)
            part.Anchored = true
            part.Parent = game.workspace
            local high = Instance.new("Highlight")
            high.Parent = part
            count += 1
            hrp.CFrame = part.CFrame
            hrp.Anchored = true
            task.wait(1)
            hrp.Anchored = false
            part:Destroy()

            game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Dropped Crystal", Duration = 4,})

            break
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Changing Folders", Text = "No Dropped Crystal", Duration = 4,})

        for _, v2 in pairs(crystal:GetChildren()) do
            if v2.Name == "Crystal_T1" then
                local part = Instance.new("Part")
                part.Name = "TPPart"
                part.Position = v2.Position
                part.Size = Vector3.new(5, 1, 5)
                part.Anchored = true
                part.Parent = game.workspace
                local high = Instance.new("Highlight")
                high.Parent = part
                count += 1
                hrp.CFrame = part.CFrame
                hrp.Anchored = true
                task.wait(1)
                hrp.Anchored = false
                part:Destroy()

                game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Crystal", Duration = 4,})

                break
            end
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Failed", Text = "No Tier 1 Crystal Found", Duration = 4,})
    end
end)

TPSection:NewButton("Teleport To Uncommon Crystal", "Teleport To A Tier 2", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local crystal = workspace.Things.Crystals
    local droppedcrystal = workspace.DroppedCrystals

    local count = 0

    for _, v in pairs(droppedcrystal:GetChildren()) do
        if v.Name == "DroppedCrystal_T2" then
            local part = Instance.new("Part")
            part.Name = "TPPart"
            part.Position = v.Position
            part.Size = Vector3.new(5, 1, 5)
            part.Anchored = true
            part.Parent = game.workspace
            local high = Instance.new("Highlight")
            high.Parent = part
            count += 1
            hrp.CFrame = part.CFrame
            hrp.Anchored = true
            task.wait(1)
            hrp.Anchored = false
            part:Destroy()

            game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Dropped Crystal", Duration = 4,})

            break
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Changing Folders", Text = "No Dropped Crystal", Duration = 4,})

        for _, v2 in pairs(crystal:GetChildren()) do
            if v2.Name == "Crystal_T2" then
                local part = Instance.new("Part")
                part.Name = "TPPart"
                part.Position = v2.Position
                part.Size = Vector3.new(5, 1, 5)
                part.Anchored = true
                part.Parent = game.workspace
                local high = Instance.new("Highlight")
                high.Parent = part
                count += 1
                hrp.CFrame = part.CFrame
                hrp.Anchored = true
                task.wait(1)
                hrp.Anchored = false
                part:Destroy()

                game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Crystal", Duration = 4,})

                break
            end
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Failed", Text = "No Tier 2 Crystal Found", Duration = 4,})
    end
end)

TPSection:NewButton("Teleport To Rare Crystal", "Teleport To A Tier 3", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local crystal = workspace.Things.Crystals
    local droppedcrystal = workspace.DroppedCrystals

    local count = 0

    for _, v in pairs(droppedcrystal:GetChildren()) do
        if v.Name == "DroppedCrystal_T3" then
            local part = Instance.new("Part")
            part.Name = "TPPart"
            part.Position = v.Position
            part.Size = Vector3.new(5, 1, 5)
            part.Anchored = true
            part.Parent = game.workspace
            local high = Instance.new("Highlight")
            high.Parent = part
            count += 1
            hrp.CFrame = part.CFrame
            hrp.Anchored = true
            task.wait(1)
            hrp.Anchored = false
            part:Destroy()

            game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Dropped Crystal", Duration = 4,})

            break
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Changing Folders", Text = "No Dropped Crystal", Duration = 4,})

        for _, v2 in pairs(crystal:GetChildren()) do
            if v2.Name == "Crystal_T3" then
                local part = Instance.new("Part")
                part.Name = "TPPart"
                part.Position = v2.Position
                part.Size = Vector3.new(5, 1, 5)
                part.Anchored = true
                part.Parent = game.workspace
                local high = Instance.new("Highlight")
                high.Parent = part
                count += 1
                hrp.CFrame = part.CFrame
                hrp.Anchored = true
                task.wait(1)
                hrp.Anchored = false
                part:Destroy()

                game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Crystal", Duration = 4,})

                break
            end
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Failed", Text = "No Tier 3 Crystal Found", Duration = 4,})
    end
end)

TPSection:NewButton("Teleport To Epic Crystal", "Teleport To A Tier 4", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local crystal = workspace.Things.Crystals
    local droppedcrystal = workspace.DroppedCrystals

    local count = 0

    for _, v in pairs(droppedcrystal:GetChildren()) do
        if v.Name == "DroppedCrystal_T4" then
            local part = Instance.new("Part")
            part.Name = "TPPart"
            part.Position = v.Position
            part.Size = Vector3.new(5, 1, 5)
            part.Anchored = true
            part.Parent = game.workspace
            local high = Instance.new("Highlight")
            high.Parent = part
            count += 1
            hrp.CFrame = part.CFrame
            hrp.Anchored = true
            task.wait(1)
            hrp.Anchored = false
            part:Destroy()

            game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Dropped Crystal", Duration = 4,})

            break
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Changing Folders", Text = "No Dropped Crystal", Duration = 4,})

        for _, v2 in pairs(crystal:GetChildren()) do
            if v2.Name == "Crystal_T4" then
                local part = Instance.new("Part")
                part.Name = "TPPart"
                part.Position = v2.Position
                part.Size = Vector3.new(5, 1, 5)
                part.Anchored = true
                part.Parent = game.workspace
                local high = Instance.new("Highlight")
                high.Parent = part
                count += 1
                hrp.CFrame = part.CFrame
                hrp.Anchored = true
                task.wait(1)
                hrp.Anchored = false
                part:Destroy()

                game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Crystal", Duration = 4,})

                break
            end
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Failed", Text = "No Tier 4 Crystal Found", Duration = 4,})
    end
end)

TPSection:NewButton("Teleport To Legendary Crystal", "Teleport To A Tier 5", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local crystal = workspace.Things.Crystals
    local droppedcrystal = workspace.DroppedCrystals

    local count = 0

    for _, v in pairs(droppedcrystal:GetChildren()) do
        if v.Name == "DroppedCrystal_T5" then
            local part = Instance.new("Part")
            part.Name = "TPPart"
            part.Position = v.Position
            part.Size = Vector3.new(5, 1, 5)
            part.Anchored = true
            part.Parent = game.workspace
            local high = Instance.new("Highlight")
            high.Parent = part
            count += 1
            hrp.CFrame = part.CFrame
            hrp.Anchored = true
            task.wait(1)
            hrp.Anchored = false
            part:Destroy()

            game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Dropped Crystal", Duration = 4,})

            break
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Changing Folders", Text = "No Dropped Crystal", Duration = 4,})

        for _, v2 in pairs(crystal:GetChildren()) do
            if v2.Name == "Crystal_T5" then
                local part = Instance.new("Part")
                part.Name = "TPPart"
                part.Position = v2.Position
                part.Size = Vector3.new(5, 1, 5)
                part.Anchored = true
                part.Parent = game.workspace
                local high = Instance.new("Highlight")
                high.Parent = part
                count += 1
                hrp.CFrame = part.CFrame
                hrp.Anchored = true
                task.wait(1)
                hrp.Anchored = false
                part:Destroy()

                game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Crystal", Duration = 4,})

                break
            end
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Failed", Text = "No Tier 5 Crystal Found", Duration = 4,})
    end
end)

TPSection:NewButton("Teleport To Mythical Crystal", "Teleport To A Tier 6", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local crystal = workspace.Things.Crystals
    local droppedcrystal = workspace.DroppedCrystals

    local count = 0

    for _, v in pairs(droppedcrystal:GetChildren()) do
        if v.Name == "DroppedCrystal_T6" then
            local part = Instance.new("Part")
            part.Name = "TPPart"
            part.Position = v.Position
            part.Size = Vector3.new(5, 1, 5)
            part.Anchored = true
            part.Parent = game.workspace
            local high = Instance.new("Highlight")
            high.Parent = part
            count += 1
            hrp.CFrame = part.CFrame
            hrp.Anchored = true
            task.wait(1)
            hrp.Anchored = false
            part:Destroy()

            game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Dropped Crystal", Duration = 4,})

            break
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Changing Folders", Text = "No Dropped Crystal", Duration = 4,})

        for _, v2 in pairs(crystal:GetChildren()) do
            if v2.Name == "Crystal_T6" then
                local part = Instance.new("Part")
                part.Name = "TPPart"
                part.Position = v2.Position
                part.Size = Vector3.new(5, 1, 5)
                part.Anchored = true
                part.Parent = game.workspace
                local high = Instance.new("Highlight")
                high.Parent = part
                count += 1
                hrp.CFrame = part.CFrame
                hrp.Anchored = true
                task.wait(1)
                hrp.Anchored = false
                part:Destroy()

                game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Found Crystal", Duration = 4,})

                break
            end
        end
    end

    if count == 0 then
        game.StarterGui:SetCore("SendNotification", {Title = "Failed", Text = "No Tier 6 Crystal Found", Duration = 4,})
    end
end)

TPSection:NewButton("Teleport To Most Valuable Crystal", "Teleport To Most Expensive Crystal", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local crystal = workspace.Things.Crystals
    local droppedcrystal = workspace.DroppedCrystals

    local highestObject = nil
    local highestValue = -math.huge
    local drophighestObject = nil
    local drophighestValue = -math.huge

    for _, v in pairs(crystal:GetChildren()) do
        local value = v:GetAttribute("Value")

        if value and value > highestValue then
            highestValue = value
            highestObject = v
        end
    end

    for _, v2 in pairs(droppedcrystal:GetChildren()) do
        local value = v2:GetAttribute("Value")

        if value and value > drophighestValue then
            drophighestValue = value
            drophighestObject = v2
        end
    end
    if highestValue > drophighestValue then
        local part = Instance.new("Part")
        part.Name = "TPPart"
        part.Position = highestObject.Position
        part.Size = Vector3.new(5, 1, 5)
        part.Anchored = true
        part.Parent = game.workspace
        local high = Instance.new("Highlight")
        high.Parent = part
        hrp.CFrame = part.CFrame
        hrp.Anchored = true
        task.wait(1)
        hrp.Anchored = false
        part:Destroy()
        game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Value: $" .. highestValue, Duration = 4,})
    elseif drophighestValue > highestValue then
        local part = Instance.new("Part")
        part.Name = "TPPart"
        part.Position = drophighestObject.Position --potential error
        part.Size = Vector3.new(5, 1, 5)
        part.Anchored = true
        part.Parent = game.workspace
        local high = Instance.new("Highlight")
        high.Parent = part
        hrp.CFrame = part.CFrame
        hrp.Anchored = true
        task.wait(1)
        hrp.Anchored = false
        part:Destroy()
        game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = "Value: $" .. drophighestValue, Duration = 4,})
    end
end)

TPSection:NewButton("Teleport To Heaviest Crystal", "Teleport To Most Heavy Crystal", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local crystal = workspace.Things.Crystals
    local droppedcrystal = workspace.DroppedCrystals

    local highestObject = nil
    local highestValue = -math.huge
    local drophighestObject = nil
    local drophighestValue = -math.huge

    for _, v in pairs(crystal:GetChildren()) do
        local value = v:GetAttribute("WeightKg")

        if value and value > highestValue then
            highestValue = value
            highestObject = v
        end
    end

    for _, v2 in pairs(droppedcrystal:GetChildren()) do
        local value = v2:GetAttribute("WeightKg")

        if value and value > drophighestValue then
            drophighestValue = value
            drophighestObject = v
        end
    end
    if highestValue > drophighestValue then
        local part = Instance.new("Part")
        part.Name = "TPPart"
        part.Position = highestObject.Position
        part.Size = Vector3.new(5, 1, 5)
        part.Anchored = true
        part.Parent = game.workspace
        local high = Instance.new("Highlight")
        high.Parent = part
        hrp.CFrame = part.CFrame
        hrp.Anchored = true
        task.wait(1)
        hrp.Anchored = false
        part:Destroy()
        game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = highestValue .. "kg", Duration = 4,})
    elseif drophighestValue > highestValue then
        local part = Instance.new("Part")
        part.Name = "TPPart"
        part.Position = drophighestObject.Position
        part.Size = Vector3.new(5, 1, 5)
        part.Anchored = true
        part.Parent = game.workspace
        local high = Instance.new("Highlight")
        high.Parent = part
        hrp.CFrame = part.CFrame
        hrp.Anchored = true
        task.wait(1)
        hrp.Anchored = false
        part:Destroy()
        game.StarterGui:SetCore("SendNotification", {Title = "Teleported", Text = drophighestValue .. "kg", Duration = 4,})
    end
end)

local Others = Window:NewTab("Others")
local OthersSection = Others:NewSection("Extra Things To Mess With")

OthersSection:NewToggle("Instant Interaction", "No Crystal Interaction Delay", function(state)
    if state then
        local crystal = workspace.Things.Crystals
        local droppedcrystal = workspace.DroppedCrystals
        instantinteract = true
        while task.wait(0.1) do
            if instantinteract then
                for _, v in pairs(crystal:GetChildren()) do
                    if v:FindFirstChild("ProximityPrompt") then
                        if v.ProximityPrompt.HoldDuration ~= 0 then
                            v.ProximityPrompt.HoldDuration = 0
                        end
                    end
                end
                for _, v in pairs(droppedcrystal:GetChildren()) do
                    if v:FindFirstChild("ProximityPrompt") then
                        if v.ProximityPrompt.HoldDuration ~= 0 then
                            v.ProximityPrompt.HoldDuration = 0
                        end
                    end
                end
            elseif instantinteract == false then
                break
            end
        end
    else
        instantinteract = false
    end
end)

OthersSection:NewButton("Sell All", "Sell Everything", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local old = hrp.Position

    task.wait(0.1)
    local part = Instance.new("Part")
    part.Name = "TPPart"
    part.Position = Vector3.new(-40.29936599731445, 29.226091384887695, 1071.1024169921875)
    part.Size = Vector3.new(5, 1, 5)
    part.Anchored = true
    part.Parent = game.workspace
    local high = Instance.new("Highlight")
    high.Parent = part
    hrp.CFrame = part.CFrame
    hrp.Anchored = true
    task.wait(1)
    hrp.Anchored = false
    part:Destroy()
    game:GetService("ReplicatedStorage").Remotes.SellRequest:FireServer("all")
    task.wait(0.5)
    local part = Instance.new("Part")
    part.Name = "TPPart"
    part.Position = old
    part.Size = Vector3.new(5, 1, 5)
    part.Anchored = true
    part.Parent = game.workspace
    local high = Instance.new("Highlight")
    high.Parent = part
    hrp.CFrame = part.CFrame
    hrp.Anchored = true
    task.wait(1)
    hrp.Anchored = false
    part:Destroy()
end)

OthersSection:NewToggle("Show Mine All Near Aura", "Show The Distance", function(state)
    if state then
        local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        local sphere = Instance.new("Part")
        sphere.Name = "AuraSphere"
        sphere.Shape = Enum.PartType.Ball
        sphere.Size = Vector3.new(20, 20, 20)
        sphere.Position = hrp.Position
        sphere.Color = Color3.new(1, 0, 0)
        sphere.Transparency = 0.9
        sphere.CanCollide = false
        sphere.Parent = workspace
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = hrp
        weld.Part1 = sphere
        weld.Parent = sphere
    else
        game.workspace.AuraSphere:Destroy()
    end
end)

OthersSection:NewButton("Mine All Near You (Finicky Also Check Desc)", "Take Out And Put Away Your Pickaxe", function()
    local crystal = workspace.Things.Crystals
    local droppedcrystal = workspace.DroppedCrystals
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart

    for _, v in pairs(crystal:GetChildren()) do
        local distance = (hrp.Position - v.Position).Magnitude
        if distance <= 20 then
            if v:FindFirstChild("ProximityPrompt") then
                fireproximityprompt(v.ProximityPrompt)
            end
        end
    end
    for _, v2 in pairs(droppedcrystal:GetChildren()) do
        local distance = (hrp.Position - v2.Position).Magnitude
        if distance <= 20 then
            if v2:FindFirstChild("ProximityPrompt") then
                fireproximityprompt(v2.ProximityPrompt)
            end
        end
    end
end)

local Visual = Window:NewTab("Visuals")
local VisualSection = Visual:NewSection("Change Things You See")

VisualSection:NewToggle("FullBright", "Toggle Brightness", function(state)
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

VisualSection:NewToggle("Disable Fog", "No Fog", function(state)
    if state then
        local lighting = game:GetService("Lighting")
        lighting.FogEnd = 100000
    else
        local lighting = game:GetService("Lighting")
        lighting.FogEnd = 1000
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
