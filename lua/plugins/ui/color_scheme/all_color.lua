local color_theme = {
	main = {}
}

-- Función para obtener colores del esquema actual
local function get_colors()
	local groups = {
		bg = "Todo",
		fg = "Fg",
		
		agua = "Aqua",
		black = "Todo",
		blue = "Blue",
		cyan = "MiniIconsCyan",
		gray = "Comment",
		green = "Green",
		orange = "Orange",
		purple = "Purple",
		red = "Red",
		white = "Fg",
		yellow = "Yellow",

		msgerror = "ErrorMsg",
		msgwarning = "WarningMsg",
		msginfo = "InfoFloat",
		msghint = "Purple",
	}

	for name, group in pairs(groups) do
		local hl = vim.api.nvim_get_hl_by_name(group, true)
		if hl.foreground then
			color_theme.main[name] = string.format("#%06x", hl.foreground)
		end
	end
end

get_colors()

return color_theme
