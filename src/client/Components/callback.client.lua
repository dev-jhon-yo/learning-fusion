local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local New = Fusion.New
local OnEvent = Fusion.OnEvent

local function Button(props)
	return New("TextButton")({
		BackgroundColor3 = Color3.new(0.25, 0.5, 1),
		Position = props.Position,
		Size = props.Size,

		Text = props.Text,
		TextColor3 = Color3.new(1, 1, 1),

		[OnEvent("Activated")] = function()
			-- don't send clicks if the button is disabled
			if not props.Disabled:get() then
				props.OnClick()
			end
		end,
	})
end
