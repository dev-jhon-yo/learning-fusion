local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local New = Fusion.New
local OnEvent = Fusion.OnEvent

local button = New("TextButton")({
	[OnEvent("Activated")] = function(_, numClicks)
		print("The button was pressed", numClicks, "time(s)!")
	end,
})
