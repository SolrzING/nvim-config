return {
	"L3MON4D3/LuaSnip",
	enabled=true,
	version = "v2.*",
	config = function()
		local plugin_config = require("plugins.autocomplete.luasnip.config")
		plugin_config.setup()
	end,
}
