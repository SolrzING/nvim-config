return {
	"folke/noice.nvim",
	enabled=true,
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		local plugin_config = require("plugins.ui.noice.config")
		plugin_config.setup()

		-- local keymaps_config = require("plugins.ui.noice.keymaps")
		-- keymaps_config.setup()
	end,
}
