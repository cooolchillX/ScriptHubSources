local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Fishing Simulator", Duration = 4,})

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Usual Stuff")

MainSection:NewSlider("WalkSpeed", "Move Faster", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump High", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewButton("Infinite Yield", "Load It", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

--FISH
local Fish = Window:NewTab("Fish Stuff")
local FishSection = Fish:NewSection("Mainly Gotta Do With Fish")

FishSection:NewButton("Instant Bite", "Fish Will Bite The Rod", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DataStreams"):WaitForChild("FishBiting"):InvokeServer()
end)

FishSection:NewButton("Catch Fish", "Catches The Fish", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DataStreams"):WaitForChild("FishCaught"):FireServer()
end)

FishSection:NewButton("Sell All Fish", "Sell All Your Fish", function()
    local args = {
	"SellEverything"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DataStreams"):WaitForChild("processGameItemSold"):InvokeServer(unpack(args))
end)

FishSection:NewButton("Delete Water (Loops So Only Click Once)", "Not Compatible With Walk On Water", function()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "FlatPlane1" or v.Name == "FlatPlane2" or v.Name == "FlatPlane3" or v.Name == "FlatPlane4" then
            v:Destroy()
        end
    end
    while wait(0.2) do
        workspace.Terrain:Clear()
    end
end)

FishSection:NewToggle("Walk On Water (Jesus)", "Not Compatible With Delete Water", function(state)
    if state then
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "FlatPlane1" or v.Name == "FlatPlane2" or v.Name == "FlatPlane3" or v.Name == "FlatPlane4" then
                v.CanCollide = true
            end
        end
    else
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "FlatPlane1" or v.Name == "FlatPlane2" or v.Name == "FlatPlane3" or v.Name == "FlatPlane4" then
                v.CanCollide = false
            end
        end
    end
end)

local Test = Window:NewTab("KeyBind")
local TestSection = Test:NewSection("Test It")

TestSection:NewKeybind("Instant Bite", "Bite Instantly", Enum.KeyCode.Z, function()
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DataStreams"):WaitForChild("FishBiting"):InvokeServer()
end)

TestSection:NewKeybind("Catch Fish", "Catch It", Enum.KeyCode.X, function()
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DataStreams"):WaitForChild("FishCaught"):FireServer()
end)

TestSection:NewKeybind("Sell All Fish", "Sell Items In Inventory", Enum.KeyCode.C, function()
	local args = {
	"SellEverything"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DataStreams"):WaitForChild("processGameItemSold"):InvokeServer(unpack(args))
end)

--Teleports
local TP = Window:NewTab("Teleport")
local TPSection = TP:NewSection("Island Teleports")

TPSection:NewButton("Port Jackson", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1.92533493, 54.7303085, -125.37075, 0.00349852955, -6.52402292e-08, 0.999993861, -1.13667307e-08, 1, 6.52803962e-08, -0.999993861, -1.15950467e-08, 0.00349852955)
end)

TPSection:NewButton("Monster's Borough", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3208.61475, 41.6322098, 2732.29199, 0.0118128713, -1.34102898e-08, -0.999930203, 9.39091738e-09, 1, -1.33002844e-08, 0.999930203, -9.23314758e-09, 0.0118128713)
end)

TPSection:NewButton("Eruption Island", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2917.44849, 46.6815796, 1487.82544, -0.478020757, 5.67471758e-08, 0.878348529, 4.9678178e-08, 1, -3.75704836e-08, -0.878348529, 2.56752823e-08, -0.478020757)
end)

TPSection:NewButton("Shadow Isles", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2238.30688, 160.352386, -2382.46436, -0.419304878, 8.87802898e-09, 0.907845497, 2.58804018e-08, 1, 2.1741029e-09, -0.907845497, 2.44070169e-08, -0.419304878)
end)

TPSection:NewButton("Ancient Shores", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2460.42261, 44.1133499, -1779.42993, -0.405590564, 4.25247748e-09, -0.914054871, -5.46513981e-08, 1, 2.89026083e-08, 0.914054871, 6.16769995e-08, -0.405590564)
end)

TPSection:NewButton("Pharaoh's Dunes", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4216.44189, 49.6530342, 361.791901, -0.0456423573, 0.000128529966, -0.998957932, -0.000632887997, 0.99999994, 0.000157590955, 0.998957753, 0.00063942105, -0.0456422642)
end)

local TPSection = TP:NewSection("Ocean")

TPSection:NewButton("Smuggler's Bay", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-233.537033, 49.8551636, -47.3619614, 0.0340561084, 5.96809926e-08, -0.999419928, -6.92355897e-08, 1, 5.73563703e-08, 0.999419928, 6.72420981e-08, 0.0340561084)
end)

local TPSection = TP:NewSection("Game Teleports")

