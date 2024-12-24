return {
	"natecraddock/workspaces.nvim",
	-- dependencies = {},
	enabled=false,
	config = function()
		local plugin_config = require("plugins.search.workspaces.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.search.workspaces.keymaps")
		keymaps_config.setup()
	end,
}
