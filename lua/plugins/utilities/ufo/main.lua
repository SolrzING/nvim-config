-- Colapsar las lineas
return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	config = function ()
		local plugin_config = require("plugins.utilities.ufo.config")
		plugin_config.setup()

		local plugin_keymaps = require("plugins.utilities.ufo.keymaps")
		plugin_keymaps.setup()
	end,
}
