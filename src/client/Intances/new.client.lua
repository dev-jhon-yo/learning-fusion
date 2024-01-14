local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local New = Fusion.New

local instance = New("Part")({
	Name = "JHON",
	Parent = workspace,
	Color = Color3.new(1, 0, 0),
})

print(instance.Name)
