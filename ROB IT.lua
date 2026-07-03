local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "ROB IT", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Things")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump Higher", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewButton("Tp To Van", "Teleport To It", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.CollectTruck.TouchPart.CFrame
end)

local Auto = Window:NewTab("Automation")
local AutoSection = Auto:NewSection("Automatically Do Stuff")

AutoSection:NewButton("Steal All Items", "Take Everything On The Map", function()
    for _, v in pairs(workspace.Map.StealableItems:GetChildren()) do
        if v.Name ~= "Natural" then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AutoGrabItems"):FireServer(v)
        end
    end
    for _, v2 in pairs(workspace.Map.StealableItems.Natural:GetChildren()) do
	    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AutoGrabItems"):FireServer(v2)
    end
end)

AutoSection:NewButton("Attack All NPC's", "Hit Them All", function()
    for _, v in pairs(game.Workspace.Map.NPCS:GetChildren()) do
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Tools"):WaitForChild("HitNPC"):FireServer(v, "Crowbar")
    end
end)

AutoSection:NewButton("Lockpick All Doors", "Open All Doors", function()
    for _, v in pairs(workspace.Map.Doors:GetChildren()) do
        if v.Name ~= "Vent" then
            for _, v2 in pairs(v:GetChildren()) do
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Utilities"):WaitForChild("LockpickMinigame"):FireServer(v2, true)
            end
        end
    end
end)

local AutoSection = Auto:NewSection("Must Be On The Power Box")

AutoSection:NewButton("Tp To Power Box", "Go To It", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ElectricBox:GetPivot()
end)

AutoSection:NewButton("Hack Power Box", "Disable Cams", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Utilities"):WaitForChild("HackPowerBox"):FireServer(true)
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Through Walls")

ESPSection:NewButton("ATM ESP", "See All Hackable ATM's", function()
    for _, v in pairs(workspace.Map.Others.ATM:GetChildren()) do
        for _, v2 in pairs(v:GetDescendants()) do
            if v2:IsA("ProximityPrompt") then
                local highlight = Instance.new("Highlight")
                highlight.Parent = v
            end
        end
    end
end)

ESPSection:NewButton("Vault ESP", "See All Vaults", function()
    for _, v in pairs(workspace.Map.VaultsPositions:GetChildren()) do
        local highlight = Instance.new("Highlight")
        highlight.Parent = v
    end
end)

ESPSection:NewButton("Printer ESP", "See All Printers", function()
    for _, v in pairs(workspace.Map.Others.Printer:GetChildren()) do
        if v.Name == "Printer" then
            local highlight = Instance.new("Highlight")
            highlight.Parent = v
        end
    end
end)

ESPSection:NewButton("Keycard Guard ESP", "See Guard With Keycard", function()
    for _, v in pairs(workspace.Map.NPCS:GetChildren()) do
        if v:FindFirstChild("Keycard") then
            local highlight = Instance.new("Highlight")
            highlight.Parent = v
        end
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
    Library:ToggleUI()
end)