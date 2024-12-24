return {
	"b0o/incline.nvim",
	event = 'VeryLazy',
	enabled=true,
	config = function()
		local plugin_config = require("plugins.ui.incline.config")
		plugin_config.setup()

		-- local keymaps_config = require("")
		-- keymaps_config.setup()
	end,
}
