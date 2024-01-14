local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children

-- Makes a Folder, containing a part called JHON
local FirstExample: Folder = New("Folder")({
	Name = "FirstExample",
	Parent = workspace,
	[Children] = New("Part")({
		Name = "JHON",
		Color = Color3.new(1, 0, 0),
	}),
})

print(FirstExample.Name .. " Folder Created!")

-- Makes a Folder, containing parts called RED and GREEN
local SecondExample: Folder = New("Folder")({
	Name = "SecondExample",
	Parent = workspace,
	[Children] = {
		New("Part")({
			Name = "RED",
			Color = Color3.new(1, 0, 0),
		}),
		New("Part")({
			Name = "GREEN",
			Color = Color3.new(0, 1, 0),
		}),
	},
})

print(SecondExample.Name .. " Folder Created!")
