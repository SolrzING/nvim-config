-- hlsearch: auto remueve el highlight cuando se pulsa n
return {
	"nvimdev/hlsearch.nvim",
	-- dependencies = {},
	enabled=true,
	config = function()
		require('hlsearch').setup()

		-- local plugin_config = require("")
		-- plugin_config.setup()

		-- local keymaps_config = require("")
		-- keymaps_config.setup()
	end,
}
