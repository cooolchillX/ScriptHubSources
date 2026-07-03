local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Criminality", Duration = 4,})

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Common Things")

MainSection:NewButton("Inf Yield", "Build Apon", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MainSection:NewButton("Unnamed ESP", "Build Apon", function()
    pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
end)

MainSection:NewButton("Aimbot", "Build Apon", function()
    local select = select
    local pcall, getgenv, next, Vector2, math_clamp, type, mouse_move_rel = 
        select(1, pcall, getgenv, next, Vector2.new, math.clamp, type, mousemoverel or (Input and Input.MouseMove))

    local Players = game:GetService("Players")
    local Camera = workspace.CurrentCamera
    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local LocalPlayer = Players.LocalPlayer
    local runService = game:GetService("RunService")

    pcall(function()
        getgenv().Aimbot.Functions:Exit()
    end)

    getgenv().Aimbot = {}
    local Environment = getgenv().Aimbot

    local RequiredDistance, Typing, Running, Animation, ServiceConnections = 2000, false, false, nil, {}


    Environment.Settings = {
        Enabled = true,
        TeamCheck = false,
        AliveCheck = true,
        WallCheck = false,
        Sensitivity = 0,
        ThirdPerson = false,
        ThirdPersonSensitivity = 3,
        TriggerKey = "MouseButton2",
        Toggle = false,
        LockPart = "Head"
    }

    Environment.FOVSettings = {
        Enabled = true,
        Visible = true,
        Amount = 90,
        Color = Color3.fromRGB(255, 255, 255),
        LockedColor = Color3.fromRGB(255, 70, 70),
        Transparency = 0.5,
        Sides = 60,
        Thickness = 1,
        Filled = false
    }

    Environment.FOVCircle = Drawing.new("Circle")


    local function CancelLock()
        Environment.Locked = nil
        if Animation then Animation:Cancel() end
        Environment.FOVCircle.Color = Environment.FOVSettings.Color
    end

    local function GetClosestPlayer()
        if not Environment.Locked then
            RequiredDistance = (Environment.FOVSettings.Enabled and Environment.FOVSettings.Amount or 2000)

            for _, v in next, Players:GetPlayers() do
                if v ~= LocalPlayer then
                    if v.Character and v.Character:FindFirstChild(Environment.Settings.LockPart) and v.Character:FindFirstChildOfClass("Humanoid") then
                        if Environment.Settings.TeamCheck and v.Team == LocalPlayer.Team then continue end
                        if Environment.Settings.AliveCheck and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then continue end
                        if Environment.Settings.WallCheck and #(Camera:GetPartsObscuringTarget({v.Character[Environment.Settings.LockPart].Position}, v.Character:GetDescendants())) > 0 then continue end

                        local Vector, OnScreen = Camera:WorldToViewportPoint(v.Character[Environment.Settings.LockPart].Position)
                        local Distance = (Vector2(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y) - Vector2(Vector.X, Vector.Y)).Magnitude

                        if Distance < RequiredDistance and OnScreen then
                            RequiredDistance = Distance
                            Environment.Locked = v
                        end
                    end
                end
            end
        elseif (Vector2(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y) - 
                Vector2(Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).X, 
                        Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).Y)).Magnitude > RequiredDistance then
            CancelLock()
        end
    end


    ServiceConnections.TypingStartedConnection = UIS.TextBoxFocused:Connect(function()
        Typing = true
    end)

    ServiceConnections.TypingEndedConnection = UIS.TextBoxFocusReleased:Connect(function()
        Typing = false
    end)


    local function Load()
        ServiceConnections.RenderSteppedConnection = runService.RenderStepped:Connect(function()
            if Environment.FOVSettings.Enabled and Environment.Settings.Enabled then
                Environment.FOVCircle.Radius = Environment.FOVSettings.Amount
                Environment.FOVCircle.Thickness = Environment.FOVSettings.Thickness
                Environment.FOVCircle.Filled = Environment.FOVSettings.Filled
                Environment.FOVCircle.NumSides = Environment.FOVSettings.Sides
                Environment.FOVCircle.Color = Environment.FOVSettings.Color
                Environment.FOVCircle.Transparency = Environment.FOVSettings.Transparency
                Environment.FOVCircle.Visible = Environment.FOVSettings.Visible
                Environment.FOVCircle.Position = Vector2(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y)
            else
                Environment.FOVCircle.Visible = false
            end

            if Running and Environment.Settings.Enabled then
                GetClosestPlayer()

                if Environment.Locked then
                    if Environment.Settings.ThirdPerson then
                        Environment.Settings.ThirdPersonSensitivity = math_clamp(Environment.Settings.ThirdPersonSensitivity, 0.1, 5)

                        local Vector = Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position)
                        mouse_move_rel((Vector.X - UIS:GetMouseLocation().X) * Environment.Settings.ThirdPersonSensitivity, 
                                        (Vector.Y - UIS:GetMouseLocation().Y) * Environment.Settings.ThirdPersonSensitivity)
                    else
                        if Environment.Settings.Sensitivity > 0 then
                            Animation = TweenService:Create(Camera, TweenInfo.new(Environment.Settings.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 
                                            {CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)})
                            Animation:Play()
                        else
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)
                        end
                    end

                    Environment.FOVCircle.Color = Environment.FOVSettings.LockedColor
                end
            end
        end)

        ServiceConnections.InputBeganConnection = UIS.InputBegan:Connect(function(Input)
            if not Typing then
                pcall(function()
                    if Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
                        if Environment.Settings.Toggle then
                            Running = not Running
                            if not Running then
                                CancelLock()
                            end
                        else
                            Running = true
                        end
                    end
                end)

                pcall(function()
                    if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
                        if Environment.Settings.Toggle then
                            Running = not Running
                            if not Running then
                                CancelLock()
                            end
                        else
                            Running = true
                        end
                    end
                end)
            end
        end)

        ServiceConnections.InputEndedConnection = UIS.InputEnded:Connect(function(Input)
            if not Typing then
                if not Environment.Settings.Toggle then
                    pcall(function()
                        if Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
                            Running = false; CancelLock()
                        end
                    end)

                    pcall(function()
                        if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
                            Running = false; CancelLock()
                        end
                    end)
                end
            end
        end)
    end

    Environment.Functions = {}

    function Environment.Functions:Exit()
        for _, v in next, ServiceConnections do
            v:Disconnect()
        end

        if Environment.FOVCircle.Remove then Environment.FOVCircle:Remove() end

        getgenv().Aimbot.Functions = nil
        getgenv().Aimbot = nil
        
        Load = nil; GetClosestPlayer = nil; CancelLock = nil
    end

    function Environment.Functions:Restart()
        for _, v in next, ServiceConnections do
            v:Disconnect()
        end

        Load()
    end

    function Environment.Functions:ResetSettings()
        Environment.Settings = {
            Enabled = true,
            TeamCheck = false,
            AliveCheck = true,
            WallCheck = false,
            Sensitivity = 0,
            ThirdPerson = false,
            ThirdPersonSensitivity = 3,
            TriggerKey = "MouseButton2",
            Toggle = false,
            LockPart = "Head"
        }

        Environment.FOVSettings = {
            Enabled = true,
            Visible = true,
            Amount = 90,
            Color = Color3.fromRGB(255, 255, 255),
            LockedColor = Color3.fromRGB(255, 70, 70),
            Transparency = 0.5,
            Sides = 60,
            Thickness = 1,
            Filled = false
        }
    end

    Load()
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("See Things Through Walls")

