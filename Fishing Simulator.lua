local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local seacreaturetable = {}
local seacreature = false
local seacreatureconnect
local fish = ""
local size = 1
local mutation = "commonglow"
local auto = false
local autocatch = false
local hitbox = false

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Fishing Simulator", Duration = 4,})

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

local MainSection = Main:NewSection("Experimental Features")

MainSection:NewTextBox("Desired Fish", "No Spaces And All Lowercase", function(txt)
	fish = txt
end)

MainSection:NewDropdown("Desired Size", "Wanted Size", {"Baby", "Small", "Normal", "Large", "Huge"}, function(currentOption)
    if currentOption == "Baby" then
        size = 1
    elseif currentOption == "Small" then
        size = 2
    elseif currentOption == "Normal" then
        size = 3
    elseif currentOption == "Large" then
        size = 4
    elseif currentOption == "Huge" then
        size = 5
    end
end)

MainSection:NewDropdown("Desired Mutation", "Wanted Mutation", {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic"}, function(currentOption)
    if currentOption == "Common" then
        mutation = "commonglow"
    elseif currentOption == "Uncommon" then
        mutation = "uncommonglow"
    elseif currentOption == "Rare" then
        mutation = "rareglow"
    elseif currentOption == "Epic" then
        mutation = "epicglow"
    elseif currentOption == "Legendary" then
        mutation = "legendaryglow"
    elseif currentOption == "Mythic" then
        mutation = "mythicglow"
    end
end)


MainSection:NewToggle("Auto Catch After 2sec", "Faster Catch For Catch Wanted Fish", function(state)
    if state then
        autocatch = true
    else
        autocatch = false
    end
end)

MainSection:NewButton("Catch Wanted Fish", "Helps A Lot With Hard Quests", function()
    local hooked
    local count = 0
    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("ObjectValue") then
            hooked = v
        end
    end
    auto = true
    local stopped = false
    local hookevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishBiting
    local catchevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishCaught
    while auto and not stopped do
        task.wait(0.15)
        local currentFish = tostring(hooked.Value)
        if currentFish == fish then
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
            stopped = true
            game.StarterGui:SetCore("SendNotification", {Title = currentFish .. " Hooked", Text = "Atempt Number: " .. tostring(count), Duration = 4,})
            if autocatch then
                task.wait(2)
                catchevent:FireServer()
            end
            break
        end
        if not stopped and tostring(hooked.Value) ~= fish then
            task.spawn(function()
                count = count + 1
                hookevent:InvokeServer()
            end)
        end
    end
end)

MainSection:NewButton("Catch Wanted Fish With Specific Size", "Helps A Lot With Hard Quests", function()
    local hooked
    local count = 0
    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("ObjectValue") then
            hooked = v
        end
    end
    auto = true
    local stopped = false
    local hookevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishBiting
    local catchevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishCaught
    while auto and not stopped do
        task.wait(0.15)
        local currentFish = tostring(hooked.Value)
        if currentFish == fish then
            if hooked.Value:GetAttribute("size") == size then
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
                stopped = true
                game.StarterGui:SetCore("SendNotification", {Title = currentFish .. " Hooked " .. tostring(hooked.Value:GetAttribute("size")), Text = "Atempt Number: " .. tostring(count), Duration = 4,})
                if autocatch then
                    task.wait(2)
                    catchevent:FireServer()
                end
                break
            end
        end
        if not stopped and tostring(hooked.Value) ~= fish then
            task.spawn(function()
                count = count + 1
                hookevent:InvokeServer()
            end)
        end
    end
end)

MainSection:NewButton("Catch Wanted Fish With Specific Mutation", "Helps A Lot With Hard Quests", function()
    local hooked
    local count = 0
    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("ObjectValue") then
            hooked = v
        end
    end
    auto = true
    local stopped = false
    local hookevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishBiting
    local catchevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishCaught
    while auto and not stopped do
        task.wait(0.15)
        local currentFish = tostring(hooked.Value)
        if currentFish == fish then
            if hooked.Value:GetAttribute("mutation") == mutation then
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
                stopped = true
                game.StarterGui:SetCore("SendNotification", {Title = currentFish .. " Hooked " .. tostring(hooked.Value:GetAttribute("mutation")), Text = "Atempt Number: " .. tostring(count), Duration = 4,})
                if autocatch then
                    task.wait(2)
                    catchevent:FireServer()
                end
                break
            end
        end
        if not stopped and tostring(hooked.Value) ~= fish then
            task.spawn(function()
                count = count + 1
                hookevent:InvokeServer()
            end)
        end
    end
end)

MainSection:NewButton("Catch Any Fish With Specific Size", "Helps A Lot With Hard Quests", function()
    local hooked
    local count = 0
    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("ObjectValue") then
            hooked = v
        end
    end
    auto = true
    local stopped = false
    local hookevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishBiting
    local catchevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishCaught
    while auto and not stopped do
        task.wait(0.15)
        local currentFish = tostring(hooked.Value)
        if hooked.Value then
            if hooked.Value:GetAttribute("size") == size then
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
                stopped = true
                game.StarterGui:SetCore("SendNotification", {Title = currentFish .. " Hooked " .. tostring(hooked.Value:GetAttribute("size")), Text = "Atempt Number: " .. tostring(count), Duration = 4,})
                if autocatch then
                    task.wait(2)
                    catchevent:FireServer()
                end
                break
            end
            if not stopped then
                task.spawn(function()
                    count = count + 1
                    hookevent:InvokeServer()
                end)
            end
        end
    end
end)

MainSection:NewButton("Catch Any Fish With Specific Mutation", "Helps A Lot With Hard Quests", function()
    local hooked
    local count = 0
    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("ObjectValue") then
            hooked = v
        end
    end
    auto = true
    local stopped = false
    local hookevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishBiting
    local catchevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishCaught
    while auto and not stopped do
        task.wait(0.15)
        local currentFish = tostring(hooked.Value)
        if hooked.Value then
            if hooked.Value:GetAttribute("mutation") == mutation then
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
                stopped = true
                game.StarterGui:SetCore("SendNotification", {Title = currentFish .. " Hooked " .. tostring(hooked.Value:GetAttribute("mutation")), Text = "Atempt Number: " .. tostring(count), Duration = 4,})
                if autocatch then
                    task.wait(2)
                    catchevent:FireServer()
                end
                break
            end
        end
        if not stopped then
            task.spawn(function()
                count = count + 1
                hookevent:InvokeServer()
            end)
        end
    end
end)

MainSection:NewButton("Catch Any Fish With A Mutation", "Helps A Lot With Hard Quests", function()
    local hooked
    local count = 0
    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("ObjectValue") then
            hooked = v
        end
    end
    auto = true
    local stopped = false
    local hookevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishBiting
    local catchevent = game:GetService("ReplicatedStorage").Shared.DataStreams.FishCaught
    while auto and not stopped do
        task.wait(0.15)
        local currentFish = tostring(hooked.Value)
        if hooked.Value then
            if hooked.Value:GetAttribute("mutation") then
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
                stopped = true
                game.StarterGui:SetCore("SendNotification", {Title = currentFish .. " Hooked " .. tostring(hooked.Value:GetAttribute("mutation")), Text = "Atempt Number: " .. tostring(count), Duration = 4,})
                if autocatch then
                    task.wait(2)
                    catchevent:FireServer()
                end
                break
            end
        end
        if not stopped then
            task.spawn(function()
                count = count + 1
                hookevent:InvokeServer()
            end)
        end
    end
end)

local Fish = Window:NewTab("Fish Stuff")
local FishSection = Fish:NewSection("Mainly Gotta Do With Fish")

FishSection:NewButton("Instant Bite", "Fish Will Bite The Rod", function()
    game:GetService("ReplicatedStorage").Shared.DataStreams.FishBiting:InvokeServer()
end)

FishSection:NewButton("Catch Fish", "Catches The Fish", function()
    game:GetService("ReplicatedStorage").Shared.DataStreams.FishCaught:FireServer()
end)

FishSection:NewButton("Sell All Fish", "Sell All Your Fish", function()
    game:GetService("ReplicatedStorage").Shared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
end)

FishSection:NewButton("Delete Water (Loops So Only Click Once)", "Remove All Terrain Water", function()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "FlatPlane1" or v.Name == "FlatPlane2" or v.Name == "FlatPlane3" or v.Name == "FlatPlane4" then
            v.Transparency = 0.5
        end
    end
    while wait(0.2) do
        workspace.Terrain:Clear()
    end
end)

FishSection:NewToggle("Walk On Water (Jesus)", "Walk On The Water", function(state)
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

local Keybind = Window:NewTab("KeyBind")
local KeybindSection = Keybind:NewSection("For Easier Usage")

KeybindSection:NewKeybind("Instant Bite", "Bite Instantly", Enum.KeyCode.Z, function()
    game:GetService("ReplicatedStorage").Shared.DataStreams.FishBiting:InvokeServer()
end)

KeybindSection:NewKeybind("Catch Fish", "Catch It", Enum.KeyCode.X, function()
    game:GetService("ReplicatedStorage").Shared.DataStreams.FishCaught:FireServer()
end)

KeybindSection:NewKeybind("Sell All Fish", "Sell Items In Inventory", Enum.KeyCode.C, function()
	game:GetService("ReplicatedStorage").Shared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
end)

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

TPSection:NewButton("Nidhogg's Reach", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2290.01367, 49.4241562, -84.4888077, -0.806656003, 2.40556055e-08, 0.59102124, -1.07170761e-08, 1, -5.53289752e-08, -0.59102124, -5.09654683e-08, -0.806656003)
end)

TPSection:NewButton("Cyber City", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71.4431305, 43.619957, -2599.10864, -0.999874413, 5.42895862e-09, -0.0158462431, 4.29483649e-09, 1, 7.1604461e-08, 0.0158462431, 7.15274169e-08, -0.999874413)
end)

