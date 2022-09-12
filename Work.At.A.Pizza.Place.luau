getgenv().spamJobs = false
getgenv().spamHorn = false
getgenv().floodSupplier = false
getgenv().spamOvens = false

local Workspace = game:GetService("Workspace")
local Remote = game:GetService("ReplicatedStorage").PlayerChannel
local HumanoidRootPart = game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

local Lib = loadstring(game:HttpGet("https://pastebin.com/raw/GCM3Zpzg",true))()
local Table = {}

local window = Lib:CreateWindow("Pizza Place")


window:Section("Troll")

window:Button("Inf Fire Extinguisher",function()
	game:GetService("Players").LocalPlayer.Character:BreakJoints()
	workspace.Extinguisher.Extinguisher.ClickDetector.Detector:FireServer()
end)

window:Toggle("Spam Jobs",{location = Table, flag = "jobToggle"},function()
	spamJobs = Table["jobToggle"]
end)

window:Toggle("Car Alarm",{location = Table, flag = "hornToggle"},function()
	spamHorn = Table["hornToggle"]
	if spamHorn == true then
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "Get in a car",
			Text = "You must be in a car\nor truck to work",
			Button1 = "Ok"
		})
	end
end)

window:Dropdown("Select Job",{location = Table, flag = "job", search = true, list = {"Cashier","Cook","Pizza Boxer","Delivery","Supplier","On Break"}},function()
	if (Table["job"] == "Cashier") then
		HumanoidRootPart.CFrame = Workspace.JobButtons["Cashier"].CFrame
	elseif Table["job"] == "Cook" then
		HumanoidRootPart.CFrame = Workspace.JobButtons["Cook"].CFrame
	elseif Table["job"] == "Pizza Boxer" then
		HumanoidRootPart.CFrame = Workspace.JobButtons["Pizza Boxer"].CFrame
	elseif Table["job"] == "Delivery" then
		HumanoidRootPart.CFrame = Workspace.JobButtons["Delivery"].CFrame
	elseif Table["job"] == "Supplier" then
		HumanoidRootPart.CFrame = Workspace.JobButtons["Supplier"].CFrame
	elseif Table["job"] == "On Break" then
		Remote:FireServer(unpack({[1] = "ChangeJob", [2] = "On Break"}))
	else
		print("No job matches:", Table["job"])
	end
end)


window:Section("Local Player")

window:Slider("Walk Speed",{location = Table, min = 16, max = 300, default = 16, precise = true, flag = "ws"},function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Table["ws"]
end)

window:Slider("Jump Power",{location = Table, min = 50, max = 1000, default = 50, precise = true, flag = "jp"},function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Table["jp"]
end)


window:Section("Misc")

window:Button("Open Treasure",function()
	firetouchinterest(HumanoidRootPart, Workspace.Island1.TreasureChest, 0)
	firetouchinterest(HumanoidRootPart, Workspace.Island1.TreasureChest, 1)
end)

window:Button("Krusty Krab",function()
	firetouchinterest(HumanoidRootPart, Workspace.KrustyKrab.TouchBlock, 0)
end)

window:Dropdown("Select Gender",{location = Table, flag = gender, search = true, list = {"Boy","Girl"}},function()
	if Table["gender"] == "Boy" then
		Remote:FireServer(unpack({[1] = "SetGender", [2] = "Boy"}))
	else
		Remote:FireServer(unpack({[1] = "SetGender", [2] = "Girl"}))
	end
end)

spawn(function()
	while wait() do
		if spamJobs == true then
			Remote:FireServer(unpack({[1] = "ChangeJob", [2] = "Cashier"}))
			wait()

			Remote:FireServer(unpack({[1] = "ChangeJob", [2] = "Cook"}))
			wait()

			Remote:FireServer(unpack({[1] = "ChangeJob", [2] = "Pizza Boxer"}))
			wait()

			Remote:FireServer(unpack({[1] = "ChangeJob", [2] = "Delivery"}))
			wait()

			Remote:FireServer(unpack({[1] = "ChangeJob", [2] = "Supplier"}))
			wait()

			Remote:FireServer(unpack({[1] = "ChangeJob", [2] = "On Break"}))
			wait()
		end
	end
end)

spawn(function()
	while wait() do
		if spamHorn == true then
			keypress(0x48)
			keyrelease(0x48)
		end
	end
end)
