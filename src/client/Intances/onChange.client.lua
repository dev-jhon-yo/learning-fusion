local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local New = Fusion.New
local OnChange = Fusion.OnChange

local input = New("TextBox")({
	[OnChange("Text")] = function(newText)
		print("You Typed:", newText)
	end,
})
