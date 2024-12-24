return {
	"hedyhli/outline.nvim",
	enabled=false,
	config = function()
		local plugin_config = require("plugins.helper.outline.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.helper.outline.keymaps")
		keymaps_config.setup()
	end,
}
