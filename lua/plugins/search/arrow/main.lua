return {
	"otavioschwanck/arrow.nvim",
	config = function()
		local plugin_config = require("plugins.search.arrow.config")
		plugin_config.setup()
	end
}
