--MINIMAPA
return {
	'gorbit99/codewindow.nvim',
	config = function()
		local plugin_config = require("plugins.ui.codewindow.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.ui.codewindow.keymaps")
		keymaps_config.setup()
	end,
}
