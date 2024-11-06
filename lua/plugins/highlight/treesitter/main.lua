return {
	"nvim-treesitter/nvim-treesitter",
	enabled=true,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",
	event = "VeryLazy",

	config = function()
		local plugin_config = require("plugins.highlight.treesitter.config")
		plugin_config.setup()
	end,
}
