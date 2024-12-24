-- sos: auto-guardado
return {
	"tmillr/sos.nvim",
	dependencies = {},
	enabled=true,
	config = function()
		local plugin_config = require("plugins.utilities.sos.config")
		plugin_config.setup()

		-- local keymaps_config = require("")
		-- keymaps_config.setup()
	end,
}
