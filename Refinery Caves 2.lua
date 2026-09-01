local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

local nocliptable = {}
local noclip = false
local selectedinstance = nil
local oretable = {}
local ore = false
local oreconnect
local treetable = {}
local tree = false
local treeconnect
local playertable = {}
local player = false
local playerconnect
local seatable = {}
local sea = false
local seaconnect
local spottable = {}
local spot = false
local spotconnect
local oilpartholder = {}
local orecolor = Color3.fromRGB(255, 0, 0)
local treecolor = Color3.fromRGB(0, 0, 255)
local playercolor = Color3.fromRGB(0, 255, 0)
local seacolor = Color3.fromRGB(0, 255, 0)
local spotcolor = Color3.fromRGB(85,255,255)
local oilcolor = Color3.fromRGB(85,255,255)
local waitforclickhit
local waitforclickhit2
local lightingconnects = {}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local FlySpeed = 100
local VehicleFlySpeed = 100


local FlyActive = false
local VehicleFlyActive = false

local FlyHeartbeat = nil
local VehicleFlyHeartbeat = nil

local FlyVelocityObject = nil
local VehicleVelocityObject = nil
local VehicleGyroObject = nil

local CurrentVehicleRoot = nil
local CurrentVehicleSeat = nil
local VehicleRotationOffset = nil

local MovementState = {
    W = false,
    A = false,
    S = false,
    D = false
}

local MovementVector = Vector3.zero


local function GetPlayerCharacter()
    local PlayerCharacter = LocalPlayer.Character

    if PlayerCharacter and PlayerCharacter.Parent then
        return PlayerCharacter
    end

    return nil
end

local function GetPlayerHumanoid(PlayerCharacter)
    if not PlayerCharacter then
        return nil
    end

    return PlayerCharacter:FindFirstChildOfClass("Humanoid")
end

local function GetPlayerRoot(PlayerCharacter)
    if not PlayerCharacter then
        return nil
    end

    return PlayerCharacter:FindFirstChild("HumanoidRootPart")
end

local function UpdateMovement()
    local NewVector = Vector3.zero

    if MovementState.W then
        NewVector += Vector3.new(0, 0, -1)
    end

    if MovementState.S then
        NewVector += Vector3.new(0, 0, 1)
    end

    if MovementState.A then
        NewVector += Vector3.new(-1, 0, 0)
    end

    if MovementState.D then
        NewVector += Vector3.new(1, 0, 0)
    end

    MovementVector = NewVector
end

local function ClearMovement()
    MovementState.W = false
    MovementState.A = false
    MovementState.S = false
    MovementState.D = false

    MovementVector = Vector3.zero
end

UIS.InputBegan:Connect(function(InputObject, GameProcessed)
    if GameProcessed then
        return
    end

    if InputObject.KeyCode == Enum.KeyCode.W then
        MovementState.W = true
    elseif InputObject.KeyCode == Enum.KeyCode.A then
        MovementState.A = true
    elseif InputObject.KeyCode == Enum.KeyCode.S then
        MovementState.S = true
    elseif InputObject.KeyCode == Enum.KeyCode.D then
        MovementState.D = true
    end

    UpdateMovement()
end)

UIS.InputEnded:Connect(function(InputObject)
    if InputObject.KeyCode == Enum.KeyCode.W then
        MovementState.W = false
    elseif InputObject.KeyCode == Enum.KeyCode.A then
        MovementState.A = false
    elseif InputObject.KeyCode == Enum.KeyCode.S then
        MovementState.S = false
    elseif InputObject.KeyCode == Enum.KeyCode.D then
        MovementState.D = false
    end

    UpdateMovement()
end)

UIS.TextBoxFocused:Connect(function()
    ClearMovement()
end)

UIS.WindowFocusReleased:Connect(function()
    ClearMovement()
end)


local function GetMovementDirection()
    local CurrentCamera = workspace.CurrentCamera

    if not CurrentCamera then
        return Vector3.zero
    end

    if MovementVector.Magnitude <= 0 then
        return Vector3.zero
    end

    local WorldDirection =
        CurrentCamera.CFrame:VectorToWorldSpace(MovementVector)

    if WorldDirection.Magnitude <= 0 then
        return Vector3.zero
    end

    return WorldDirection.Unit
end


local function RemoveFlyObject()
    if FlyVelocityObject then
        if FlyVelocityObject.Parent then
            FlyVelocityObject:Destroy()
        end

        FlyVelocityObject = nil
    end
end


function startFly()
    FlyActive = true

    if FlyHeartbeat then
        return
    end

    FlyHeartbeat = RunService.Heartbeat:Connect(function()
        if not FlyActive then
            return
        end

        local PlayerCharacter = GetPlayerCharacter()

        if not PlayerCharacter then
            RemoveFlyObject()
            return
        end

        local PlayerHumanoid =
            GetPlayerHumanoid(PlayerCharacter)

        local PlayerRoot =
            GetPlayerRoot(PlayerCharacter)

        if not PlayerHumanoid or not PlayerRoot then
            RemoveFlyObject()
            return
        end

        if not FlyVelocityObject
            or FlyVelocityObject.Parent ~= PlayerRoot then

            RemoveFlyObject()

            FlyVelocityObject = Instance.new("BodyVelocity")
            FlyVelocityObject.Name = "FlyVelocityObject"
            FlyVelocityObject.MaxForce = Vector3.new(
                math.huge,
                math.huge,
                math.huge
            )
            FlyVelocityObject.P = 10000
            FlyVelocityObject.Velocity = Vector3.zero
            FlyVelocityObject.Parent = PlayerRoot
        end

        local MovementDirection = GetMovementDirection()

        if MovementDirection.Magnitude > 0 then
            FlyVelocityObject.Velocity =
                MovementDirection * FlySpeed
        else
            FlyVelocityObject.Velocity =
                Vector3.zero
        end
    end)
end

function stopFly()
    FlyActive = false

    RemoveFlyObject()
    ClearMovement()

    if FlyHeartbeat then
        FlyHeartbeat:Disconnect()
        FlyHeartbeat = nil
    end
end


