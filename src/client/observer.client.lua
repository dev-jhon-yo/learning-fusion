local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local Value = Fusion.Value
local Observer = Fusion.Observer

local health = Value(100)

-- This observer will watch `health` for changes:
local observer = Observer(health)

local disconnect = observer:onChange(function()
	print("The new value is: ", health:get())
end)

health:set(10)

--* disconnect the above handler after 5 seconds
task.wait(5)
disconnect()
