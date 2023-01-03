local Noti = loadstring(game:HttpGet "https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/StrikeUiLib.txt")()

local ui = Instance.new("ScreenGui")
ui.Name = "ui"
ui.Parent = game.CoreGui
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local KeyFrame = Instance.new("Frame")
local KeyBox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local Check = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Leave = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UIStroke_2 = Instance.new("UIStroke")
local Discordlink = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UIStroke_3 = Instance.new("UIStroke")

local HideFrame = Instance.new("Frame")

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

function Ripple(Object)
	spawn(function()
		local Circle = Instance.new("ImageLabel")
		Circle.Parent = Object
		Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Circle.BackgroundTransparency = 1.000
		Circle.ZIndex = 10
		Circle.Image = "rbxassetid://266543268"
		Circle.ImageColor3 = Color3.fromRGB(210, 210, 210)
		Circle.ImageTransparency = 0.8
		Circle.Position = UDim2.new(0, Mouse.X - Circle.AbsolutePosition.X, 0, Mouse.Y - Circle.AbsolutePosition.Y)
		local Size = Object.AbsoluteSize.X
		TweenService:Create(Circle, TweenInfo.new(0.5),
			{ Position = UDim2.fromScale(math.clamp(Mouse.X - Object.AbsolutePosition.X, 0, Object.AbsoluteSize.X) /
				Object.AbsoluteSize.X, Object,
				math.clamp(Mouse.Y - Object.AbsolutePosition.Y, 0, Object.AbsoluteSize.Y) / Object.AbsoluteSize.Y) -
				UDim2.fromOffset(Size / 2, Size / 2), ImageTransparency = 1, Size = UDim2.fromOffset(Size, Size) }):Play()
		spawn(function()
			wait(0.5)
			Circle:Destroy()
		end)
	end)
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
		UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y
		)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

Main.Name = "Main"
Main.Parent = ui
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Main.Position = UDim2.new(0.5, 0, 0.457407415, 0)
Main.Size = UDim2.new(0, 400, 0, 181)

HideFrame.Name = "Hide"
HideFrame.Parent = Main
HideFrame.BackgroundColor3 = Color3.fromRGB(21, 0, 255)
HideFrame.BorderSizePixel = 0
HideFrame.ClipsDescendants = true
HideFrame.Position = UDim2.new(0, 0, 0, 0)
HideFrame.Size = UDim2.new(1, 0, 1, 0)
HideFrame.ZIndex = 100
TweenService:Create(HideFrame, TweenInfo.new(0.5), { BackgroundTransparency = 0 }):Play()
wait(0.5)
TweenService:Create(HideFrame, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()

TopBar.Name = "TopBar"
TopBar.Parent = Main
TopBar.AnchorPoint = Vector2.new(1, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 1.000
TopBar.Position = UDim2.new(1, 0, 0, 0)
TopBar.Size = UDim2.new(0, 400, 0, 35)

MakeDraggable(TopBar, Main)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.0425000004, 0, 0, 0)
Title.Size = UDim2.new(0, 383, 0, 35)
Title.Font = Enum.Font.GothamMedium
Title.Text = "Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000
Title.TextTransparency = 0.730
Title.TextXAlignment = Enum.TextXAlignment.Left

KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = Main
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
KeyFrame.BackgroundTransparency = 0.700
KeyFrame.Position = UDim2.new(0.5, 0, 0.5, 17)
KeyFrame.Size = UDim2.new(0, 360, 0, 45)

KeyBox.Name = "KeyBox"
KeyBox.Parent = KeyFrame
KeyBox.AnchorPoint = Vector2.new(0.5, 0.5)
KeyBox.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
KeyBox.BackgroundTransparency = 1.000
KeyBox.BorderSizePixel = 0
KeyBox.Position = UDim2.new(0.5, 0, 0.5, 0)
KeyBox.Size = UDim2.new(0, 360, 0, 26)
KeyBox.Font = Enum.Font.SourceSans
KeyBox.PlaceholderText = "Key Here"
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(202, 202, 202)
KeyBox.TextScaled = true
KeyBox.TextSize = 14.000
KeyBox.TextWrapped = true

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = KeyFrame

TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0, 0, 0.167999998, 6)
TextLabel.Size = UDim2.new(0, 400, 0, 50)
TextLabel.Font = Enum.Font.GothamMedium
TextLabel.Text = "Drible Hub"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16.000

Check.Name = "Check"
Check.Parent = Main
Check.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Check.BackgroundTransparency = 0.450
Check.Position = UDim2.new(0.745000005, 0, 0.643999994, 23)
Check.Size = UDim2.new(0, 82, 0, 32)
Check.AutoButtonColor = false
Check.Font = Enum.Font.Gotham
Check.Text = "Check"
Check.TextColor3 = Color3.fromRGB(255, 255, 255)
Check.TextSize = 14.000
Check.ClipsDescendants = true

