return {
	"freddiehaddad/feline.nvim",
	enabled = true,

	config = function()
		local plugin_config = require("plugins.ui.feline.config")
		plugin_config.setup()
	end
}