local function RemoveVehicleFlyObjects()
    if VehicleVelocityObject then
        if VehicleVelocityObject.Parent then
            VehicleVelocityObject:Destroy()
        end

        VehicleVelocityObject = nil
    end

    if VehicleGyroObject then
        if VehicleGyroObject.Parent then
            VehicleGyroObject:Destroy()
        end

        VehicleGyroObject = nil
    end

    CurrentVehicleRoot = nil
    CurrentVehicleSeat = nil
    VehicleRotationOffset = nil
end


local function CreateVehicleFlyObjects(NewRoot, NewSeat)
    RemoveVehicleFlyObjects()

    CurrentVehicleRoot = NewRoot
    CurrentVehicleSeat = NewSeat

    VehicleRotationOffset =
        NewSeat.CFrame:ToObjectSpace(NewRoot.CFrame)

    VehicleVelocityObject = Instance.new("BodyVelocity")
    VehicleVelocityObject.Name = "VehicleFlyVelocityObject"
    VehicleVelocityObject.MaxForce = Vector3.new(
        math.huge,
        math.huge,
        math.huge
    )
    VehicleVelocityObject.P = 10000
    VehicleVelocityObject.Velocity = Vector3.zero
    VehicleVelocityObject.Parent = NewRoot

    VehicleGyroObject = Instance.new("BodyGyro")
    VehicleGyroObject.Name = "VehicleFlyGyroObject"
    VehicleGyroObject.MaxTorque = Vector3.new(
        math.huge,
        math.huge,
        math.huge
    )
    VehicleGyroObject.P = 10000
    VehicleGyroObject.D = 500
    VehicleGyroObject.CFrame = NewRoot.CFrame
    VehicleGyroObject.Parent = NewRoot
end


function vflyOn()
    VehicleFlyActive = true

    if VehicleFlyHeartbeat then
        return
    end

    VehicleFlyHeartbeat = RunService.Heartbeat:Connect(function()
        if not VehicleFlyActive then
            return
        end

        local PlayerCharacter = GetPlayerCharacter()

        if not PlayerCharacter then
            RemoveVehicleFlyObjects()
            return
        end

        local PlayerHumanoid =
            GetPlayerHumanoid(PlayerCharacter)

        if not PlayerHumanoid then
            RemoveVehicleFlyObjects()
            return
        end

        local CurrentSeat = PlayerHumanoid.SeatPart

        if not CurrentSeat
            or not CurrentSeat:IsA("VehicleSeat") then

            RemoveVehicleFlyObjects()
            return
        end

        local VehicleRoot =
            CurrentSeat.AssemblyRootPart

        if not VehicleRoot
            or not VehicleRoot.Parent then

            RemoveVehicleFlyObjects()
            return
        end

        if not VehicleVelocityObject
            or not VehicleGyroObject
            or CurrentVehicleRoot ~= VehicleRoot
            or CurrentVehicleSeat ~= CurrentSeat
            or VehicleVelocityObject.Parent ~= VehicleRoot
            or VehicleGyroObject.Parent ~= VehicleRoot
            or not VehicleRotationOffset then

            CreateVehicleFlyObjects(
                VehicleRoot,
                CurrentSeat
            )
        end

        if not VehicleVelocityObject
            or not VehicleGyroObject
            or not VehicleRotationOffset then

            return
        end

        local MovementDirection = GetMovementDirection()

        if MovementDirection.Magnitude > 0 then
            VehicleVelocityObject.Velocity =
                MovementDirection * VehicleFlySpeed
        else
            VehicleVelocityObject.Velocity =
                Vector3.zero
        end

        local CurrentCamera = workspace.CurrentCamera

        if CurrentCamera then
            local CameraLook =
                CurrentCamera.CFrame.LookVector

            if CameraLook.Magnitude > 0 then

                local CameraCFrame = CFrame.lookAt(
                    VehicleRoot.Position,
                    VehicleRoot.Position + CameraLook
                )

                -- Apply the original vehicle/seat offset.
                local TargetCFrame =
                    CameraCFrame * VehicleRotationOffset

                VehicleGyroObject.CFrame =
                    CFrame.new(VehicleRoot.Position) *
                    (TargetCFrame - TargetCFrame.Position)
            end
        end
    end)
end

function vflyOff()
    VehicleFlyActive = false

    RemoveVehicleFlyObjects()
    ClearMovement()

    if VehicleFlyHeartbeat then
        VehicleFlyHeartbeat:Disconnect()
        VehicleFlyHeartbeat = nil
    end
end

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)

    RemoveFlyObject()
    RemoveVehicleFlyObjects()
    ClearMovement()

    task.spawn(function()
        NewCharacter:WaitForChild(
            "HumanoidRootPart",
            10
        )
    end)
end)

LocalPlayer.CharacterRemoving:Connect(function()
    RemoveFlyObject()
    RemoveVehicleFlyObjects()
end)

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Refinery Caves 2", Duration = 4,})

local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Change Things About Your Player")

PlayerSection:NewSlider("WalkSpeed", "Player Speed", 100, 16, function(s) -- 100 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Player Jump Height", 100, 50, function(s) -- 100 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = s
end)

PlayerSection:NewSlider("HipHeight", "Player From Ground Offset", 50, 0, function(s) -- 50 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = s
end)

PlayerSection:NewSlider("Field Of View", "Player FOV", 120, 70, function(s) -- 120 (MaxValue) | 70 (MinValue)
    game.Workspace.Camera.FieldOfView = s
end)

PlayerSection:NewSlider("Gravity", "Player Gravity", 1000, 0, function(s) -- 1000 (MaxValue) | 0 (MinValue)
    game.Workspace.Gravity = s
end)

PlayerSection:NewButton("Reset Gravity", "Reset Your Gravity To Default", function()
    game.Workspace.Gravity = 196.2
end)

PlayerSection:NewToggle("Noclip", "Clip Through Walls", function(state)
    if state then
        noclip = true
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v and (v:IsA("Part") or v:IsA("MeshPart")) then
                if v.CanCollide then
                    table.insert(nocliptable, v)
                end
            end
        end
        while task.wait(0.1) do
            if noclip then
                for _, v in pairs(nocliptable) do
                    v.CanCollide = false
                end
            elseif noclip == false then
                break
            end
        end
    else
        noclip = false
        for _, v in pairs(nocliptable) do
            v.CanCollide = true
        end
        nocliptable = {}
    end
end)

