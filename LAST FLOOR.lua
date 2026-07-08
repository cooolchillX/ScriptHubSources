local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "LAST FLOOR", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main Things")
local MainSection = Main:NewSection("Be Careful With AutoFarm Features")
local MainSection = Main:NewSection("Some Might Be Detected")

MainSection:NewSlider("WalkSpeed", "Set Speed", 50, 16, function(s)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("HipHeight", "Set HipHeight", 5, 0, function(s)
   game.Players.LocalPlayer.Character.Humanoid.HipHeight = s
end)

MainSection:NewToggle("Loop Walkspeed", "Loop Speed", function(state)
    if state then
        local a = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        i = true
        while wait(0.5) do
            if i == true then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
            elseif i == false then
                break
            end
        end
    else
        i = false
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

MainSection:NewToggle("Loop HipHeight", "Loop HipHeight", function(state)
    if state then
        local a = game.Players.LocalPlayer.Character.Humanoid.HipHeight
        i = true
        while wait(0.5) do
            if i == true then
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = a
            elseif i == false then
                break
            end
        end
    else
        i = false
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
    end
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Through Walls")

ESPSection:NewToggle("Gagun ESP", "See All Gaguns", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "banka" then
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
                            label.Text = "Gagun"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "banka" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Blue Battery(x1 energy) ESP", "See All Batteries", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "battery_pick" then
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
                            label.TextColor3 = Color3.new(0, 0, 1)
                            label.TextScaled = true
                            label.Text = "Battery"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "battery_pick" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Yellow Battery(x2 energy) ESP", "See All Batteries", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "batteryX2_pick" then
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
                            label.TextColor3 = Color3.new(0, 0, 1)
                            label.TextScaled = true
                            label.Text = "Batteryx2"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "batteryX2_pick" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Entity ESP", "See All Entities", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "stul" or v.Name == "korobkaSDEK" or v.Name == "KOLESO" or v.Name == "nout" or v.Name == "dush" or v.Name == "minanozhka" or v.Name == "mob" or v.Name == "samolet" then
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
                            label.TextColor3 = Color3.new(1, 0, 0)
                            label.TextScaled = true
                            label.Text = "Entity"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "stul" or v.Name == "korobkaSDEK" or v.Name == "KOLESO" or v.Name == "nout" or v.Name == "dush" or v.Name == "minanozhka" or v.Name == "mob" or v.Name == "samolet" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Adrenaline ESP", "See All Adrenaline", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "adrenaline_pick" then
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
                            label.TextColor3 = Color3.fromRGB(255, 100, 0)
                            label.TextScaled = true
                            label.Text = "Adrenaline"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "adrenaline_pick" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Bandage ESP", "See All Bandages", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "bandage_pick" then
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
                            label.TextColor3 = Color3.fromRGB(255, 100, 0)
                            label.TextScaled = true
                            label.Text = "Bandage"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "bandage_pick" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Health Bottle ESP", "See All Health Bottles", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "healthbottle_pick" then
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
                            label.TextColor3 = Color3.fromRGB(255, 100, 0)
                            label.TextScaled = true
                            label.Text = "Health Bottle"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "healthbottle_pick" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Bolt Cutter ESP", "See All Bolt Cutters", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "kusachki_pik" then
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
                            label.TextColor3 = Color3.fromRGB(255, 255, 0)
                            label.TextScaled = true
                            label.Text = "Bolt Cutter"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "kusachki_pik" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Hiding Spot ESP", "See All Hiding Spots", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "shkaf" and v:FindFirstChild("shkaf") then
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
                            label.TextColor3 = Color3.fromRGB(0, 255, 255)
                            label.TextScaled = true
                            label.Text = "Hiding Spot"
                            label.Parent = billboard
                        end
                    end
                    if v.Name == "musor" and v:FindFirstChild("musor") then
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
                            label.TextColor3 = Color3.fromRGB(0, 255, 255)
                            label.TextScaled = true
                            label.Text = "Hiding Spot"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "shkaf" or v.Name == "musor" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Bleak Trigger Point ESP", "See All Bleak Triggers", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "TRAHATEL" and v:FindFirstChild("TouchInterest") then
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
                            label.TextColor3 = Color3.fromRGB(255, 0, 0)
                            label.TextScaled = false
                            label.Text = "Bleak Trigger"
                            label.Parent = billboard
                            v.Transparency = 0.5
                            v.Color = Color3.fromRGB(255, 0, 0)
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "TRAHATEL" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                    v.Transparency = 1
                    v.Color = Color3.fromRGB(163, 162, 165)
                end
            end
        end
    end
end)

ESPSection:NewToggle("Floor 20 Event Cube ESP", "See All Cubes", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "cube" and v.spawned.Value == true then
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
                            label.TextColor3 = Color3.fromRGB(255, 255, 0)
                            label.TextScaled = true
                            label.Text = "Cube"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "cube" and v.spawned.Value == true then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Floor 35 Event Electric Box ESP", "See All Electric Boxes", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "hahatunchik" and v:FindFirstChild("Par") then
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
                            label.TextColor3 = Color3.fromRGB(255, 255, 0)
                            label.TextScaled = true
                            label.Text = "Electric Box"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "hahatunchik" and v:FindFirstChild("Par") then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Floor 35 Event Bolt Cutter ESP", "See All Event Bolt Cutters", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "kusachkiv2_pik" then
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
                            label.TextColor3 = Color3.fromRGB(255, 255, 0)
                            label.TextScaled = true
                            label.Text = "Bolt Cutter"
                            label.Parent = billboard
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "kusachkiv2_pik" then
                if v and v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

local Visual = Window:NewTab("Visuals")
local VisualSection = Visual:NewSection("Clean The Screen")

VisualSection:NewToggle("Disable Fog", "No Fog", function(state)
    if state then
        local lighting = game:GetService("Lighting")
        lighting.FogEnd = 100000
    else
        local lighting = game:GetService("Lighting")
        lighting.FogEnd = 1000
    end
end)

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

local Extra = Window:NewTab("Extra")
local ExtraSection = Extra:NewSection("Every 55 A Light Bar Goes Down")
local ExtraSection = Extra:NewSection("Batteries Refill 35 Energy")
local ExtraSection = Extra:NewSection("Max Energy Is 220")

ExtraSection:NewToggle("See Remaining Energy", "A Bar Showing Your Energy", function(state)
    if state then
        i = true
        local energy = game:GetService("ReplicatedStorage").EnergyTimer
        local player = game.Players.LocalPlayer
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "TopCenterLabel"
        screenGui.ResetOnSpawn = false
        screenGui.Parent = player:WaitForChild("PlayerGui")

        local label = Instance.new("TextLabel")
        label.Name = "InfoLabel"
        label.Size = UDim2.new(0, 260, 0, 40)
        label.AnchorPoint = Vector2.new(0.5, 0)
        label.Position = UDim2.new(0.5, 0, 0, 10)
        label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        label.BackgroundTransparency = 0.1
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextScaled = true
        label.Font = Enum.Font.GothamBold
        label.Text = "Unknown"
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.Parent = screenGui

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = label

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(60, 60, 60)
        stroke.Thickness = 1
        stroke.Parent = label
        while wait(1) do
            if i == true then
                label.Text = "Energy: " .. tostring(energy.Value)
            elseif i == false then
                break
            end
        end
    else
        i = false
        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("TopCenterLabel") then
            game.Players.LocalPlayer.PlayerGui.TopCenterLabel:Destroy()
        end
    end
end)

ExtraSection:NewToggle("Instant Interaction", "Remove Delays", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "ProximityPrompt" then
                        if v.HoldDuration ~= 0 then
                            v.HoldDuration = 0
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "ProximityPrompt" then
                if v.HoldDuration == 0 then
                    v.HoldDuration = 2
                end
            end
        end
    end
end)

ExtraSection:NewToggle("Disable Bleak Triggers", "Can't Activate Him", function(state)
    if state then
        i = true
        while wait(1) do
            if i == true then
                for _, v in pairs(game.workspace:GetDescendants()) do
                    if v.Name == "TRAHATEL" and v:FindFirstChild("TouchInterest") then
                        if v and v.CanTouch == true then
                            v.CanTouch = false
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "TRAHATEL" and v:FindFirstChild("TouchInterest") then
                if v and v.CanTouch == false then
                    v.CanTouch = true
                end
            end
        end
    end
end)

ExtraSection:NewButton("Club Count", "Total Clubs", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label

    local clubCount = 0
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name == "club" then
            clubCount += 1
        end
    end

    label.Text = "Total Clubs: " .. clubCount
    wait(3)
    screenGui:Destroy()
end)

local Event = Window:NewTab("Events")
local EventSection = Event:NewSection("Stuff About Events")

EventSection:NewButton("Skip Foor 10 Event", "Skip It", function()
    for _, v in pairs(game.workspace:GetDescendants()) do
        if v.Name == "floor_10" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.event.lestnica.schetok.sf.CFrame
        end
    end
end)

EventSection:NewButton("Skip Foor 20 Event", "Skip It", function()
    for _, v in pairs(game.workspace:GetDescendants()) do
        if v.Name == "floor_20" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.event:FindFirstChild("lestnica chb 1").schetok.sf.CFrame
        end
    end
end)

EventSection:NewButton("Skip Foor 35 Event", "Skip It", function()
    for _, v in pairs(game.workspace:GetDescendants()) do
        if v.Name == "floor_35" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.event.lestnica.schetok.sf.CFrame
        end
    end
end)

EventSection:NewButton("Tp To Train Floor 50 Event", "Get Ahead", function()
    for _, v in pairs(game.workspace:GetDescendants()) do
        if v.Name == "floor_50" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.event.kpkpk.Graffiti.CFrame
        end
    end
end)

local Troll = Window:NewTab("Troll")
local TrollSection = Troll:NewSection("Troll People")

TrollSection:NewButton("Teleport Existing Bleak Trigger To You", "Cause It To Activate Bleak", function()
    for _, v in pairs(game.workspace:GetDescendants()) do
        if v.Name == "TRAHATEL" and v:FindFirstChild("TouchInterest") then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end)

local Optimize = Window:NewTab("Optimization")
local OptimizeSection = Optimize:NewSection("MUST PASS THE EVENT OR THE GAME BREAKS")

OptimizeSection:NewButton("Delete Floors 1-10", "Remove Them", function()
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_1" or v.Name == "floor_2" or v.Name == "floor_3" or v.Name == "floor_4" or v.Name == "floor_5" or v.Name == "floor_6" or v.Name == "floor_7" or v.Name == "floor_8" or v.Name == "floor_9" or v.Name == "floor_10" then
            v:Destroy()
        end
    end
end)

OptimizeSection:NewButton("Delete Floors 11-20", "Remove Them", function()
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_11" or v.Name == "floor_12" or v.Name == "floor_13" or v.Name == "floor_14" or v.Name == "floor_15" or v.Name == "floor_16" or v.Name == "floor_17" or v.Name == "floor_18" or v.Name == "floor_19" or v.Name == "floor_20" then
            v:Destroy()
        end
    end
end)

OptimizeSection:NewButton("Delete Floors 21-34", "Remove Them", function()
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_21" or v.Name == "floor_22" or v.Name == "floor_23" or v.Name == "floor_24" or v.Name == "floor_25" or v.Name == "floor_26" or v.Name == "floor_27" or v.Name == "floor_28" or v.Name == "floor_29" or v.Name == "floor_30" or v.Name == "floor_31" or v.Name == "floor_32" or v.Name == "floor_33" or v.Name == "floor_34" then
            v:Destroy()
        end
    end
end)

local Auto = Window:NewTab("AutoFarm")
local AutoSection = Auto:NewSection("Highly Recommended to Disable Bleak Triggers")
local AutoSection = Auto:NewSection("Auto Go Door 50 And 49 Click Multiple Times (4-5)")

AutoSection:NewButton("Auto Go Door 50", "Fastest Method", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_3" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_4" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_5" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_6" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_7" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_8" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_9" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_12" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_13" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_14" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_15" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_16" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_17" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_18" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_19" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_22" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_23" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_24" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_25" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_26" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_27" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_28" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_29" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_30" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_31" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_32" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_33" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_34" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_37" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_38" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_39" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_40" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_41" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_42" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_43" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_44" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_45" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_46" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_47" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_48" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_49" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_50" then
            label.Text = v.Name
            for _, v2 in pairs(v:GetChildren()) do
                if v2:FindFirstChild("door_nachalo_eventa") then
                    hrp.CFrame = v2.door_nachalo_eventa.CFrame
                end
            end
        end
    end
    wait(3)
    screenGui:Destroy()
end)

local AutoSection = Auto:NewSection("Run Only When At Door 50")

AutoSection:NewButton("Grab All Gagun", "Grab All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local bankas = {}

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "banka" and v:IsA("BasePart") then
            table.insert(bankas, v)
        end
    end

    local total = #bankas

    for index, banka in ipairs(bankas) do
        if banka and banka:IsDescendantOf(workspace) then
            label.Text = "Gagun: " .. index .. "/" .. total
            hrp.CFrame = banka.CFrame + Vector3.new(0, 1, 0)
            task.wait(0.2)
            fireproximityprompt(banka.ProximityPrompt)
            task.wait(0.2)
        end
    end

    local doorTeleported = false
    for _, floor in ipairs(workspace:GetChildren()) do
        if floor.Name == "floor_50" then
            for _, obj in ipairs(floor:GetChildren()) do
                local door = obj:FindFirstChild("door_nachalo_eventa")
                if door and door:IsA("BasePart") then
                    hrp.CFrame = door.CFrame
                    doorTeleported = true
                    break
                end
            end
        end
        if doorTeleported then break end
    end
    wait(3)
    screenGui:Destroy()

    print("All bankas visited, loop ended.")
end)

AutoSection:NewButton("Grab All Of Both Battery Types", "Grab All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local batteries = {}

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "battery_pick" or v.Name == "batteryX2_pick" and v:IsA("BasePart") then
            table.insert(batteries, v)
        end
    end

    local total = #batteries

    for index, battery in ipairs(batteries) do
        if battery and battery:IsDescendantOf(workspace) then
            label.Text = "Battery: " .. index .. "/" .. total
            hrp.CFrame = battery.CFrame + Vector3.new(0, 1, 0)
            task.wait(0.2)
            fireproximityprompt(battery.ProximityPrompt)
            task.wait(0.2)
        end
    end

    local doorTeleported = false
    for _, floor in ipairs(workspace:GetChildren()) do
        if floor.Name == "floor_50" then
            for _, obj in ipairs(floor:GetChildren()) do
                local door = obj:FindFirstChild("door_nachalo_eventa")
                if door and door:IsA("BasePart") then
                    hrp.CFrame = door.CFrame
                    doorTeleported = true
                    break
                end
            end
        end
        if doorTeleported then break end
    end
    wait(3)
    screenGui:Destroy()

    print("All battery_pick objects visited, loop ended.")
end)

AutoSection:NewButton("Grab All Adrenaline", "Grab All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local adrPickups = {}

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "adrenaline_pick" and v:IsA("BasePart") then
            table.insert(adrPickups, v)
        end
    end

    local total = #adrPickups

    for index, adr in ipairs(adrPickups) do
        if adr and adr:IsDescendantOf(workspace) then
            label.Text = "Adrenaline: " .. index .. "/" .. total
            hrp.CFrame = adr.CFrame + Vector3.new(0, 1, 0)
            task.wait(0.2)
            fireproximityprompt(adr.ProximityPrompt)
            task.wait(0.2)
        end
    end

    local doorTeleported = false
    for _, floor in ipairs(workspace:GetChildren()) do
        if floor.Name == "floor_50" then
            for _, obj in ipairs(floor:GetChildren()) do
                local door = obj:FindFirstChild("door_nachalo_eventa")
                if door and door:IsA("BasePart") then
                    hrp.CFrame = door.CFrame
                    doorTeleported = true
                    break
                end
            end
        end
        if doorTeleported then break end
    end
    wait(3)
    screenGui:Destroy()

    print("All adrenaline_pick objects visited, loop ended.")
end)

AutoSection:NewButton("Grab All Bandages", "Grab All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local bandages = {}

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "bandage_pick" and v:IsA("BasePart") then
            table.insert(bandages, v)
        end
    end

    local total = #bandages

    for index, bandage in ipairs(bandages) do
        if bandage and bandage:IsDescendantOf(workspace) then
            label.Text = "Bandage: " .. index .. "/" .. total
            hrp.CFrame = bandage.CFrame + Vector3.new(0, 1, 0)
            task.wait(0.2)
            fireproximityprompt(bandage.ProximityPrompt)
            task.wait(0.2)
        end
    end

    local doorTeleported = false
    for _, floor in ipairs(workspace:GetChildren()) do
        if floor.Name == "floor_50" then
            for _, obj in ipairs(floor:GetChildren()) do
                local door = obj:FindFirstChild("door_nachalo_eventa")
                if door and door:IsA("BasePart") then
                    hrp.CFrame = door.CFrame
                    doorTeleported = true
                    break
                end
            end
        end
        if doorTeleported then break end
    end
    wait(3)
    screenGui:Destroy()

    print("All bandage_pick objects visited, loop ended.")
end)

AutoSection:NewButton("Grab All Health Bottles", "Grab All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local healthBottles = {}

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "healthbottle_pick" and v:IsA("BasePart") then
            table.insert(healthBottles, v)
        end
    end

    local total = #healthBottles

    for index, bottle in ipairs(healthBottles) do
        if bottle and bottle:IsDescendantOf(workspace) then
            label.Text = "HealthBottle: " .. index .. "/" .. total
            hrp.CFrame = bottle.CFrame + Vector3.new(0, 1, 0)
            task.wait(0.2)
            fireproximityprompt(bottle.ProximityPrompt)
            task.wait(0.2)
        end
    end

    local doorTeleported = false
    for _, floor in ipairs(workspace:GetChildren()) do
        if floor.Name == "floor_50" then
            for _, obj in ipairs(floor:GetChildren()) do
                local door = obj:FindFirstChild("door_nachalo_eventa")
                if door and door:IsA("BasePart") then
                    hrp.CFrame = door.CFrame
                    doorTeleported = true
                    break
                end
            end
        end
        if doorTeleported then break end
    end
    wait(3)
    screenGui:Destroy()

    print("All healthbottle_pick objects visited, loop ended.")
end)

AutoSection:NewButton("Open All Sub Doors", "Open All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local Doors = {}

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "doorhitbox" and v:IsA("BasePart") then
            table.insert(Doors, v)
        end
    end

    local total = #Doors

    for index, Door in ipairs(Doors) do
        if Door and Door:IsDescendantOf(workspace) then
            label.Text = "Door: " .. index .. "/" .. total
            hrp.CFrame = Door.CFrame
            task.wait(0.2)
        end
    end

    local doorTeleported = false
    for _, floor in ipairs(workspace:GetChildren()) do
        if floor.Name == "floor_50" then
            for _, obj in ipairs(floor:GetChildren()) do
                local door = obj:FindFirstChild("door_nachalo_eventa")
                if door and door:IsA("BasePart") then
                    hrp.CFrame = door.CFrame
                    doorTeleported = true
                    break
                end
            end
        end
        if doorTeleported then break end
    end
    wait(3)
    screenGui:Destroy()

    print("All door objects visited, loop ended.")
end)

local AutoSection = Auto:NewSection("Ones For Using All Batteries")

AutoSection:NewButton("Auto Go Door 49", "Fastest Method", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_3" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_4" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_5" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_6" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_7" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_8" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_9" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_12" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_13" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_14" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_15" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_16" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_17" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_18" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_19" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_22" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_23" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_24" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_25" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_26" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_27" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_28" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_29" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_30" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_31" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_32" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_33" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_34" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_37" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_38" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_39" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_40" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_41" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_42" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_43" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_44" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_45" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_46" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_47" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_48" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(2.5)
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_49" then
            label.Text = v.Name
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
    wait(3)
    screenGui:Destroy()
end)

AutoSection:NewButton("Open All Sub Doors Door 49 Method", "Open All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local Doors = {}

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "doorhitbox" and v:IsA("BasePart") then
            table.insert(Doors, v)
        end
    end

    local total = #Doors

    for index, Door in ipairs(Doors) do
        if Door and Door:IsDescendantOf(workspace) then
            label.Text = "Door: " .. index .. "/" .. total
            hrp.CFrame = Door.CFrame
            task.wait(0.2)
        end
    end

    local doorTeleported = false
    for _, floor in ipairs(workspace:GetChildren()) do
        if floor.Name == "floor_49" then
            for _, obj in ipairs(floor:GetChildren()) do
                local door = obj:FindFirstChild("door_zamok")
                if door and door:IsA("BasePart") then
                    hrp.CFrame = door.CFrame
                    doorTeleported = true
                    break
                end
            end
        end
        if doorTeleported then break end
    end
    wait(3)
    screenGui:Destroy()

    print("All door objects visited, loop ended.")
end)

AutoSection:NewButton("Grab All Gagun Door 49 Method", "Grab All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local bankas = {}

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "banka" and v:IsA("BasePart") then
            table.insert(bankas, v)
        end
    end

    local total = #bankas

    for index, banka in ipairs(bankas) do
        if banka and banka:IsDescendantOf(workspace) then
            label.Text = "Gagun: " .. index .. "/" .. total
            hrp.CFrame = banka.CFrame + Vector3.new(0, 1, 0)
            task.wait(0.2)
            for i = 1, 5 do
                local prompt = banka:FindFirstChild("ProximityPrompt")
                if prompt then
                    fireproximityprompt(prompt)
                    task.wait(0.1)
                else
                    break
                end
            end
        end
    end

    local doorTeleported = false
    for _, floor in ipairs(workspace:GetChildren()) do
        if floor.Name == "floor_49" then
            for _, obj in ipairs(floor:GetChildren()) do
                local door = obj:FindFirstChild("door_zamok")
                if door and door:IsA("BasePart") then
                    hrp.CFrame = door.CFrame
                    doorTeleported = true
                    break
                end
            end
        end
        if doorTeleported then break end
    end
    wait(3)
    screenGui:Destroy()

    print("All bankas visited, loop ended.")
end)

AutoSection:NewButton("Grab All Of Both Battery Types Door 49 Method", "Grab All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local batteries = {}

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "battery_pick" or v.Name == "batteryX2_pick" and v:IsA("BasePart") then
            table.insert(batteries, v)
        end
    end

    local total = #batteries

    for index, battery in ipairs(batteries) do
        if battery and battery:IsDescendantOf(workspace) then
            label.Text = "Battery: " .. index .. "/" .. total
            hrp.CFrame = battery.CFrame + Vector3.new(0, 1, 0)
            task.wait(0.2)
            for i = 1, 5 do
                local prompt = battery:FindFirstChild("ProximityPrompt")
                if prompt then
                    fireproximityprompt(prompt)
                    task.wait(0.1)
                else
                    break
                end
            end
        end
    end

    local doorTeleported = false
    for _, floor in ipairs(workspace:GetChildren()) do
        if floor.Name == "floor_49" then
            for _, obj in ipairs(floor:GetChildren()) do
                local door = obj:FindFirstChild("door_zamok")
                if door and door:IsA("BasePart") then
                    hrp.CFrame = door.CFrame
                    doorTeleported = true
                    break
                end
            end
        end
        if doorTeleported then break end
    end
    wait(3)
    screenGui:Destroy()

    print("All battery_pick objects visited, loop ended.")
end)

local AutoSection = Auto:NewSection("Hold Out Battery And Make Sure Power Is Decreasing")

local maximum
AutoSection:NewTextBox("Battery Count", "Input Total Batteries Of 1 Varient", function(text)
   maximum = tonumber(text)
end)

AutoSection:NewButton("Use All Batteries", "Use Them All", function()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoTopCenterLabel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel"
    label.Size = UDim2.new(0, 260, 0, 40)
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    label.BackgroundTransparency = 0.1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Unknown"
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = label

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Thickness = 1
    stroke.Parent = label
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local count = 0

    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "schetok" and v:IsA("Model") then
            local batr = v:FindFirstChild("batr")
            local batrx2 = v:FindFirstChild("batrx2")

            local skip = false

            if batr and batr:IsA("BasePart") and batr.Transparency == 0 then
                skip = true
            end

            if batrx2 and batrx2:IsA("BasePart") and batrx2.Transparency == 0 then
                skip = true
            end

            if not skip then
                count += 1

                label.Text = "Input: " .. count .. "/" .. maximum
                hrp.CFrame = v:FindFirstChild("Cube.001").CFrame
                task.wait(0.4)
                for i = 1, 5 do
                    local prompt = v["Cube.001"].energy:FindFirstChild("ProximityPrompt")
                    if prompt then
                        fireproximityprompt(prompt)
                        task.wait(0.1)
                    else
                        break
                    end
                end

                if count >= maximum then
                    for _, floor in ipairs(workspace:GetChildren()) do
                        if floor.Name == "floor_49" then
                            for _, obj in ipairs(floor:GetChildren()) do
                                local door = obj:FindFirstChild("door_zamok")
                                if door and door:IsA("BasePart") then
                                    hrp.CFrame = door.CFrame
                                    break
                                end
                            end
                        end
                    end
                    print("Reached maximum, stopping loop.")
                    break
                end
            end
        end
    end
    wait(3)
    screenGui:Destroy()

    print("Finished. Total teleports:" .. count)
end)

AutoSection:NewButton("Teleport To Lobby", "To Cut Chains To Enable Power", function()
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name == "helper" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 50", "To Finish The Run", function()
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_50" then
            for _, v2 in pairs(v:GetChildren()) do
                if v2:FindFirstChild("door_nachalo_eventa") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.door_nachalo_eventa.CFrame
                end
            end
        end
    end
end)

local AutoSection = Auto:NewSection("Manual Door Teleporting")

AutoSection:NewButton("Teleport To Floor 3", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_3" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 4", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_4" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 5", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_5" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 6", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_6" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 7", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_7" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 8", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_8" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 9", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_9" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 12", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_12" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 13", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_13" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 14", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_14" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 15", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_15" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 16", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_16" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 17", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_17" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 18", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_18" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 19", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_19" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 22", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_22" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 23", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_23" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 24", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_24" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 25", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_25" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 26", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_26" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 27", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_27" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 28", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_28" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 29", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_29" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 30", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_30" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 31", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_31" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 32", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_32" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 33", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_33" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 34", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_34" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 37", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_37" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 38", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_38" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 39", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_39" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 40", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_40" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 41", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_41" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 42", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_42" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 43", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_43" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 44", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_44" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 45", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_45" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 46", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_46" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 47", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_47" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 48", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_48" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

AutoSection:NewButton("Teleport To Floor 49", "Teleport To It", function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "floor_49" then
            for _, check in pairs(v:GetDescendants()) do
                if check.Name == "kusachki_pik" then
                    hrp.CFrame = check.CFrame
                    wait(0.5)
                    fireproximityprompt(check.ProximityPrompt)
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                            for _, check2 in pairs(v:GetDescendants()) do
                                if check2.Name == "pr" then
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
                                    wait(0.2)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
                                    wait(0.5)
                                    fireproximityprompt(check2)
                                end
                            end
                        end
                    end
                else
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("door_zamok") then
                            hrp.CFrame = v2.door_zamok.CFrame
                        end
                    end
                end
            end
        end
    end
end)

local Aura = Window:NewTab("Grab Aura")
local AuraSection = Aura:NewSection("Auto Grab Things")

AuraSection:NewToggle("Auto Grab Gagun", "Grab It All", function(state)
    if state then
        i = true
        while wait(0.2) do
            if i == true then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "banka" then
                        local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
                        if distance <= 15 then
                            local proximity = v:FindFirstChild("ProximityPrompt")
                            fireproximityprompt(proximity)
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
    end
end)

AuraSection:NewToggle("Auto Grab Batteries", "Grab It All", function(state)
    if state then
        i = true
        while wait(0.2) do
            if i == true then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "battery_pick" or v.Name == "batteryX2_pick" then
                        local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
                        if distance <= 15 then
                            local proximity = v:FindFirstChild("ProximityPrompt")
                            fireproximityprompt(proximity)
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
    Library:ToggleUI()
end)
