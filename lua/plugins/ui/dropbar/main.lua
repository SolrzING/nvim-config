-- dropbar: winbar con drop-menu
return {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},
	enabled=true,
	config = function()
		-- local plugin_config = require("")
		-- plugin_config.setup()

		local keymaps_config = require("plugins.ui.dropbar.keymaps")
		keymaps_config.setup()
	end,
}
