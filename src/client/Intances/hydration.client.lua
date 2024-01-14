local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local Value = Fusion.Value
local Hydrate = Fusion.Hydrate

local showUI = Value(false)

local ui = Hydrate(StarterGui.Template:Clone())({
	Name = "MainGui",
	Enabled = showUI,
})

print(ui.Name) --> MainGui
print(ui.Enabled) --> false

showUI:set(true)
task.wait() -- important: changes are applied on the next frame!
print(ui.Enabled) --> true
