return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
	config = function()
		local plugin_config = require("plugins.helper.nvim_surround.config")
		plugin_config.setup()

		-- local plugin_keymaps = require("plugins.helper.nvim_surround.keymaps")
		-- plugin_keymaps.setup()
	end
}
