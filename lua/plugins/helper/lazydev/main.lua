return {
	"folke/lazydev.nvim",
	dependencies = {},
	ft = "lua",
	enabled=true,
	config = function()
		local plugin_config = require("plugins.helper.lazydev.config")
		plugin_config.setup()

		-- local keymaps_config = require("")
		-- keymaps_config.setup()
	end,
}
