local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local esp = false
local espcolor = Color3.fromRGB(0, 0, 0)
local health = false
local support = false
local espcolor2 = Color3.fromRGB(0, 0, 0)

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "CQB Hell", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("I Wouldn't Mess With Speed If I Were You")

MainSection:NewSlider("WalkSpeed", "Move Faster", 50, 16, function(s) -- 50 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Behind Walls")

ESPSection:NewToggle("Enemy ESP", "See Enemies Behind Walls", function(state)
    if state then
        esp = true
        while task.wait(0.1) do
            if esp then
                for _, v in pairs(game.Workspace:GetChildren()) do
	            	if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Name ~= game.Players.LocalPlayer.Character.Name then
	            		if not (v.Humanoid.Health <= 0) and not v:FindFirstChild("Highlight") then
	            			local high = Instance.new("Highlight")
	            			high.FillColor = Color3.new(0, 1, 0)
	            			high.Parent = v
	            		end
                        if not (v.Humanoid.Health <= 0) and v:FindFirstChild("Highlight") then
	            			v.Highlight.FillColor = espcolor
	            		end
	            		if v.Humanoid.Health <= 0 and v:FindFirstChild("Highlight") then
	            			v.Highlight:Destroy()
	            		end
	            	end
	            end
            elseif esp == false then
                break
            end
        end
    else
        esp = false
        for _, v in pairs(game.Workspace:GetChildren()) do
	    	if v:IsA("Model") and v:FindFirstChild("Humanoid") then
	    		if v:FindFirstChild("Highlight") then
	    			v.Highlight:Destroy()
	    		end
	    	end
	    end
    end
end)

ESPSection:NewColorPicker("Enemy ESP Color", "Set Enemy Color ESP", Color3.fromRGB(0,0,0), function(color)
    espcolor = color
end)

ESPSection:NewToggle("Support Machine ESP", "See Support Machines Throught Walls", function(state)
    if state then
        local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        support = true
        while task.wait(0.1) do
            if support then
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Ammo Dispencer" or v.Name == "Armor Dispencer" or v.Name == "Grenade Dispencer" or v.Name == "Medkit Dispencer" or v.Name == "Random Dispencer" then
                        local distance = (hrp.Position - v.PrimaryPart.Position).Magnitude
                        local rounded = math.round(distance)
                        local button = v:FindFirstChild("Button")
                        if not v.PrimaryPart:FindFirstChild("ESPBillboard") then
                            if button then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESPBillboard"
                                billboard.Size = UDim2.new(0, 100, 0, 25)
                                billboard.StudsOffset = Vector3.new(0, 1, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = v.PrimaryPart

                                local name = Instance.new("TextLabel")
                                name.Name = "name"
                                name.Size = UDim2.new(1, 0, 0, 25)
                                name.Position = UDim2.new(0, 0, 0, 0)
                                name.BackgroundTransparency = 1
                                name.TextColor3 = Color3.new(1, 1, 1)
                                name.TextScaled = true
                                name.Text = v.Name .. " [" .. rounded .. "]"
                                name.Parent = billboard
                            end
                        elseif v.PrimaryPart:FindFirstChild("ESPBillboard") then
                            if not button then
                                v.PrimaryPart.ESPBillboard:Destroy()
                            end
                        end
                        if v.PrimaryPart:FindFirstChild("ESPBillboard") and button then
                            v.PrimaryPart.ESPBillboard.name.TextColor3 = espcolor2
                            v.PrimaryPart.ESPBillboard.name.Text = v.Name .. " [" .. rounded .. "]"
                        end
                    elseif v.Name == "table" then
                        local distance = (hrp.Position - v.PrimaryPart.Position).Magnitude
                        local rounded = math.round(distance)
                        if not v.PrimaryPart:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 25)
                            billboard.StudsOffset = Vector3.new(0, 1, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v.PrimaryPart

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0, 25)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = "Coffee Maker" .. " [" .. rounded .. "]"
                            name.Parent = billboard
                        end
                        if v.PrimaryPart:FindFirstChild("ESPBillboard") then
                            v.PrimaryPart.ESPBillboard.name.TextColor3 = espcolor2
                            v.PrimaryPart.ESPBillboard.name.Text = "Coffee Maker" .. " [" .. rounded .. "]"
                        end
                    elseif v.Name == "wonder table" then
                        local distance = (hrp.Position - v.PrimaryPart.Position).Magnitude
                        local rounded = math.round(distance)
                        if not v.PrimaryPart:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 100, 0, 25)
                            billboard.StudsOffset = Vector3.new(0, 1, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v.PrimaryPart

                            local name = Instance.new("TextLabel")
                            name.Name = "name"
                            name.Size = UDim2.new(1, 0, 0, 25)
                            name.Position = UDim2.new(0, 0, 0, 0)
                            name.BackgroundTransparency = 1
                            name.TextColor3 = Color3.new(1, 1, 1)
                            name.TextScaled = true
                            name.Text = "Work Station" .. " [" .. rounded .. "]"
                            name.Parent = billboard
                        end
                        if v.PrimaryPart:FindFirstChild("ESPBillboard") then
                            v.PrimaryPart.ESPBillboard.name.TextColor3 = espcolor2
                            v.PrimaryPart.ESPBillboard.name.Text = "Work Sation" .. " [" .. rounded .. "]"
                        end
                    end
                end
            elseif support == false then
                break
            end
        end
    else
        support = false
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "Ammo Dispencer" or v.Name == "Armor Dispencer" or v.Name == "Grenade Dispencer" or v.Name == "Medkit Dispencer" or v.Name == "Random Dispencer" or v.Name == "table" or v.Name == "wonder table" then
                if v.PrimaryPart:FindFirstChild("ESPBillboard") then
                    v.PrimaryPart.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewColorPicker("Support Station ESP Color", "Set Enemy Color ESP", Color3.fromRGB(0,0,0), function(color)
    espcolor2 = color
end)


local Visual = Window:NewTab("Visuals")
local VisualSection = Visual:NewSection("Change Atmosphere At Stuff")

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

VisualSection:NewToggle("Show Your Health", "Show Your Health In The Corner", function(state)
    if state then
        health = true
        local gui = Instance.new("ScreenGui")
        gui.Name = "ShowHealth"
        gui.Parent = game.Players.LocalPlayer.PlayerGui
        local text = Instance.new("TextLabel")
        text.Name = "HealthLabel"
        text.BackgroundTransparency = 1
        text.TextColor3 = Color3.new(0, 0, 0)
        text.TextScaled = true
        text.Position = UDim2.new(0.031, 0, 0.868, 0)
        text.Size = UDim2.new(0, 180, 0, 50)
        text.Text = "Unknown"
        text.Parent = gui

        while task.wait(0.1) do
            if health then
                local human = game.Players.LocalPlayer.Character.Humanoid
                text.Text = "Health: " .. human.Health
            elseif health == false then
                break
            end
        end
    else
        health = false
        game.Players.LocalPlayer.PlayerGui.ShowHealth:Destroy()
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)