PlayerSection:NewToggle("Fly", "Fly Into The Air", function(state)
    if state then
        startFly()
    else
        stopFly()
    end
end)

PlayerSection:NewSlider("Fly Speed", "Change How Fast You Fly", 500, 100, function(s) -- 500 (MaxValue) | 100 (MinValue)
    FlySpeed = s
end)

PlayerSection:NewToggle("Vehicle Fly", "Fly Into The Air", function(state)
    if state then
        vflyOn()
    else
        vflyOff()
    end
end)

PlayerSection:NewSlider("Vehicle Fly Speed", "Change How Fast You Fly", 500, 100, function(s) -- 500 (MaxValue) | 100 (MinValue)
    VehicleFlySpeed = s
end)

local World = Window:NewTab("World")
local WorldSection = World:NewSection("Modify The Environment")

WorldSection:NewToggle("Toggle Crystalized Abyss Bridge", "Toggle If It Exists", function(state)
    if state then
        workspace.Map.Structures.LightBridge.Bridge.Transparency = 0.5
        workspace.Map.Structures.LightBridge.Bridge.CanCollide = true
    else
        workspace.Map.Structures.LightBridge.Bridge.Transparency = 1
        workspace.Map.Structures.LightBridge.Bridge.CanCollide = false
    end
end)

local ItemTeleport = Window:NewTab("Teleport Items")
local ItemTeleportSection = ItemTeleport:NewSection("Teleport Materials")

ItemTeleportSection:NewButton("Create TP Point", "Make The Point", function()
    local waitforclick
    game.StarterGui:SetCore("SendNotification", {Title = "Waiting", Text = "Click Where You Want The Point", Duration = 4,})
    waitforclick = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local point = Instance.new("Part")
            point.Name = "TpPoint"
            point.Size = Vector3.new(1, 1, 1)
            point.Position = game.Players.LocalPlayer:GetMouse().Hit.Position + Vector3.new(0, 3, 0)
            point.Anchored = true
            point.Color = Color3.new(1, 1, 1)
            point.CanCollide = false
            point.Parent = game.workspace
            local highlight = Instance.new("Highlight")
            highlight.Name = "Highlight"
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
            highlight.Parent = point

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESPBillboard"
            billboard.Size = UDim2.new(0, 50, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 0, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = point

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0.25, 0)
            label.Position = UDim2.new(0, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(0, 1, 0)
            label.TextScaled = true
            label.Text = "TP Point"
            label.Parent = billboard
            game.StarterGui:SetCore("SendNotification", {Title = "Point Set", Text = "TP Point Has Been Set", Duration = 4,})
            waitforclick:Disconnect()
        end
    end)
end)

ItemTeleportSection:NewButton("Delete TP Point", "Remove The Point", function()
    game.workspace.TpPoint:Destroy()
end)

ItemTeleportSection:NewButton("TP To Point", "Tp You To The Point", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.TpPoint.CFrame
end)

ItemTeleportSection:NewButton("Select The Object", "Selects The Tree You Want To TP", function()
    local waitforclick
    game.StarterGui:SetCore("SendNotification", {Title = "Waiting", Text = "Click One The Object To Select It", Duration = 4,})
    waitforclick = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if game.Players.LocalPlayer:GetMouse().Target.Parent.Name == "WoodPart" and game.Players.LocalPlayer:GetMouse().Target.Parent:GetAttribute("_Network") == game.Players.LocalPlayer.Name then
                selectedinstance = game.Players.LocalPlayer:GetMouse().Target
                game.StarterGui:SetCore("SendNotification", {Title = selectedinstance.Parent:GetAttribute("Tree") .. " Found", Text = selectedinstance.Parent:GetAttribute("_Network") .. " Is Owner", Duration = 4,})
                waitforclick:Disconnect()
            elseif game.Players.LocalPlayer:GetMouse().Target.Parent.Name == "MaterialPart" and game.Players.LocalPlayer:GetMouse().Target.Parent:GetAttribute("_Network") == game.Players.LocalPlayer.Name then
                selectedinstance = game.Players.LocalPlayer:GetMouse().Target
                game.StarterGui:SetCore("SendNotification", {Title = selectedinstance.Parent:GetAttribute("Material") .. " Found", Text = selectedinstance.Parent:GetAttribute("_Network") .. " Is Owner", Duration = 4,})
                waitforclick:Disconnect()
            end
        end
    end)
end)

ItemTeleportSection:NewButton("TP Selected Object To Point", "TP It To A Point", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local old = hrp.CFrame
    if selectedinstance then
        local distance = (hrp.Position - selectedinstance.Position).Magnitude
        if distance <= 10 then
            hrp.CFrame = selectedinstance.CFrame
            game.ReplicatedStorage.Events.GrabHandler:InvokeServer(selectedinstance, "Grab", selectedinstance.Position, nil)
            hrp.CFrame = game.workspace.TpPoint.CFrame
            selectedinstance.CFrame = game.workspace.TpPoint.CFrame
            task.wait(1)
            hrp.CFrame = old
        elseif distance > 10 then
            game.StarterGui:SetCore("SendNotification", {Title = "Warning", Text = "Object Is Too Far Away", Duration = 4,})
        end
    elseif selectedinstance == nil or selectedinstance.Parent == nil then
        game.StarterGui:SetCore("SendNotification", {Title = "Error", Text = "Object Does Not Exist", Duration = 4,})
    end
end)

