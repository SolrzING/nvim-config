return {
	"hrsh7th/nvim-cmp",
	enabled=true,
	event = "InsertEnter",
	dependencies = {
		"neovim/nvim-lspconfig",
		--"hrsh7th/cmp-nvim-lua",

		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",     --autocompletado para los directorios/archivos
		"hrsh7th/cmp-nvim-lsp", --conexion para el servidor lsp
		"hrsh7th/cmp-cmdline",  --autocompletado para los comandos
		"hrsh7th/cmp-git",
		"hrsh7th/cmp-nvim-lsp-signature-help", --mostrar firmas de fuciones

		"L3MON4D3/LuaSnip", --motor de snipper
		"saadparwaiz1/cmp_luasnip",

		"windwp/nvim-autopairs", --para cerrar las llaves: () {} []
		"onsails/lspkind.nvim", --ICONOS en el AUTOCOMPLETADO
	},

	config = function()
		local plugin_config = require("plugins.autocomplete.cmp.config")
		plugin_config.setup()
	end,
}
