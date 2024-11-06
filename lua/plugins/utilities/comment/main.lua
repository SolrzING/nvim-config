return {
	"numToStr/Comment.nvim",
	lazy = false,

	config = function()
		local plugin_config = require("plugins.utilities.comment.config")
		plugin_config.setup()
	end,
}
