local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)

local Value = Fusion.Value

local health = Value(100) -- the Value will initially store a value of 100
print(health:get()) --> 100

health:set(25)
print(health:get()) --> 25
