local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local Tween = Fusion.Tween

-- Basic Usage
local goal = Value(0)
local style = TweenInfo.new(0.5, Enum.EasingStyle.Quad)
local animated = Tween(target, style)

local goalPosition = Value(UDim2.new(0.5, 0, 0, 0))
local animated = Tween(target, TweenInfo.new(0.5, Enum.EasingStyle.Quad))