ItemTeleportSection:NewButton("TP All Nearby Stones To Point", "TP It To A Point", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local old = hrp.CFrame
    local stones = {}
    for _, v in pairs(game.workspace.Grab:GetChildren()) do
        if v:IsA("Model") and v.Name == "MaterialPart" then
            if v:FindFirstChild("Part") then
                pcall(function()
                    local distance = (hrp.Position - v.Part.Position).Magnitude
                    if distance <= 10 then
                        table.insert(stones, v)
                    end
                end)
            end
        end
    end
    game.StarterGui:SetCore("SendNotification", {Title = "Teleporting", Text = "Total:" .. tostring(#stones), Duration = 4,})
    for _, v in pairs(stones) do
        task.wait(0.01)
        pcall(function()
            game.ReplicatedStorage.Events.GrabHandler:InvokeServer(v.Part, "Grab", v.Part.Position, nil)
        end)
    end
    hrp.CFrame = game.workspace.TpPoint.CFrame
    for _, v in pairs(stones) do
        v.Part.CFrame = game.workspace.TpPoint.CFrame
    end
    task.wait(0.3)
    hrp.CFrame = old
    stones = {}
end)

ItemTeleportSection:NewButton("TP All Nearby Items To Point", "TP It To A Point", function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local old = hrp.CFrame
    local objects = {}
    for _, v in pairs(game.workspace.Grab:GetChildren()) do
        if v:IsA("Model") then
            pcall(function()
                local distance = (hrp.Position - v.PrimaryPart.Position).Magnitude
                if distance <= 10 then
                    table.insert(objects, v)
                end
            end)
        end
    end
    game.StarterGui:SetCore("SendNotification", {Title = "Teleporting", Text = "Total:" .. tostring(#objects), Duration = 4,})
    for _, v in pairs(objects) do
        task.wait(0.01)
        pcall(function()
            game.ReplicatedStorage.Events.GrabHandler:InvokeServer(v.PrimaryPart, "Grab", v.PrimaryPart.Position, nil)
        end)
    end
    hrp.CFrame = game.workspace.TpPoint.CFrame
    for _, v in pairs(objects) do
        v.PrimaryPart.CFrame = game.workspace.TpPoint.CFrame
    end
    task.wait(0.3)
    hrp.CFrame = old
    objects = {}
end)

local ItemTeleportSection = ItemTeleport:NewSection("Extra Point For Quality Of Life")

ItemTeleportSection:NewButton("Create Extra TP Point", "Makes Things Easier", function()
    local waitforclick
    game.StarterGui:SetCore("SendNotification", {Title = "Waiting", Text = "Click Where You Want The Point", Duration = 4,})
    waitforclick = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local point = Instance.new("Part")
            point.Name = "ExtraTpPoint"
            point.Size = Vector3.new(1, 1, 1)
            point.Position = game.Players.LocalPlayer:GetMouse().Hit.Position + Vector3.new(0, 3, 0)
            point.Anchored = true
            point.Color = Color3.new(1, 1, 1)
            point.CanCollide = false
            point.Parent = game.workspace
            local highlight = Instance.new("Highlight")
            highlight.Name = "Highlight"
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.Parent = point

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESPBillboard"
            billboard.Size = UDim2.new(0, 50, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 0, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = point

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0.25, 0)
            label.Position = UDim2.new(0, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(1, 0, 0)
            label.TextScaled = true
            label.Text = "Extra TP Point"
            label.Parent = billboard
            game.StarterGui:SetCore("SendNotification", {Title = "Extra Point Set", Text = "Extra TP Point Has Been Set", Duration = 4,})
            waitforclick:Disconnect()
        end
    end)
end)

ItemTeleportSection:NewButton("Delete Extra TP Point", "Makes Things Easier", function()
    game.workspace.ExtraTpPoint:Destroy()
end)

ItemTeleportSection:NewButton("TP To Extra TP Point", "Makes Things Easier", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.ExtraTpPoint.CFrame
end)

local Teleport = Window:NewTab("Teleport")
local TeleportSection = Teleport:NewSection("Novabay Surface")

TeleportSection:NewButton("Teleport To Your Plot", "Gets You Back To Your Own Plot", function()
    for _, v in pairs(game.workspace.Plots:GetChildren()) do
        if v:GetAttribute("Owner") == game.Players.LocalPlayer.Name then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:GetPivot() + Vector3.new(0, 50, 0)
        end
    end
end)

TeleportSection:NewDropdown("Teleport To A Plot", "Select A Plot To Teleport To", {"Plot1", "Plot2", "Plot3", "Plot4", "Plot5", "Plot6", "Plot7", "Plot8"}, function(currentOption)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Plots[currentOption]:GetPivot() + Vector3.new(0, 50, 0)
end)

TeleportSection:NewButton("RCS", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1256.64563, 29.9241428, -692.932495, 0.82996726, -1.64257941e-08, 0.557812095, -6.16139451e-09, 1, 3.86143491e-08, -0.557812095, -3.54855452e-08, 0.82996726)
end)

TeleportSection:NewButton("Land Agency", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1357.67212, 30.1888943, -755.337524, 0.987044275, -6.49681331e-09, 0.160448045, 5.53440982e-09, 1, 6.44511111e-09, -0.160448045, -5.47362511e-09, 0.987044275)
end)

TeleportSection:NewButton("Silver's Sellzone", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(943.082642, 29.9241428, -701.586121, 0.374673784, 2.47338772e-08, 0.927156687, -8.19141945e-08, 1, 6.42526077e-09, -0.927156687, -7.83546668e-08, 0.374673784)
end)

TeleportSection:NewButton("Craig's Dealership", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(724.298767, 27.2801323, -578.419617, -0.763801217, -1.81496318e-10, 0.645451546, 1.09337694e-08, 1, 1.32197719e-08, -0.645451546, 1.71544965e-08, -0.763801217)
end)

TeleportSection:NewButton("Tuckers's Sellzone", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1597.13538, 3.03214693, -1291.15503, -0.967363417, 9.06615316e-09, 0.253393054, -3.25229399e-09, 1, -4.81950977e-08, -0.253393054, -4.74462851e-08, -0.967363417)
end)

TeleportSection:NewButton("Nautic Finds", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1811.14453, 3.07790494, -1378.85925, -0.477113724, 2.87448216e-08, -0.878841579, 2.98036973e-08, 1, 1.65275189e-08, 0.878841579, -1.83072224e-08, -0.477113724)
end)

TeleportSection:NewButton("Coal's Furniture", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1167.94482, 101.417435, 547.736755, -0.304881752, -2.36347599e-08, 0.952390194, 1.76328676e-08, 1, 3.04609387e-08, -0.952390194, 2.60803557e-08, -0.304881752)
end)

TeleportSection:NewButton("Marble Valley", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-597.256165, 78.8054352, -205.099518, 0.68529731, 3.96321447e-08, 0.728263438, 1.169842e-08, 1, -6.54283028e-08, -0.728263438, 5.33573719e-08, 0.68529731)
end)

