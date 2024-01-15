local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local ForPairs = Fusion.ForPairs
local Value = Fusion.Value
local New = Fusion.New

-- Basic Usage
local itemColours = { shoes = "red", socks = "blue" }
local swapped = ForPairs(data, function(key, value)
	return value, key
end)

print(swapped:get()) --> {red = "shoes", blue = "socks"}

-- State Objects = ForValues/ForKeys

-- Cleanup Behavior
local watchedInstances = Value({
	[workspace.Part1] = "One",
	[workspace.Part2] = "Two",
	[workspace.Part3] = "Three",
})

local connectionSet = ForPairs(
	eventSet,
	-- processor
	function(instance, displayName)
		local metadata = { displayName = displayName, numChanges = 0 }
		local connection = instance.Changed:Connect(function()
			print("Instance", displayName, "was changed!")
			metadata.numChanges += 1
		end)
		return instance, connection, metadata
	end,
	-- destructor
	function(instance, connection, metadata)
		print("Removing", metadata.displayName, "after", metadata.numChanges, "changes")
		connection:Disconnect() -- don't forget we're overriding the default cleanup
	end
)

-- remove Part3 from the input table
-- this will run the destructor with Part3, its Changed event, and its metadata
watchedInstances:set({
	[workspace.Part1] = "One",
	[workspace.Part2] = "Two",
})
