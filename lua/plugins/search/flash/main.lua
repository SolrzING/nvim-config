return {
	"folke/flash.nvim",
	event = "VeryLazy",
	enabled=true,
	---@type Flash.Config	
	config = function()
		local plugin_config = require("plugins.search.flash.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.search.flash.keymaps")
		keymaps_config.setup()
	end,
}
