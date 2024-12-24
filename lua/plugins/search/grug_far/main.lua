return {
	"MagicDuck/grug-far.nvim",
	dependencies = {
		"BurntSushi/ripgrep",
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons",
	},
	enabled=true,
	config = function()
		local plugin_config = require("plugins.search.grug_far.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.search.grug_far.keymaps")
		keymaps_config.setup()
	end,
}
