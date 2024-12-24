-- neocomposer: manejo de macros
return {
	"ecthelionvi/NeoComposer.nvim",
	dependencies = { "kkharji/sqlite.lua" },
	enabled=true,
	config = function()
		local plugin_config = require("plugins.utilities.neocomposer.config")
		plugin_config.setup()

		-- local keymaps_config = require("")
		-- keymaps_config.setup()
	end,
}
