local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Spider", Duration = 4,})

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Normal Player Stuff")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewButton("Enable Jump", "Enable Jumping", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

--GAME
local Game = Window:NewTab("Game Stuff")
local GameSection = Game:NewSection("Mainly Ingame Stuff")

GameSection:NewButton("Remove Cabin Planks", "Delete Em", function()
    game.Workspace.Map01_Cabin.CABIN.BoardEvent:Destroy()
end)

GameSection:NewButton("Remove Bunker Planks", "Delete Em", function()
    game.Workspace.Map01_Cabin.DockGate.BoardEvent:Destroy()
end)

GameSection:NewButton("Remove Fence", "Delete Em", function()
    game.Workspace.Map01_Cabin.Fences:Destroy()
end)

GameSection:NewButton("Remove Cut Scene XD", "Delete Em", function()
    game.Workspace.Map01_Cabin.Campground.Static:Destroy()
end)

GameSection:NewButton("Remove Main Trees", "Delete Em", function()
    game.Workspace.Map01_Cabin.Trees:Destroy()
end)

GameSection:NewButton("Cabin Spider Climb Ladder", "Delete Em", function()
    workspace.Map01_Cabin.Shed.SpiderTruss:Destroy()
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("ESP Things")

ESPSection:NewButton("Player + Spider ESP", "Player and Spider ESP", function()
    local Players = game:GetService("Players"):GetChildren()
local RunService = game:GetService("RunService")
local highlight = Instance.new("Highlight")
highlight.Name = "Highlight"

for i, v in pairs(Players) do
    repeat wait() until v.Character
    if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
        local highlightClone = highlight:Clone()
        highlightClone.Adornee = v.Character
        highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightClone.Name = "Highlight"
    end
end

game.Players.PlayerAdded:Connect(function(player)
    repeat wait() until player.Character
    if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
        local highlightClone = highlight:Clone()
        highlightClone.Adornee = player.Character
        highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
        highlightClone.Name = "Highlight"
    end
end)

game.Players.PlayerRemoving:Connect(function(playerRemoved)
    playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
end)

RunService.Heartbeat:Connect(function()
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
            task.wait()
        end
end
end)
end)

ESPSection:NewButton("Battery ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(48, 48, 48)
    highlight.Parent = workspace.Items.Battery
end)

ESPSection:NewButton("Blue Key ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(0, 0, 255)
    highlight.Parent = workspace.Items["Blue Key"]
end)

ESPSection:NewButton("Bug Spray ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(170, 255, 0)
    highlight.Parent = workspace.Items["Bug Spray"]
end)

ESPSection:NewButton("C4 ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(0, 102, 0)
    highlight.Parent = workspace.Items.C4
end)

ESPSection:NewButton("Crowbar ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(145, 145, 145)
    highlight.Parent = workspace.Items.Crowbar
end)

ESPSection:NewButton("Green Key ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(0, 255, 0)
    highlight.Parent = workspace.Items["Green Key"]
end)

ESPSection:NewButton("Ladder ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(77, 25, 0)
    highlight.Parent = workspace.Items.Ladder
end)

ESPSection:NewButton("Orange Key ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(230, 76, 0)
    highlight.Parent = workspace.Items["Orange Key"]
end)

ESPSection:NewButton("Purple Key ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(212, 0, 255)
    highlight.Parent = workspace.Items["Purple Key"]
end)

ESPSection:NewButton("Red Key ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.Parent = workspace.Items["Red Key"]
end)

ESPSection:NewButton("Wrench ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(13, 13, 13)
    highlight.Parent = workspace.Items.Wrench
end)

ESPSection:NewButton("Yellow Key ESP", "ESP That Item", function()
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(255, 255, 0)
    highlight.Parent = workspace.Items["Yellow Key"]
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)

game:GetService("Players").LocalPlayer.PlayerGui.GUI.ToggleSettings.BloodTip.TextLabel.Text = "COOOLCHILL_X HUB ON TOP!"
game:GetService("Players").LocalPlayer.PlayerGui.GUI.ToggleSettings.BloodTip.UIGradient.Color = ColorSequence.new(Color3.fromRGB(0, 0, 255), Color3.fromRGB(255, 0, 0))