ESPSection:NewToggle("Safe And Register ESP", "See Through Walls", function(state)
    if state then
        i = true
        while wait(1) do
            if not i then break end

            local containers = workspace.Map.BredMakurz
            local player = game.Players.LocalPlayer
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            for _, v in pairs(containers:GetChildren()) do
                if not v:IsA("Model") or not v:FindFirstChild("Values") or not v.Values:FindFirstChild("Broken") then
                    continue
                end

                local isBroken = v.Values.Broken.Value
                local isInRange = hrp and v.PrimaryPart and (v.PrimaryPart.Position - hrp.Position).Magnitude <= 50

                if isBroken then
                    if v:FindFirstChild("ESPBillboard") then
                        v.ESPBillboard:Destroy()
                    end
                    if v:FindFirstChild("ESPHighlight") then
                        v.ESPHighlight:Destroy()
                    end
                    continue
                end

                if not v:FindFirstChild("ESPBillboard") then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "ESPBillboard"
                    billboard.Size = UDim2.new(0, 50, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 1, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = v

                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                    textLabel.Position = UDim2.new(0, 0, 0, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextColor3 = Color3.fromRGB(85, 107, 47)

                    if v.Name:find("Register") then
                        textLabel.Text = "Register"
                    elseif v.Name:find("SmallSafe") then
                        textLabel.Text = "SmallSafe"
                    elseif v.Name:find("MediumSafe") then
                        textLabel.Text = "MediumSafe"
                    else
                        textLabel.Text = v.Name
                    end

                    textLabel.Parent = billboard
                end

                if isInRange then
                    if not v:FindFirstChild("ESPHighlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "ESPHighlight"
                        highlight.Adornee = v
                        highlight.FillTransparency = 0.5
                        highlight.FillColor = Color3.fromRGB(85, 107, 47)
                        highlight.OutlineTransparency = 0
                        highlight.OutlineColor = Color3.fromRGB(85, 107, 47)
                        highlight.Parent = v
                    end
                else
                    if v:FindFirstChild("ESPHighlight") then
                        v.ESPHighlight:Destroy()
                    end
                end
            end
        end
    else
        i = false
        local containers = workspace.Map.BredMakurz
        for _, v in pairs(containers:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
            if v:FindFirstChild("ESPHighlight") then
                v.ESPHighlight:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Scrap ESP", "See Scrap Through Walls", function(state)
    if state then
        j = true
        while wait(1) do
            if j == true then
                local scraps = game:GetService("Workspace").Filter.SpawnedPiles
                local player = game.Players.LocalPlayer
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")

                for _, v in pairs(scraps:GetChildren()) do
                    if v:IsA("Model") and not v:FindFirstChild("ESPBillboard") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESPBillboard"
                        billboard.Size = UDim2.new(0, 50, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 1, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = v

                        local scrapName = "Scrap"
                        if v.Name == "S1" then
                            scrapName = "Scrap_Tier_1"
                        elseif v.Name == "S2" then
                            scrapName = "Scrap_Tier_2"
                        end

                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                        textLabel.Position = UDim2.new(0, 0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = Color3.fromRGB(0, 0, 139)
                        textLabel.Text = scrapName
                        textLabel.Parent = billboard
                    end

                    if hrp and v.PrimaryPart and (v.PrimaryPart.Position - hrp.Position).Magnitude <= 50 then
                        if not v:FindFirstChild("ESPHighlight") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "ESPHighlight"
                            highlight.Adornee = v
                            highlight.FillTransparency = 0.5
                            highlight.FillColor = Color3.fromRGB(0, 0, 139)
                            highlight.OutlineTransparency = 0
                            highlight.OutlineColor = Color3.fromRGB(0, 0, 139)
                            highlight.Parent = v
                        end
                    else
                        if v:FindFirstChild("ESPHighlight") then
                            v.ESPHighlight:Destroy()
                        end
                    end
                end
            elseif j == false then
                break
            end
        end
    else
        j = false
        local scraps = workspace.Filter.SpawnedPiles
        for _, v in pairs(scraps:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
            if v:FindFirstChild("ESPHighlight") then
                v.ESPHighlight:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Crate ESP", "See Crates Through Walls", function(state)
    if state then
        k = true
        while wait(1) do
            if k == true then
                local crates = game:GetService("Workspace").Filter.SpawnedPiles
                local player = game.Players.LocalPlayer
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")

                for _, v in pairs(crates:GetChildren()) do
                    if v:IsA("Model") and v.Name == "C1" then
                        if not v:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 50, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 1, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = v

                            local textLabel = Instance.new("TextLabel")
                            textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                            textLabel.Position = UDim2.new(0, 0, 0, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(139, 69, 19)
                            textLabel.Text = "Crate"
                            textLabel.Parent = billboard
                        end

                        if hrp and v.PrimaryPart and (v.PrimaryPart.Position - hrp.Position).Magnitude <= 50 then
                            if not v:FindFirstChild("ESPHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "ESPHighlight"
                                highlight.Adornee = v
                                highlight.FillTransparency = 0.5
                                highlight.FillColor = Color3.fromRGB(139, 69, 19)
                                highlight.OutlineTransparency = 0
                                highlight.OutlineColor = Color3.fromRGB(139, 69, 19)
                                highlight.Parent = v
                            end
                        else
                            if v:FindFirstChild("ESPHighlight") then
                                v.ESPHighlight:Destroy()
                            end
                        end
                    end
                end
            else
                break
            end
        end
    else
        k = false
        local crates = workspace.Filter.SpawnedPiles
        for _, v in pairs(crates:GetChildren()) do
            if v:IsA("Model") and v.Name == "C1" then
                if v:FindFirstChild("ESPBillboard") then
                    v.ESPBillboard:Destroy()
                end
                if v:FindFirstChild("ESPHighlight") then
                    v.ESPHighlight:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Dealer ESP", "See Dealers Through Walls", function(state)
    if state then
        d = true
        while wait(1) do
            if not d then break end

            local shopz = workspace.Map.Shopz
            local player = game.Players.LocalPlayer
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            for _, shop in pairs(shopz:GetChildren()) do
                for _, npcName in pairs({"DealerMan", "ArmoryMan"}) do
                    local npc = shop:FindFirstChild(npcName)

                    if npc and npc:IsA("Model") then
                        if not npc.PrimaryPart then
                            local head = npc:FindFirstChild("Head") or npc:FindFirstChildWhichIsA("BasePart")
                            if head then npc.PrimaryPart = head end
                        end

                        if not npc:FindFirstChild("ESPBillboard") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ESPBillboard"
                            billboard.Size = UDim2.new(0, 50, 0, 50)
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = npc

                            local label = Instance.new("TextLabel")
                            label.Size = UDim2.new(1, 0, 0.5, 0)
                            label.Position = UDim2.new(0, 0, 0, 0)
                            label.BackgroundTransparency = 1
                            label.TextColor3 = Color3.fromRGB(173, 216, 230)
                            label.Font = Enum.Font.Gotham
                            label.TextSize = 12
                            label.TextTransparency = 0.15
                            label.Text = (npcName == "DealerMan") and "Dealer" or "ArmoryDealer"
                            label.Parent = billboard
                        end

                        if hrp and npc.PrimaryPart and (npc.PrimaryPart.Position - hrp.Position).Magnitude <= 50 then
                            if not npc:FindFirstChild("ESPHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "ESPHighlight"
                                highlight.Adornee = npc
                                highlight.FillTransparency = 0.5
                                highlight.FillColor = Color3.fromRGB(173, 216, 230)
                                highlight.OutlineTransparency = 0
                                highlight.OutlineColor = Color3.fromRGB(173, 216, 230)
                                highlight.Parent = npc
                            end
                        elseif npc:FindFirstChild("ESPHighlight") then
                            npc.ESPHighlight:Destroy()
                        end
                    end
                end
            end
        end
    else
        d = false
        for _, shop in pairs(workspace.Map.Shopz:GetChildren()) do
            for _, npcName in pairs({"DealerMan", "ArmoryMan"}) do
                local npc = shop:FindFirstChild(npcName)
                if npc then
                    if npc:FindFirstChild("ESPBillboard") then
                        npc.ESPBillboard:Destroy()
                    end
                    if npc:FindFirstChild("ESPHighlight") then
                        npc.ESPHighlight:Destroy()
                    end
                end
            end
        end
    end
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)