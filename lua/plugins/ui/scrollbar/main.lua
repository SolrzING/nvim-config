return {
	"petertriho/nvim-scrollbar",
	dependencies = "kevinhwang91/nvim-hlslens",
	config = function ()
		local plugin_config = require("plugins.ui.scrollbar.config")
		plugin_config.setup()
	end
}
