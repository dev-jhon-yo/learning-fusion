local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local Computed = Fusion.Computed

local function callDestroy(x)
	x:Destroy()
end

local brick = Computed(function()
	return Instance.new("Part")
end, callDestroy)

local instance = Computed(function()
	return Instance.new(className:get())
end, Fusion.cleanup)

local instance = Computed(function()
	return workspace:FindFirstChild(name:get())
end, Fusion.doNothing)

print(instance:get())
