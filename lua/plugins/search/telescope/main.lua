return {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    dependencies = {
        "nvim-lua/plenary.nvim", -- Prioridad principal
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}, -- Mejora de rendimiento
        "nvim-tree/nvim-web-devicons" -- Iconos
    },
	config = function()
		local telescope_config = require("plugins.search.telescope.config")
		telescope_config.setup()

		local telescope_keymaps = require("plugins.search.telescope.keymaps")
		telescope_keymaps.setup()
	end

}