--key valid
Check.MouseButton1Click:Connect(function()
	local is_key_present = isfile("Drible.txt")
	if is_key_present == true then
		if KeyBox.Text == game:HttpGet("https://1.kelprepl.repl.co/verify/Drible?verify_key=" .. KeyBox.Text) then
			appendfile("Drible.txt", KeyBox.Text)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/DribleHub/main/GameChecker.lua"))()
			Noti:Notif({ Name = "Sucefful", Content = "Key Valid", Time = 5,
				Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
					game.Players.LocalPlayer.UserId .. "&width=420&height=420&format=png" })
			Main:TweenPosition(UDim2.new(0.25, 0, -1.5, 0), "In", "Quint", 0.5, true)
			wait(0.51)
			KeyUI:Destroy()
		else
			appendfile("Drible.txt", KeyBox.Text)
			Noti:Notif({ Name = "Warning", Content = "Key Wrong", Time = 5,
				Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
					game.Players.LocalPlayer.UserId .. "&width=420&height=420&format=png" })
			wait(0.5)
		end
	else
		if KeyBox.Text == game:HttpGet("https://1.kelprepl.repl.co/verify/Drible?verify_key=" .. KeyBox.Text) then
			writefile("Drible.txt", KeyBox.Text)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/DribleHub/main/GameChecker.lua"))()
			Noti:Notif({ Name = "Sucefful", Content = "Key Valid", Time = 5,
				Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
					game.Players.LocalPlayer.UserId .. "&width=420&height=420&format=png" })
			Main:TweenPosition(UDim2.new(0.25, 0, -1.5, 0), "In", "Quint", 0.5, true)
			wait(0.51)
			KeyUI:Destroy()
		else
			Noti:Notif({ Name = "Warning", Content = "Key Wrong", Time = 5,
				Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
					game.Players.LocalPlayer.UserId .. "&width=420&height=420&format=png" })
			wait(0.5)
		end
	end

end)


UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = Check

UIStroke.Parent = Check
UIStroke.Color = Color3.fromRGB(35, 35, 35)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

Leave.Name = "Leave"
Leave.Parent = Main
Leave.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
Leave.BackgroundTransparency = 0.850
Leave.Position = UDim2.new(0.517499983, 2, 0.643999994, 23)
Leave.Size = UDim2.new(0, 82, 0, 32)
Leave.AutoButtonColor = false
Leave.Font = Enum.Font.Gotham
Leave.Text = "Leave"
Leave.TextColor3 = Color3.fromRGB(255, 0, 4)
Leave.TextSize = 14.000
Leave.TextTransparency = 0.320
Leave.ClipsDescendants = true
Leave.MouseEnter:Connect(function()
	TweenService:Create(Leave, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 0.8 }):Play()
end)
Leave.MouseLeave:Connect(function()
	TweenService:Create(Leave, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
end)
Leave.MouseButton1Click:Connect(function()
	Main.Visible = false
end)


UICorner_3.CornerRadius = UDim.new(0, 5)
UICorner_3.Parent = Leave

UIStroke_2.Parent = Leave
UIStroke_2.Color = Color3.fromRGB(255, 0, 4)
UIStroke_2.Transparency = 0.700
UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

Discordlink.Name = "Discordlink"
Discordlink.Parent = Main
Discordlink.BackgroundColor3 = Color3.fromRGB(21, 0, 255)
Discordlink.BackgroundTransparency = 1.000
Discordlink.Position = UDim2.new(0.0449999869, 2, 0.643999994, 23)
Discordlink.Size = UDim2.new(0, 82, 0, 32)
Discordlink.AutoButtonColor = false
Discordlink.Font = Enum.Font.Gotham
Discordlink.Text = "Discord"
Discordlink.TextColor3 = Color3.fromRGB(30, 0, 255)
Discordlink.TextSize = 14.000
Discordlink.ClipsDescendants = true
Discordlink.MouseEnter:Connect(function()
	TweenService:Create(Discordlink, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 0.8 }):Play()
end)
Discordlink.MouseLeave:Connect(function()
	TweenService:Create(Discordlink, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
end)
Discordlink.MouseButton1Click:Connect(function()
	Noti:Notif({ Name = "Copied into clipboard!", Content = "The invite is now in your clipboard!", Time = 5,
		Icon = "http://www.roblox.com/asset/?id=10226844105" })
	setclipboard("https://discord.gg/Pqh5cPh9R5")
end)
UICorner_4.CornerRadius = UDim.new(0, 5)
UICorner_4.Parent = Discordlink

UIStroke_3.Parent = Discordlink
UIStroke_3.Color = Color3.fromRGB(0, 0, 255)
UIStroke_3.Transparency = 0.700
UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local is_key_present = isfile("Drible.txt");
if is_key_present == true then
	local kery = readfile("Drible.txt");
	local onl_key = game:HttpGet("https://1.kelprepl.repl.co/verify/Drible?verify_key=" .. kery)
	if kery == onl_key then
		Noti:Notif({ Name = "Sucefful", Content = "Key Valid Lets Start", Time = 5,
			Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
				game.Players.LocalPlayer.UserId .. "&width=420&height=420&format=png" })
		loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/DribleHub/main/GameChecker.lua"))()
		Main:TweenPosition(UDim2.new(0.25, 0, -1.5, 0), "In", "Quint", 0.5, true)
		wait(0.51)
		KeyUI:Destroy()
	else
		Noti:Notif({ Name = "Warning", Content = "Key Invalid", Time = 5,
			Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
				game.Players.LocalPlayer.UserId .. "&width=420&height=420&format=png" })
	end
end
