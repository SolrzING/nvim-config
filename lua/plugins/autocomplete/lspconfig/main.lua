return {
	"neovim/nvim-lspconfig",
	enabled=true,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		local plugin_config = require("plugins.autocomplete.lspconfig.config")
		plugin_config.setup()
	end,
}
