return {
	"nvim-focus/focus.nvim",
	config = function ()
		local plugin_config = require("plugins.search.focus.config")
		plugin_config.setup()

		local plugin_keymaps = require("plugins.search.focus.keymaps")
		plugin_keymaps.setup()
	end,
}
