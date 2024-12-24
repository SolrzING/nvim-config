return {
	"L3MON4D3/LuaSnip",
	enabled=true,
	version = "v2.*",
	config = function()
		local plugin_config = require("plugins.helper.luasnip.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.helper.luasnip.keymaps")
		keymaps_config.setup()

		local snippet_config = require("plugins.helper.luasnip.snippet")
		snippet_config.setup()
	end,
}
