return {
	"rcarriga/nvim-notify",
	enabled = true,

	config = function()
		local plugin_config = require("plugins.utilities.notify.config")
		plugin_config.setup()
	end
}