TeleportSection:NewButton("Jungle", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(267.584167, 213.789032, 3360.47266, -0.993389785, -1.30917777e-09, 0.11478997, -1.31624589e-09, 1, 1.42217713e-11, -0.11478997, -1.36964065e-10, -0.993389785)
end)

TeleportSection:NewButton("Stone Cradle", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(332.335632, -96.1293488, 3327.82251, -0.819238067, 9.33340871e-08, 0.573453546, 6.06714607e-08, 1, -7.60823866e-08, -0.573453546, -2.75373253e-08, -0.819238067)
end)

TeleportSection:NewButton("Murk's Shack", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1040.41345, 263.559662, 3911.44385, 0.701326549, 3.98459044e-08, 0.712840199, 2.25678196e-08, 1, -7.81006975e-08, -0.712840199, 7.08613399e-08, 0.701326549)
end)

TeleportSection:NewButton("Lighthouse", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(107.049889, 41.2018814, 4496.85449, 0.877245128, 5.85928905e-09, -0.480042756, 4.25550324e-11, 1, 1.22835324e-08, 0.480042756, -1.07960965e-08, 0.877245128)
end)

TeleportSection:NewButton("Deadzone", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1351.36743, 126.499702, 3352.66479, 0.655124962, 7.46671844e-08, -0.755520582, -6.27956437e-11, 1, 9.87743434e-08, 0.755520582, -6.46620961e-08, 0.655124962)
end)

TeleportSection:NewButton("Dell's Shipyard", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-183.687653, -0.158972234, 3402.5354, 0.694945872, 4.0519188e-09, -0.71906203, 7.0058789e-08, 1, 7.33441397e-08, 0.71906203, -1.01346821e-07, 0.694945872)
end)

TeleportSection:NewButton("Quarry", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1222.73584, 63.9331818, 1203.54248, -0.289810002, -1.00664856e-07, -0.957084179, 3.42863622e-08, 1, -1.15560766e-07, 0.957084179, -6.63056028e-08, -0.289810002)
end)

local TeleportSection = Teleport:NewSection("Nova's Cave System")

TeleportSection:NewButton("Layer 1", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1090.70959, -259.4599, -1.27028537, -0.943470776, 5.20665555e-09, 0.331455797, 1.56337547e-11, 1, -1.56639466e-08, -0.331455797, -1.47732937e-08, -0.943470776)
end)

TeleportSection:NewButton("Layer 2", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-202.812042, -542.75354, 1113.41064, -0.743081629, 4.2907633e-08, -0.669200778, -2.46761528e-10, 1, 6.43917346e-08, 0.669200778, 4.80134474e-08, -0.743081629)
end)

TeleportSection:NewButton("Wizard", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-611.555969, -490.884308, 1273.52441, 0.300665915, -6.58720651e-08, 0.95372951, 6.50896337e-10, 1, 6.88626756e-08, -0.95372951, -2.00838794e-08, 0.300665915)
end)

TeleportSection:NewButton("Lush Shop", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-587.613098, -531.653625, 1012.12292, -0.180295497, 8.45581161e-10, -0.983612478, -3.62682222e-08, 1, 7.50760876e-09, 0.983612478, 3.7027462e-08, -0.180295497)
end)

TeleportSection:NewButton("Overgrown Podium", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(32.9136276, -542.558655, 2356.78149, -0.946261704, -4.95140213e-08, -0.323401958, -1.89168308e-08, 1, -9.77537411e-08, 0.323401958, -8.6382876e-08, -0.946261704)
end)

TeleportSection:NewButton("Layer 3", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1861.79285, -649.085083, 2269.19727, -0.0303507987, -3.92086363e-08, 0.999539316, -3.36484091e-10, 1, 3.92164914e-08, -0.999539316, 8.53922766e-10, -0.0303507987)
end)

TeleportSection:NewButton("Layer 4 Castle", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3871.63672, -916.958496, 3786.55005, -0.962824643, -2.17193623e-08, 0.270127118, -7.4051596e-09, 1, 5.40097247e-08, -0.270127118, 5.00015602e-08, -0.962824643)
end)

local TeleportSection = Teleport:NewSection("Ocean")

TeleportSection:NewButton("Oil Rig", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2311.25024, 102.052567, 5369.77637, -0.82302916, 3.3572757e-08, 0.567999125, 6.41579634e-09, 1, -4.98105841e-08, -0.567999125, -3.73513949e-08, -0.82302916)
end)

local TeleportSection = Teleport:NewSection("Rosewell")

TeleportSection:NewButton("Araw's Automation", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5404.97363, 12.405036, -1371.56787, -0.677505314, 1.98969605e-08, 0.735517859, -3.69166531e-10, 1, -2.73916836e-08, -0.735517859, -1.88295406e-08, -0.677505314)
end)

TeleportSection:NewButton("Vi's Logics", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5148.03809, 59.7154121, -2829.74927, 0.997086287, 1.01241229e-08, -0.0762815848, -5.65205616e-09, 1, 5.88416533e-08, 0.0762815848, -5.82390598e-08, 0.997086287)
end)

TeleportSection:NewButton("Crash Site", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6235.18115, -19.7800884, -2161.48682, 0.217048958, 7.77799443e-08, 0.976160705, -4.60883349e-08, 1, -6.94317208e-08, -0.976160705, -2.99195406e-08, 0.217048958)
end)

TeleportSection:NewButton("The Aether", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7246.10645, 772.545898, -2932.43579, -0.995813429, -1.02048938e-08, 0.0914093107, -1.77125177e-08, 1, -8.13206995e-08, -0.0914093107, -8.25993283e-08, -0.995813429)
end)

TeleportSection:NewButton("Meteor Spawn", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7182.78125, 862.983521, -3443.74487, 0.526545763, -5.16568086e-08, -0.85014677, 3.03509431e-08, 1, -4.19641033e-08, 0.85014677, -3.70673359e-09, 0.526545763)
end)

TeleportSection:NewButton("Sarcophagus", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6752.37744, 3.05214691, -4164.75879, -0.926092327, -2.76346128e-08, 0.377296954, -1.01309343e-08, 1, 4.83768332e-08, -0.377296954, 4.09790459e-08, -0.926092327)
end)

