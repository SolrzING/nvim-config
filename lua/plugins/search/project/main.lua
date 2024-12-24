
return {
	"ahmedkhalf/project.nvim",
	enabled=true,
	config = function()
		local plugin_config = require("plugins.search.project.config")
		plugin_config.setup()

		local keymaps_config = require("plugins.search.project.keymaps")
		keymaps_config.setup()
	end
}
