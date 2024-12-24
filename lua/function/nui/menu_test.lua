local n = require("nui-components")

local renderer_bg = n.create_renderer({
	width = 49,
	height = 3,
	position = {
		row = "25%",
		col = "50%",
	},
})

local renderer = n.create_renderer({
	width = 45,
	height = 6,
	position = {
		row = "30%",
		col = "50%",
	},
})



local background = function()
	return n.paragraph({
		-- lines = "¿Deseas Guardar antes de salir?",
		-- align = "center",
		-- padding = {
		-- 	right = 6,
		-- 	left= 6
		-- },
		is_focusable = false,
		border_label = {
			text = "¿Deseas Guardar antes de salir?",
			align = "center",
		},
		border_style = "single",
	})
end


local button = function()
	return n.rows(
		-- n.columns(
		-- 	{ flex = 0 },
		-- 	n.paragraph({
		-- 		lines = "¿Deseas Guardar antes de salir?",
		-- 		align = "center",
		-- 		padding = {
		-- 			right = 6,
		-- 			left= 6
		-- 		},
		-- 		is_focusable = false,
		-- 		border_style = "solid",
		-- 	})
		-- ),
		n.columns(
			{ flex = 0 },
			n.button({
				label = "Si",
				padding = {
					right = 4,
					left= 4
				},
				border_style = "double",
			}),
			n.button({
				label = "No",
				padding = {
					right = 4,
					left= 4
				},
				border_style = "double",
			}),
			n.gap(3),
			n.button({
				label = "Cancelar",
				autofocus = true,
				padding = {
					right = 4,
					left= 4
				},
				border_style = "double",
			})
		)
	)
end

renderer_bg:render(background)
renderer:render(button)

renderer:on_unmount(function()
	renderer_bg:close()
end)
