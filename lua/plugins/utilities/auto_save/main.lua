return {
	"okuuva/auto-save.nvim",
	enabled=false,
	cmd = "ASToggle", -- opcional para carga diferida en comando
	event = { "InsertLeave", "TextChanged" }, -- opcional para carga diferida en eventos desencadenantes

	config = function()
		local plugin_config = require("plugins.utilities.auto_save.config")
		plugin_config.setup()
	end
}
