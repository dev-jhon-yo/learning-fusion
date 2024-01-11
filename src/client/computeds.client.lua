local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local Value = Fusion.Value
local Computed = Fusion.Computed

local number = Value(2)

local double = Computed(function()
	return number:get() * 2
end)

print(number:get(), "* 2 =", double:get()) --> 2 * 2 = 4

number:set(10)
print(number:get(), "* 2 =", double:get()) --> 10 * 2 = 20

number:set(-5)
print(number:get(), "* 2 =", double:get()) --> -5 * 2 = -10
