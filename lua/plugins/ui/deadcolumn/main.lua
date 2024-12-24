-- deadcolumn: muestra una limea delimitadora en el texto
return {
	"Bekaboo/deadcolumn.nvim",
	-- dependencies = {},
	enabled=true,
	config = function()
		local plugin_config = require("plugins.ui.deadcolumn.config")
		plugin_config.setup()

		-- local keymaps_config = require("")
		-- keymaps_config.setup()
	end,
}