TPSection:NewButton("Sakura Cove", "TP There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(266.763214, 50.0802841, 3026.25269, 0.999255359, -2.53539483e-08, 0.0385845117, 2.21274998e-08, 1, 8.40473646e-08, -0.0385845117, -8.3130999e-08, 0.999255359)
end)

local TPSection = TP:NewSection("Game Teleports")

TPSection:NewButton("Port Jackson", "TP There", function()
    game.ReplicatedStorage.Shared.DataStreams.TeleportRequestEvent:FireServer({islandName = "PortJackson", oceanNum = 1})
end)

TPSection:NewButton("Timeless Tides", "TP There", function()
    game.ReplicatedStorage.Shared.DataStreams.TeleportRequestEvent:FireServer({islandName = "SmugglersBay", oceanNum = 2})
end)

local Grind = Window:NewTab("Grinding")
local GrindSection = Grind:NewSection("Grinding For Gems")

GrindSection:NewButton("TP To Shipwreck", "Grinding", function()
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "ShipModel1" or v.Name == "ShipModel2" or v.Name == "ShipModel3" or v.Name == "ShipModel4" or v.Name == "ShipModel5"  or v.Name == "ShipModel6" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HitBox.CFrame
        end
    end
end)

GrindSection:NewButton("TP To Treasure Chests", "Grinding", function()
    for _, v in pairs(game.workspace.RandomChests:GetChildren()) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
    end
end)

