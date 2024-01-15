local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local New = Fusion.New
local Children = Fusion.Children

-- Returning Children

--- ALLOWED: You can return one value per component.
-- returns *one* array
local function Component()
	return {
		New("Frame")({}),
		New("Frame")({}),
		New("Frame")({}),
	}
end

--- NOT ALLOWED: Don't return multiple values straight from your function. Prefer to use an array instead.
-- returns *multiple* instances (not surrounded by curly braces!)
local function Component()
	return New("Frame")({}), New("Frame")({}), New("Frame")({})
end

--Parenting Components
local function PopUp(props)
	return New("Frame")({
		-- ... some other properties ...

		-- Since `props` is a table, and `[Children]` is a key, you can use it
		-- yourself as a key in `props`:
		[Children] = props[Children],
	})
end

local popUp = PopUp({
	[Children] = {
		Label({
			Text = "New item collected",
		}),
		ItemPreview({
			Item = Items.BRICK,
		}),
		Button({
			Text = "Add to inventory",
		}),
	},
})

local function PopUp(props)
	return New("Frame")({
		-- ... some other properties ...

		[Children] = {
			-- the component provides some children here
			New("UICorner")({
				CornerRadius = UDim.new(0, 8),
			}),

			-- include children from outside the component here
			props[Children],
		},
	})
end
