return {
	"lewis6991/gitsigns.nvim",
	enabled=true,
	config = function()
		local plugin_config = require("plugins.autocomplete.gitsigns.config")
		plugin_config.setup()

		local plugin_keymaps = require("plugins.autocomplete.gitsigns.keymaps")
		plugin_keymaps.setup()
	end
}