GrindSection:NewButton("TP To Container", "Grinding", function()
    for _, v in pairs(game.workspace:GetChildren()) do
        if v.Name == "AbandonedContainers1" or v.Name == "AbandonedContainers2" or v.Name == "AbandonedContainers3" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Anchor.Part.CFrame
        end
    end
end)

GrindSection:NewButton("TP To Shark Loot", "Grinding", function()
    local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for _, v in pairs(game.Workspace.DroppedItems:GetChildren()) do
        if v:FindFirstChild("Ring") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:GetPivot()
            task.wait(0.15)
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("ESP For Things")

ESPSection:NewToggle("ESP Sea Creatures", "See Their Name", function(state)
    if state then
        seacreature = true
        for _, v in pairs(game.workspace:GetChildren()) do
            if v.Name == "GreatWhiteShark" or v.Name == "BigGreatWhiteShark" or v.Name == "NeonGreatWhiteShark" or v.Name == "KillerWhale" or v.Name == "NeonKillerWhale" or v.Name == "HammerheadShark" or v.Name == "VoidHammerheadShark" or v.Name == "ArmoredShark" or v.Name == "NeonArmoredShark" or v.Name == "CorruptedArmoredShark" or v.Name == "Piranha" or v.Name == "NeonPiranha" or v.Name == "ElephantSeal" or v.Name == "NeonElephantSeal" or v.Name == "CorruptedElephantSeal" or v.Name == "GinormousTrout" or v.Name == "UmbralSkimmer" or v.Name == "SweetTooth" then
                table.insert(seacreaturetable, v)
            end
        end
        seacreatureconnect = game.workspace.ChildAdded:Connect(function(v)
            if v.Name == "GreatWhiteShark" or v.Name == "BigGreatWhiteShark" or v.Name == "NeonGreatWhiteShark" or v.Name == "KillerWhale" or v.Name == "NeonKillerWhale" or v.Name == "HammerheadShark" or v.Name == "VoidHammerheadShark" or v.Name == "ArmoredShark" or v.Name == "NeonArmoredShark" or v.Name == "CorruptedArmoredShark" or v.Name == "Piranha" or v.Name == "NeonPiranha" or v.Name == "ElephantSeal" or v.Name == "NeonElephantSeal" or v.Name == "CorruptedElephantSeal" or v.Name == "GinormousTrout" or v.Name == "UmbralSkimmer" or v.Name == "SweetTooth" then
                table.insert(seacreaturetable, v)
            end
        end)
        while task.wait(0.1) do
            if seacreature then
                xpcall(function()
                    for i = #seacreaturetable, 1, -1 do
                        local v = seacreaturetable[i]
                        if not v or not v.Parent then
                            table.remove(seacreaturetable, i)
                        else
                            if not v:FindFirstChild("ESPBillboard") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESPBillboard"
                                billboard.Size = UDim2.new(0, 50, 0, 50)
                                billboard.StudsOffset = Vector3.new(0, 0, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = v

                                local label = Instance.new("TextLabel")
                                label.Size = UDim2.new(1, 0, 1, 0)
                                label.Position = UDim2.new(0, 0, 0, 0)
                                label.BackgroundTransparency = 1
                                label.TextColor3 = Color3.new(1, 0, 0)
                                label.TextScaled = true
                                label.Text = v.Name
                                label.Parent = billboard
                            end
                        end
                    end
                end, function(err)
                    warn("Sea Creature ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif seacreature == false then
                break
            end
        end
    else
        seacreature = false
        seacreatureconnect:Disconnect()
        seacreaturetable = {}
        for _, v in pairs(game.workspace:GetChildren()) do
            if v.Name == "GreatWhiteShark" or v.Name == "BigGreatWhiteShark" or v.Name == "NeonGreatWhiteShark" or v.Name == "KillerWhale" or v.Name == "NeonKillerWhale" or v.Name == "HammerheadShark" or v.Name == "VoidHammerheadShark" or v.Name == "ArmoredShark" or v.Name == "NeonArmoredShark" or v.Name == "CorruptedArmoredShark" or v.Name == "Piranha" or v.Name == "NeonPiranha" or v.Name == "ElephantSeal" or v.Name == "NeonElephantSeal" or v.Name == "CorruptedElephantSeal" or v.Name == "GinormousTrout" or v.Name == "UmbralSkimmer" or v.Name == "SweetTooth" then
                if v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

local Visual = Window:NewTab("Visuals")
local VisualSection = Visual:NewSection("Change How Stuff Is Seen")

VisualSection:NewButton("Remove Clouds", "Deletes All Clouds", function()
    game.workspace.Terrain.Clouds:Destroy()
end)

VisualSection:NewButton("Remove Underwater And Other Visuals", "Removes All Other Visuals", function()
    for _, v in pairs(game.Lighting:GetChildren()) do
        v:Destroy()
    end
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

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
