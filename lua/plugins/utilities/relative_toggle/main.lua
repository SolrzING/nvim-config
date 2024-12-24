-- relative_toggle: cambia automaticamente entre numeros relativos de las lineas y numeros absolutos de las lineas
return {
	"cpea2506/relative-toggle.nvim",
	dependencies = {},
	enabled=true,
	config = function()
		local plugin_config = require("plugins.utilities.relative_toggle.config")
		plugin_config.setup()

		-- local keymaps_config = require("")
		-- keymaps_config.setup()
	end,
}
