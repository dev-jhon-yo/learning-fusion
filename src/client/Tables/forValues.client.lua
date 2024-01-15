local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local ForValues = Fusion.ForValues
local Value = Fusion.Value
local New = Fusion.New

-- Basic Usage
local numbers = { 1, 2, 3, 4, 5 }
local doubled = ForValues(numbers, function(num)
	return num * 2
end)

print(doubled:get()) --> {2, 4, 6, 8, 10}

-- State Objects
local numbers = Value({})
local doubled = ForValues(numbers, function(num)
	return num * 2
end)

numbers:set({ 1, 2, 3, 4, 5 })
print(doubled:get()) --> {2, 4, 6, 8, 10}

numbers:set({ 5, 15, 25 })
print(doubled:get()) --> {10, 30, 50}

-- Cleanup Behaviour
local names = Value({ "Jodi", "Amber", "Umair" })
local textLabels = ForValues(
	names,
	-- processor
	function(name)
		local textLabel = New("TextLabel")({
			Text = name,
		})
		local uppercased = name:upper()
		-- `textLabel` will be included in the output table
		-- `uppercased` is not included, but still passed to the destructor
		return textLabel, uppercased
	end,
	-- destructor
	function(textLabel, uppercased)
		print("Destructor got uppercased:", uppercased)
		textLabel:Destroy()
	end
)

names:set({ "Amber", "Umair" }) --> Destructor got uppercased: JODI