TeleportSection:NewButton("Miners Hideout", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7939.84229, 166.520874, -3195.15796, 0.177075282, -1.18355494e-07, -0.984197319, -2.92915314e-09, 1, -1.20782872e-07, 0.984197319, 2.42705251e-08, 0.177075282)
end)

TeleportSection:NewButton("Scorching Valley", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7427.10205, -573.513672, -2902.70361, -0.237354517, -5.11855873e-08, -0.97142309, 5.49177148e-10, 1, -5.28255271e-08, 0.97142309, -1.30718609e-08, -0.237354517)
end)

TeleportSection:NewButton("Cursed Cave", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7136.00391, -711.760071, -2555.74048, -0.848859131, 2.4583505e-08, -0.528619111, -3.90032433e-08, 1, 1.09136735e-07, 0.528619111, 1.13259574e-07, -0.848859131)
end)

local TeleportSection = Teleport:NewSection("Rosewell Mines")

TeleportSection:NewButton("Rosewell Mines", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5567.48242, 12.1550512, -1719.29468, 0.828729749, -1.1890207e-08, 0.559648991, -1.54248525e-08, 1, 4.40869954e-08, -0.559648991, -4.51687079e-08, 0.828729749)
end)

TeleportSection:NewButton("Salt Cave", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5591.62695, -101.447861, -1500.83508, 0.186986253, -1.19104598e-07, 0.982362509, -1.77396302e-08, 1, 1.24619646e-07, -0.982362509, -4.07289065e-08, 0.186986253)
end)

TeleportSection:NewButton("Crystalized Abyss", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6636.28564, -592.950684, 837.279419, -0.999454379, -2.67363376e-08, 0.0330290608, -2.24679013e-08, 1, 1.29603876e-07, -0.0330290608, 1.28791072e-07, -0.999454379)
end)

local TeleportSection = Teleport:NewSection("Sakura")

TeleportSection:NewButton("Wise Man", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5779.73193, 28.4863071, 4557.07471, -0.551181614, 5.79461741e-08, 0.834385335, 2.82245782e-08, 1, -5.08030347e-08, -0.834385335, -4.45152404e-09, -0.551181614)
end)

TeleportSection:NewButton("Lunar Palace", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6238.42285, 125.116753, 4841.55957, -0.20284602, 8.37969552e-08, -0.979210675, 1.44558436e-08, 1, 8.25814581e-08, 0.979210675, 2.59600408e-09, -0.20284602)
end)

local TeleportSection = Teleport:NewSection("Sakura Cave")

TeleportSection:NewButton("Spore Cave", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5578.68262, -138.856171, 4953.22998, -0.989535689, 4.6880837e-09, -0.144288123, 7.41458983e-09, 1, -1.83585289e-08, 0.144288123, -1.9236257e-08, -0.989535689)
end)

TeleportSection:NewButton("Spore Axe Pedestal", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5720.22119, -192.427841, 5486.27979, -0.989061952, 1.48734571e-08, 0.147500634, -3.0506031e-10, 1, -1.0288214e-07, -0.147500634, -1.01801803e-07, -0.989061952)
end)

TeleportSection:NewButton("Odd River", "Teleport There", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5294.74072, -167.15329, 5591.10889, -0.644198716, -4.82375517e-09, -0.764858127, 2.47377496e-08, 1, -2.71420024e-08, 0.764858127, -3.64057122e-08, -0.644198716)
end)

local ESP = Window:NewTab("ESP")
local ESPSection = ESP:NewSection("ESP Things")

