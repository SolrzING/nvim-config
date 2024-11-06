
return {
	"ahmedkhalf/project.nvim",
	enabled=true,
	config = function()
		local plugin_config = require("plugins.search.project.config")
		plugin_config.setup()
	end
}

