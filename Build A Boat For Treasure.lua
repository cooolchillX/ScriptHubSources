local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Build A Boat For Treasure", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Things")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local Farm = Window:NewTab("Farming")
local FarmSection = Farm:NewSection("Stuff To Farm")

FarmSection:NewButton("Build Farm Path", "Build A Stable Path", function()
    local floor = Instance.new("Part")
    floor.Position = Vector3.new(-50, 95, 1830)
    floor.Size = Vector3.new(20, 2, 2048)
    floor.Anchored = true
    floor.Name = "Floor1"
    floor.Parent = game.workspace

    local floor2 = Instance.new("Part")
    floor2.Position = Vector3.new(-50, 95, 3878)
    floor2.Size = Vector3.new(20, 2, 2048)
    floor2.Anchored = true
    floor2.Name = "Floor2"
    floor2.Parent = game.workspace

    local floor3 = Instance.new("Part")
    floor3.Position = Vector3.new(-50, 95, 5926)
    floor3.Size = Vector3.new(20, 2, 2048)
    floor3.Anchored = true
    floor3.Name = "Floor3"
    floor3.Parent = game.workspace

    local floor4 = Instance.new("Part")
    floor4.Position = Vector3.new(-50, 95, 7974)
    floor4.Size = Vector3.new(20, 2, 2048)
    floor4.Anchored = true
    floor4.Name = "Floor4"
    floor4.Parent = game.workspace
end)

FarmSection:NewButton("Start Farm", "From Spawn To Chest", function()
    local humanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local runService = game:GetService("RunService")

    local startPoint = Vector3.new(-50, 95, 806)
    local endPoint = Vector3.new(-50, 95, 9500)
    local duration = 25

    local startTime = tick()

    local function lerp(start, endt, alpha)
        return start * (1 - alpha) + endt * alpha
    end

    runService.RenderStepped:Connect(function(deltaTime)
        local elapsedTime = tick() - startTime
        if elapsedTime >= duration then
            return
        end

        local alpha = math.min(elapsedTime / duration, 1)
        local newPosition = lerp(startPoint, endPoint, alpha)
        
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(newPosition)
        end
    end)
end)

FarmSection:NewButton("Delete Farm Path", "Remove The Path Used", function()
    game.workspace.Floor1:Destroy()
    game.workspace.Floor2:Destroy()
    game.workspace.Floor3:Destroy()
    game.workspace.Floor4:Destroy()
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)