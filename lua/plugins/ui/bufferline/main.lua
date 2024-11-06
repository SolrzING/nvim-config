return {
	'akinsho/bufferline.nvim',
	enabled = true,
	version = "*",
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'famiu/bufdelete.nvim',
	},

	config = function()
		local plugin_config = require("plugins.ui.bufferline.config")
		plugin_config.setup()
	end
}
