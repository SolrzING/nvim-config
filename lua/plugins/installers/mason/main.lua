return {
	"williamboman/mason.nvim",
	dependencies = {"williamboman/mason-lspconfig.nvim"},
	
	config = function()
		local mason_config = require("plugins.installers.mason.config")
		mason_config.setup()
	end,
}