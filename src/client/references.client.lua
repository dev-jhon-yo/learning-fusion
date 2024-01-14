local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local New = Fusion.New
local Ref = Fusion.Ref
local Value = Fusion.Value

local myPart = Value()

New("Part")({
	[Ref] = myPart,
})

print(myPart:get()) --> Part

myPart:get():Destroy()

print(myPart:get()) --> nil
