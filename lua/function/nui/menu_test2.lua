local Layout = require("nui.layout")
local Popup = require("nui.popup")

local title = Popup({ border = "single" })
local bottom_1 = Popup({ border = "double" })
local bottom_2 = Popup({ border = "double" })
local bottom_3 = Popup({ border = "double" })

local layout = Layout(
	{
		position = {
			row = "20%",
			col = "50%",
		},
		relative = "editor",
		size = {
			width = 49,
			height = 3,
		},
	},
	Layout.Box({
		Layout.Box(title, {
			size = "40%",
		}),
		Layout.Box(
			{
				Layout.Box(bottom_1, { size = "28%" }),
				Layout.Box(bottom_2, { size = "28%" }),
				Layout.Box(bottom_3, { size = "30%" }),
			},
			{
				dir = "row",
				size = "60%",
			}
		),
	},
	{
		dir = "col",
	})
)

layout:mount()
