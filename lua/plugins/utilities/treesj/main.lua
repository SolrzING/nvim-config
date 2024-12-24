return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	config = function()
		local plugin_config = require("plugins.utilities.treesj.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.utilities.treesj.keymaps")
		keymaps_config.setup()
	end,
}