TPSection:NewButton("Port Jackson", "TP There", function()
    local args = {
	{
		islandName = "PortJackson",
		oceanNum = 1
	}
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DataStreams"):WaitForChild("TeleportRequestEvent"):FireServer(unpack(args))
end)

TPSection:NewButton("Timeless Tides", "TP There", function()
    local args = {
	{
		islandName = "SmugglersBay",
		oceanNum = 2
	}
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DataStreams"):WaitForChild("TeleportRequestEvent"):FireServer(unpack(args))
end)

local Grind = Window:NewTab("Grinding")
local GrindSection = Grind:NewSection("Grinding For Gems")

GrindSection:NewButton("TP To Shipwreck", "Grinding", function()
    local cantp = true
    if workspace:FindFirstChild("ShipModel1") and cantp then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ShipModel1.HitBox.CFrame
        cantp = false
    elseif workspace:FindFirstChild("ShipModel2") and cantp then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ShipModel2.HitBox.CFrame
        cantp = false
    elseif workspace:FindFirstChild("ShipModel3") and cantp then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ShipModel3.HitBox.CFrame
        cantp = false
    elseif workspace:FindFirstChild("ShipModel4") and cantp then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ShipModel4.HitBox.CFrame
        cantp = false
    elseif workspace:FindFirstChild("ShipModel5") and cantp then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ShipModel5.HitBox.CFrame
        cantp = false
    elseif workspace:FindFirstChild("ShipModel6") and cantp then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ShipModel6.HitBox.CFrame
        cantp = false
    end
end)

GrindSection:NewButton("TP To Treasure Chests", "Grinding", function()
    i = workspace.RandomChests
    for _, v in pairs(i:GetChildren()) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
    end
end)

GrindSection:NewButton("TP To Container", "Grinding", function()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if string.find(string.lower(v.Name), "abandonedcontainers") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Anchor.Part.CFrame
        end
    end
end)

GrindSection:NewButton("TP To Shark Loot", "Grinding", function()
    for _, v in pairs(game.Workspace.DroppedItems:GetChildren()) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:GetPivot()
    end
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("ESP For Things")

ESPSection:NewToggle("ESP Sea Creatures", "See Their Name", function(state)
    if state then
        i = true
        while wait(0.1) do
            if i == true then
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "GreatWhiteShark" or v.Name == "BigGreatWhiteShark" or v.Name == "NeonGreatWhiteShark" or v.Name == "KillerWhale" or v.Name == "NeonKillerWhale" or v.Name == "HammerheadShark" or v.Name == "VoidHammerheadShark" or v.Name == "ArmoredShark" or v.Name == "NeonArmoredShark" or v.Name == "CorruptedArmoredShark" or v.Name == "Piranha" or v.Name == "NeonPiranha" or v.Name == "ElephantSeal" or v.Name == "NeonElephantSeal" or v.Name == "CorruptedElephantSeal" or v.Name == "GinormousTrout" or v.Name == "UmbralSkimmer" or v.Name == "SweetTooth" then
                        if v:IsA("Model") then
                            for _, v2 in pairs(v:GetChildren()) do
                                if v2.Name == "Hitbox" then
                                    if not v2:FindFirstChild("ESPBillboard") then
                                        local billboard = Instance.new("BillboardGui")
                                        billboard.Name = "ESPBillboard"
                                        billboard.Size = UDim2.new(0, 50, 0, 50)
                                        billboard.StudsOffset = Vector3.new(0, 0, 0)
                                        billboard.AlwaysOnTop = true
                                        billboard.Parent = v2

                                        local label = Instance.new("TextLabel")
                                        label.Size = UDim2.new(1, 0, 0.25, 0)
                                        label.Position = UDim2.new(0, 0, 0, 0)
                                        label.BackgroundTransparency = 1
                                        label.TextColor3 = Color3.new(0, 1, 0)
                                        label.TextScaled = true
                                        label.Text = v.Name
                                        label.Parent = billboard
                                    end
                                    if v2:FindFirstChild("ESPBillboard") then
                                        v2.ESPBillboard.TextLabel.Text = v.Name
                                    end
                                end
                            end
                        end
                    end
                end
            elseif i == false then
                break
            end
        end
    else
        i = false
        for _, v in pairs(workspace:GetChildren()) do
            if v.Name == "GreatWhiteShark" or v.Name == "BigGreatWhiteShark" or v.Name == "NeonGreatWhiteShark" or v.Name == "KillerWhale" or v.Name == "NeonKillerWhale" or v.Name == "HammerheadShark" or v.Name == "VoidHammerheadShark" or v.Name == "ArmoredShark" or v.Name == "NeonArmoredShark" or v.Name == "CorruptedArmoredShark" or v.Name == "Piranha" or v.Name == "NeonPiranha" or v.Name == "ElephantSeal" or v.Name == "NeonElephantSeal" or v.Name == "CorruptedElephantSeal" or v.Name == "GinormousTrout" or v.Name == "UmbralSkimmer" or v.Name == "SweetTooth" then
                if v:IsA("Model") then
                    for _, v2 in pairs(v:GetChildren()) do
                        if v2.Name == "Hitbox" then
                            if v2:FindFirstChild("ESPBillboard") then
                                v2.ESPBillboard:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end
end)

local Visual = Window:NewTab("Visuals")
local VisualSection = Visual:NewSection("Change How Stuff Is Seen")

VisualSection:NewButton("Remove Clouds", "Deletes All Clouds", function()
    game.Workspace.Terrain.Clouds:Destroy()
end)

VisualSection:NewButton("Remove Underwater And Other Visuals", "Removes All Other Visuals", function()
    for _, v in pairs(game.Lighting:GetChildren()) do
        v:Destroy()
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)