local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local New = Fusion.New
local Cleanup = Fusion.Cleanup

local folder = New("Folder")({
	[Cleanup] = function()
		print("This folder was destroyed!")
	end,
})
