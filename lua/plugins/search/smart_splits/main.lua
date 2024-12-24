return { 
	'mrjones2014/smart-splits.nvim',
	config = function ()
		local plugin_config = require("plugins.search.smart_splits.config")
		plugin_config.setup()

		local plugin_keymaps = require("plugins.search.smart_splits.keymaps")
		plugin_keymaps.setup()
	end,

}
