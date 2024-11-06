return {
	"mfussenegger/nvim-dap",
	dependencies = {
		'theHamsta/nvim-dap-virtual-text',
		'mfussenegger/nvim-dap-python', -- for python
	},
	config = function ()
		local plugin_config = require("plugins.dap.dap.config")
		plugin_config.setup()

		local plugin_keymaps = require("plugins.dap.dap.keymaps")
		plugin_keymaps.setup()
	end
}
