local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local Value = Fusion.Value
local New = Fusion.New
local Out = Fusion.Out

local name = Value()

local thing = New("Part")({
	[Out("Name")] = name,
})

print(name:get()) --> Part

thing.Name = "Jimmy"
print(name:get()) --> Jimmy

--[Two-Way Binding]--

local otherName = Value()

local thing = New("Part")({
	Name = otherName -- When `name` changes, set `thing.Name`
	[Out("Name")] = otherName -- When `thing.Name` changes, set `name`
})

print(thing.Name, otherName:get()) --> Part Part
name:set("NewName")
task.wait()
print(thing.Name, otherName:get()) --> NewName NewName
