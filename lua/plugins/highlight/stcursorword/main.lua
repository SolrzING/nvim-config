-- Resaltado de palabras con el cursor
return {
	"sontungexpt/stcursorword",
	event = "VeryLazy",
	config = function ()
		local plugin_config = require("plugins.highlight.stcursorword.config")
		plugin_config.setup()
	end
}
