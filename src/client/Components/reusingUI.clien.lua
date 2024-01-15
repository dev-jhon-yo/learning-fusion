local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local New = Fusion.New
local Children = Fusion.Children

-- Basic Usage
local function Button(props)
	return New("TextButton")({
		BackgroundColor3 = Color3.new(0, 0.25, 1),
		Position = props.Position,
		AnchorPoint = props.AnchorPoint,
		Size = props.Size,
		LayoutOrder = props.LayoutOrder,

		Text = props.ButtonText,
		TextSize = 28,
		TextColor3 = Color3.new(1, 1, 1),

		[Children] = UICorner({ CornerRadius = UDim2.new(0, 8) }),
	})
end

-- this is just a regular Lua function call!
local helloBtn = Button({
	ButtonText = "Hello",
	Size = UDim2.fromOffset(200, 50),
})

helloBtn.Parent = Players.LocalPlayer.PlayerGui.ScreenGui
