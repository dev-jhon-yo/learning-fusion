local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local ForKeys = Fusion.ForKeys
local Value = Fusion.Value
local New = Fusion.New

-- Basic Usage
local data = { red = "foo", blue = "bar" }
local renamed = ForKeys(data, function(key)
	return string.upper(key)
end)

print(renamed:get()) --> {RED = "foo", BLUE = "bar"}

-- State Objects
local playerSet = Value({})
local userIdSet = ForKeys(playerSet, function(player)
	return player.UserId
end)

playerSet:set({ [Players.Elttob] = true })
print(userIdSet:get()) --> {[1670764] = true}

playerSet:set({ [Players.boatbomber] = true, [Players.EgoMoose] = true })
print(userIdSet:get()) --> {[33655127] = true, [2155311] = true}

--Cleanup Behavior
local eventSet = Value({
	[RunService.RenderStepped] = true,
	[RunService.Heartbeat] = true,
})

local connectionSet = ForKeys(
	eventSet,
	-- processor
	function(event)
		local eventName = tostring(event)
		local connection = event:Connect(function(...)
			print(eventName, "fired with arguments:", ...)
		end)
		return connection
	end,
	-- destructor
	function(connection)
		print("Disconnecting the event!")
		connection:Disconnect() -- don't forget we're overriding the default cleanup
	end
)

-- remove Heartbeat from the event set
-- this will run the destructor with the Heartbeat connection
eventSet:set({ [RunService.RenderStepped] = true }) --> Disconnecting the event!
