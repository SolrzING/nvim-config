return {
	"folke/trouble.nvim",
	dependencies = {},
	enabled=true,
	config = function()
		local plugin_config = require("plugins.helper.trouble.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.helper.trouble.keymaps")
		keymaps_config.setup()
	end,
}