ESPSection:NewToggle("Ore ESP", "See Ore Names", function(state)
    if state then
        ore = true
        for _, v in pairs(game.workspace.WorldSpawn.Ores:GetChildren()) do
            if v.Name ~= "_Decoration" and v.Name ~= "Null" and v.Name ~= "Tall Grass" and v.Name ~= "Bush" and v.Name ~= "Flower Grass" then
                table.insert(oretable, v)
            end
        end
        oreconnect = game.workspace.WorldSpawn.Ores.ChildAdded:Connect(function(v)
            if v.Name ~= "_Decoration" and v.Name ~= "Null" and v.Name ~= "Tall Grass" and v.Name ~= "Bush" and v.Name ~= "Flower Grass" then
                table.insert(oretable, v)
            end
        end)
        while task.wait(0.1) do
            if ore then
                xpcall(function()
                    for i = #oretable, 1, -1 do
                        local v = oretable[i]
                        if not v or not v.Parent then
                            table.remove(oretable, i)
                        else
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
                                textLabel.TextColor3 = orecolor
                                textLabel.Text = v.Name
                                textLabel.Parent = billboard
                            elseif v:FindFirstChild("ESPBillboard") then
                                v.ESPBillboard.TextLabel.TextColor3 = orecolor
                            end
                        end
                    end
                end, function(err)
                    warn("Ore ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif ore == false then
                break
            end
        end
    else
        ore = false
        oreconnect:Disconnect()
        oretable = {}
        for _, v in pairs(game.workspace.WorldSpawn.Ores:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Tree ESP", "See Tree Names", function(state)
    if state then
        tree = true
        for _, v in pairs(game.workspace.WorldSpawn.Trees:GetChildren()) do
            if v.Name ~= "_Decoration" then
                table.insert(treetable, v)
            end
        end
        treeconnect = game.workspace.WorldSpawn.Trees.ChildAdded:Connect(function(v)
            if v.Name ~= "_Decoration" then
                table.insert(treetable, v)
            end
        end)
        while task.wait(0.1) do
            if tree then
                xpcall(function()
                    for i = #treetable, 1, -1 do
                        local v = treetable[i]
                        if not v or not v.Parent then
                            table.remove(treetable, i)
                        else
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
                                textLabel.TextColor3 = treecolor
                                textLabel.Text = v.Name
                                textLabel.Parent = billboard
                            elseif v:FindFirstChild("ESPBillboard") then
                                v.ESPBillboard.TextLabel.TextColor3 = treecolor
                            end
                        end
                    end
                end, function(err)
                    warn("Tree ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif tree == false then
                break
            end
        end
    else
        tree = false
        treeconnect:Disconnect()
        treetable = {}
        for _, v in pairs(game.workspace.WorldSpawn.Trees:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Player ESP", "See Player Names", function(state)
    if state then
        player = true
        for _, v in pairs(game.workspace.Live:GetChildren()) do
            table.insert(playertable, v)
        end
        playerconnect = game.workspace.Live.ChildAdded:Connect(function(v)
            table.insert(playertable, v)
        end)
        while task.wait(0.1) do
            if player then
                xpcall(function()
                    for i = #playertable, 1, -1 do
                        local v = playertable[i]
                        if not v or not v.Parent then
                            table.remove(playertable, i)
                        else
                            if v.Name ~= game.Players.LocalPlayer.Name then
                                if v:FindFirstChild("HumanoidRootPart") then
                                    if not v.HumanoidRootPart:FindFirstChild("ESPBillboard") then
                                        local billboard = Instance.new("BillboardGui")
                                        billboard.Name = "ESPBillboard"
                                        billboard.Size = UDim2.new(0, 50, 0, 50)
                                        billboard.StudsOffset = Vector3.new(0, 1, 0)
                                        billboard.AlwaysOnTop = true
                                        billboard.Parent = v.HumanoidRootPart

                                        local textLabel = Instance.new("TextLabel")
                                        textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                                        textLabel.Position = UDim2.new(0, 0, 0, 0)
                                        textLabel.BackgroundTransparency = 1
                                        textLabel.TextColor3 = playercolor
                                        textLabel.Text = v.Name
                                        textLabel.Parent = billboard
                                    elseif v.HumanoidRootPart:FindFirstChild("ESPBillboard") then
                                        v.HumanoidRootPart.ESPBillboard.TextLabel.TextColor3 = playercolor
                                    end
                                end
                            end
                        end
                    end
                end, function(err)
                    warn("Player ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif player == false then
                break
            end
        end
    else
        player = false
        playerconnect:Disconnect()
        playertable = {}
        for _, v in pairs(game.workspace.Live:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                if v.HumanoidRootPart:FindFirstChild("ESPBillboard") then
                    v.HumanoidRootPart.ESPBillboard:Destroy()
                end
            end
        end
    end
end)

ESPSection:NewToggle("Sea Monster ESP", "See Sea Monster Names", function(state)
    if state then
        sea = true
        for _, v in pairs(game.workspace.BigFish:GetChildren()) do
            table.insert(seatable, v)
        end
        seaconnect = game.workspace.BigFish.ChildAdded:Connect(function(v)
            table.insert(seatable, v)
        end)
        while task.wait(0.1) do
            if sea then
                xpcall(function()
                    for i = #seatable, 1, -1 do
                        local v = seatable[i]
                        if not v or not v.Parent then
                            table.remove(seatable, i)
                        else
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
                                textLabel.TextColor3 = seacolor
                                textLabel.Text = v.Name
                                textLabel.Parent = billboard
                            elseif v:FindFirstChild("ESPBillboard") then
                                v.ESPBillboard.TextLabel.TextColor3 = seacolor
                            end
                        end
                    end
                end, function(err)
                    warn("Sea Monster ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif sea == false then
                break
            end
        end
    else
        sea = false
        seaconnect:Disconnect()
        seatable = {}
        for _, v in pairs(game.workspace.BigFish:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Fishing Hotspot ESP", "See Hotspots Names", function(state)
    if state then
        spot = true
        for _, v in pairs(game.workspace.MouseIgnore.FishHotspots:GetChildren()) do
            table.insert(spottable, v)
        end
        spotconnect = game.workspace.MouseIgnore.FishHotspots.ChildAdded:Connect(function(v)
            table.insert(spottable, v)
        end)
        while task.wait(0.1) do
            if spot then
                xpcall(function()
                    for i = #spottable, 1, -1 do
                        local v = spottable[i]
                        if not v or not v.Parent then
                            table.remove(spottable, i)
                        else
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
                                textLabel.TextColor3 = spotcolor
                                textLabel.Text = v.Name .. " Luck: 50%"
                                textLabel.Parent = billboard
                            elseif v:FindFirstChild("ESPBillboard") then
                                v.ESPBillboard.TextLabel.TextColor3 = spotcolor
                            end
                        end
                    end
                end, function(err)
                    warn("Fishing Hotspot ESP Error")
                    warn(debug.traceback(err))
                end)
            elseif spot == false then
                break
            end
        end
    else
        spot = false
        spotconnect:Disconnect()
        spottable = {}
        for _, v in pairs(workspace.MouseIgnore.FishHotspots:GetChildren()) do
            if v:FindFirstChild("ESPBillboard") then
                v.ESPBillboard:Destroy()
            end
        end
    end
end)

ESPSection:NewToggle("Oil Spot ESP", "See Oil Spots", function(state)
    if state then
        oil = true
        while task.wait(0.1) do
            if oil then
                local oilspots = game:GetService("ReplicatedStorage").Events.OilUpdates.OilUpdatesRPC:InvokeServer()
                local currentIDs = {}
                for _, oilspot in pairs(oilspots) do
                    currentIDs[oilspot.id] = true
                    if not oilpartholder[oilspot.id] then
                        local part = Instance.new("Part")
                        part.Name = "OilESP_" .. oilspot.id
                        part.Size = Vector3.new(1, 1, 1)
                        part.Transparency = 1
                        part.Anchored = true
                        part.CanCollide = false
                        part.CanTouch = false
                        part.CanQuery = false
                        part.Position = oilspot.pos + Vector3.new(0, 260, 0)
                        part.Parent = workspace
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESPBillboard"
                        billboard.Size = UDim2.new(0, 50, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 1, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = part

                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                        textLabel.Position = UDim2.new(0, 0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = oilcolor
                        textLabel.Text = "Oil Spot"
                        textLabel.Parent = billboard
                        part:SetAttribute("SpotID", oilspot.id)
                        oilpartholder[oilspot.id] = part
                    end
                end
                for id, part in pairs(oilpartholder) do
                    if not currentIDs[id] then
                        if part then
                            part:Destroy()
                        end
                        oilpartholder[id] = nil
                    end
                end
                for _, v in pairs(game.workspace:GetChildren()) do
                    if string.find(string.lower(v.Name), "oilesp") then
                        if v:FindFirstChild("ESPBillboard") then
                            v.ESPBillboard.TextLabel.TextColor3 = oilcolor
                        end
                    end
                end
            elseif oil == false then
                break
            end
        end
    else
        oil = false
        for _, v in pairs(oilpartholder) do
            if v then
                v:Destroy()
            end
        end
        oilpartholder = {}
    end
end)

local ESPCustom = Window:NewTab("ESP Customization")
local ESPCustomSection = ESPCustom:NewSection("Change How ESP Looks")

ESPCustomSection:NewColorPicker("Ore Color", "Change Its Color", Color3.fromRGB(255,0,0), function(color)
    orecolor = color
end)

ESPCustomSection:NewColorPicker("Tree Color", "Change Its Color", Color3.fromRGB(0,0,255), function(color)
    treecolor = color
end)

ESPCustomSection:NewColorPicker("Player Color", "Change Its Color", Color3.fromRGB(0,255,0), function(color)
    playercolor = color
end)

ESPCustomSection:NewColorPicker("Sea Creature Color", "Change Its Color", Color3.fromRGB(0,255,0), function(color)
    seacolor = color
end)

ESPCustomSection:NewColorPicker("Fishing Hotspot Color", "Change Its Color", Color3.fromRGB(85,255,255), function(color)
    spotcolor = color
end)

ESPCustomSection:NewColorPicker("Oil Spot Color", "Change Its Color", Color3.fromRGB(85,255,255), function(color)
    oilcolor = color
end)

local Remover = Window:NewTab("Remover")
local RemoverSection = Remover:NewSection("Remove Stuff")

RemoverSection:NewButton("Remove Stone Cradle And Deadzone Walls", "Easily Move Out The Nightshade Or Weeping Soul", function()
    game.workspace.Map.Novabay.Terrain.Model:Destroy()
end)

RemoverSection:NewButton("Remove Sarcophagus Gate", "Easily Move In And Out", function()
    game.workspace.Map.Structures.Checkpoint.Gate:Destroy()
end)

local Visual = Window:NewTab("Visual")
local VisualSection = Visual:NewSection("Helps See Better")

VisualSection:NewToggle("FullBright", "Brighten The Game", function(state)
    if state then
        local lighting = game:GetService("Lighting")
        local properties = {ClockTime = 14, GlobalShadows = false, Ambient = Color3.fromRGB(255, 255, 255), Brightness = 10, OutdoorAmbient = Color3.fromRGB(255, 255, 255)}
        for i, v in pairs(properties) do
            lighting[i] = v
            lightingconnects[i] = lighting:GetPropertyChangedSignal(i):Connect(function()
                if lighting[i] ~= v then
                    lighting[i] = v
                end
            end)
        end
    else
        for _, v in pairs(lightingconnects) do
            v:Disconnect()
        end
        lightingconnects = {}
    end
end)

local Minigame = Window:NewTab("Minigames")
local MinigameSection = Minigame:NewSection("Semi-Risky Features But Should Be Fine")

MinigameSection:NewToggle("Always 100% Hit", "Hits A 100 Percent Strike", function(state)
    if state then
    waitforclickhit = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and (string.find(string.lower(v.Name), "pickaxe") or string.find(string.lower(v.Name), "axe")) then
                    if game.Players.LocalPlayer:GetMouse().Target.Parent.Name == "Hittable" then
                        task.spawn(function()
                            task.wait(0.1)
                            local randomNumber = 0.99 + math.random() * 0.01
                            local proper = tonumber(string.format("%.14f", randomNumber))
                            game.ReplicatedStorage.Events.Tools.Attack:FireServer({Alpha = proper, ResponseTime = proper + 0.1})
                            game.StarterGui:SetCore("SendNotification", {Title = "Hit", Text = "Alpha:" .. tostring(proper) .. " ResponseTime:" .. tostring(proper + 0.1), Duration = 4,})
                        end)
                    end
                end
            end
        end
    end)
    else
        waitforclickhit:Disconnect()
    end
end)

MinigameSection:NewToggle("Always 99% Hit", "Hits A 99 Percent Strike", function(state)
    if state then
    waitforclickhit2 = game.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and (string.find(string.lower(v.Name), "pickaxe") or string.find(string.lower(v.Name), "axe")) then
                    if game.Players.LocalPlayer:GetMouse().Target.Parent.Name == "Hittable" then
                        task.spawn(function()
                            task.wait(0.1)
                            local randomNumber = 0.98 + math.random() * 0.01
                            local proper = tonumber(string.format("%.14f", randomNumber))
                            game.ReplicatedStorage.Events.Tools.Attack:FireServer({Alpha = proper, ResponseTime = proper + 0.1})
                            game.StarterGui:SetCore("SendNotification", {Title = "Hit", Text = "Alpha:" .. tostring(proper) .. " ResponseTime:" .. tostring(proper + 0.1), Duration = 4,})
                        end)
                    end
                end
            end
        end
    end)
    else
        waitforclickhit2:Disconnect()
    end
end)

MinigameSection:NewButton("Catch Hooked Fish", "Starts Catching Fish On Rod", function()
    game:GetService("ReplicatedStorage").Events.Fish.ReelSessionHit:FireServer()
    task.wait(0.263)
    game:GetService("ReplicatedStorage").Events.Fish.ReelSessionHit:FireServer()
    task.wait(0.229)
    game:GetService("ReplicatedStorage").Events.Fish.ReelSessionHit:FireServer()
    task.wait(0.267)
    game:GetService("ReplicatedStorage").Events.Fish.ReelSessionHit:FireServer()
    task.wait(0.312)
    game:GetService("ReplicatedStorage").Events.Fish.ReelSessionHit:FireServer()
    task.wait(0.226)
    game:GetService("ReplicatedStorage").Events.Fish.ReelSessionHit:FireServer()
    task.wait(0.234)
    game:GetService("ReplicatedStorage").Events.Fish.ReelSessionHit:FireServer()
    task.wait(0.257)
    game:GetService("ReplicatedStorage").Events.Fish.ReelSessionHit:FireServer()
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)

local colors = {
    SchemeColor = Color3.fromRGB(0,255,255),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}
for theme, color in pairs(colors) do
    UISection:NewColorPicker(theme, "Change your "..theme, color, function(color3)
        Library:ChangeColor(theme, color3)
    end)
end
