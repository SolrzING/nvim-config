return {
	"folke/persistence.nvim",
	-- event = "BufReadPre",
	-- dependencies = {},
	enabled=true,
	config = function()
		local plugin_config = require("plugins.utilities.persistence.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.utilities.persistence.keymaps")
		keymaps_config.setup()
	end,
}
