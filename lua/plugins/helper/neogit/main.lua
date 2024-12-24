return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",         -- required
		"sindrets/diffview.nvim",        -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua",              -- optional
		"echasnovski/mini.pick",         -- optional
	},
	config = function()
		local plugin_config = require("plugins.helper.neogit.config")
		plugin_config.setup()

		local plugin_keymaps = require("plugins.helper.neogit.keymaps")
		plugin_keymaps.setup()
	end
}
