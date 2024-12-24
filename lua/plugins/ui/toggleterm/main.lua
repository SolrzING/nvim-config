return {
	'akinsho/toggleterm.nvim',
	enabled=false,
	version = "*",
	config = function()
		local plugin_config = require("plugins.ui.toggleterm.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.ui.toggleterm.keymaps")
		keymaps_config.setup()
	end,
}
