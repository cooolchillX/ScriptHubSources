local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "The Rake", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Casual Things")

MainSection:NewSlider("WalkSpeed", "Move Faster", 30, 16, function(s) -- 30 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 70, 50, function(s) -- 70 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("ESP Things")
local ESPSection = ESP:NewSection("Bug:only 3-4 work at a time")

ESPSection:NewToggle("ESP Rake", "Rake ESP", function(state)
    if state then
        i = true
            while wait() do
                if i == true then
                    local rake = game.Workspace:FindFirstChild("Rake")

                    if rake and not rake:FindFirstChildOfClass("Highlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "Highlight"
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.Parent = rake
                elseif i == false then
                    break
                end
            end
        end

    else
        i = false
        workspace.Rake.Highlight:Destroy()
    end
end)

ESPSection:NewToggle("ESP Power Station", "Station ESP", function(state)
    if state then
        local parentObject = game.Workspace.Map.PowerStation.StationFolder.StationParts

            for i, child in pairs(parentObject:GetChildren()) do
                if not child:FindFirstChild("Highlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = child
                    highlight.Name = "Highlight"
                    highlight.FillColor = Color3.fromRGB(255, 255, 0)
                end
            end
    else
        local parentObject = game.Workspace.Map.PowerStation.StationFolder.StationParts

        for i, child in pairs(parentObject:GetChildren()) do
            local highlight = child:FindFirstChild("Highlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("ESP Safehouse", "Safehouse ESP", function(state)
    if state then
            local parentObject = workspace.Map.SafeHouse.Folder

            for i, child in pairs(parentObject:GetChildren()) do
                if not child:FindFirstChild("Highlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = child
                    highlight.Name = "Highlight"
                    highlight.FillColor = Color3.fromRGB(0, 255, 0)
                end
            end
    else
        local parentObject = workspace.Map.SafeHouse.Folder

        for i, child in pairs(parentObject:GetChildren()) do
            local highlight = child:FindFirstChild("Highlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("ESP Shop", "Shop ESP", function(state)
    if state then
        local parentObject = workspace.Map.Shack.Parts

            for i, child in pairs(parentObject:GetChildren()) do
                if not child:FindFirstChild("Highlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = child
                    highlight.Name = "Highlight"
                    highlight.FillColor = Color3.fromRGB(0, 255, 255)
                end
            end
    else
        local parentObject = workspace.Map.Shack.Parts

        for i, child in pairs(parentObject:GetChildren()) do
            local highlight = child:FindFirstChild("Highlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("ESP Tower", "Tower ESP", function(state)
    if state then
        local parentObject = workspace.Map.ObservationTower.Parts

            for i, child in pairs(parentObject:GetChildren()) do
                if not child:FindFirstChild("Highlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = child
                    highlight.Name = "Highlight"
                    highlight.FillColor = Color3.fromRGB(255, 153, 51)
                end
            end
    else
        local parentObject = workspace.Map.ObservationTower.Parts

        for i, child in pairs(parentObject:GetChildren()) do
            local highlight = child:FindFirstChild("Highlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end)

local Full = Window:NewTab("Brightness")
local FullSection = Full:NewSection("Fullbrightness")

FullSection:NewToggle("Toggle Light Source", "Much Brighter", function(state)
    if state then
        local glow = Instance.new("PointLight")
        glow.Color = Color3.new(1, 1, 1)
        glow.Range = 60
        glow.Brightness = 1
        glow.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.PointLight:Destroy()
    end
end)

FullSection:NewSlider("Increase Brightness", "Change How Bright", 5, 1, function(s) -- 5 (MaxValue) | 1 (MinValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.PointLight.Brightness = s
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)