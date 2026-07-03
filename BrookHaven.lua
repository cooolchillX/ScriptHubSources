local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cooolchill_X GUI", "DarkTheme")

game.StarterGui:SetCore("SendNotification", {Title = "Loaded", Text = "Brook Haven", Duration = 4,})

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Casual Stuff")

MainSection:NewSlider("WalkSpeed", "Speed Up", 200, 16, function(s) -- 200 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("JumpPower", "Jump High", 200, 50, function(s) -- 200 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewButton("Infinite Yield", "Load It", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

--TROLL
local Troll = Window:NewTab("Troll")
local TrollSection = Troll:NewSection("Trolling Stuff")

TrollSection:NewButton("Kill Player Your Holding", "Kill The Player", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4.80150032, -308.765106, 86.7627106, 0.501104712, 0.133183151, -0.85507679, -1.59719937e-09, 0.988086402, 0.153900161, 0.865386665, -0.0771200955, 0.495134741)
end)

TrollSection:NewButton("Fake IP Logger", "Fake Logger", function()
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Cracking IP Address..." ,"All")
 
wait(3)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Getting [Testing] IP..." ,"All")
 
wait(2)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Loading... Please Wait!" ,"All")
 
 
wait(1)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Data Has Been Successfully Stolen" ,"All")
 
wait(2)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Successfully Got The IP..." ,"All")
 
wait(1)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("IP: Successfully Logged" ,"All")
 
wait(2)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Leaked IP: Copied Country, (Saved Notes) Pinned: Street" ,"All")
end)

local UI = Window:NewTab("UI Toggle")
local UISection = UI:NewSection("Show/Hide")

UISection:NewKeybind("Show/Hide GUI", "Toggle UI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)