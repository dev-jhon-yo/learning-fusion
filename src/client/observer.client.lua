local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local Value = Fusion.Value
local Observer = Fusion.Observer

local health = Value(100)
