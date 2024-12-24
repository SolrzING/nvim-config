--Buscar y remplazar
return {
	"AckslD/muren.nvim",
	enabled=true,
	config = function ()
		local plugin_config = require("plugins.search.muren.config")
		plugin_config.setup()

		local plugin_keymaps = require("plugins.search.muren.keymaps")
		plugin_keymaps.setup()
	end
}
