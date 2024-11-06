-- Autocompletado a las parentesis/corchetes
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",

	config = function ()
		local ibl_config = require("plugins.utilities.indent_blackline.config")
		ibl_config.setup()
	end
}
