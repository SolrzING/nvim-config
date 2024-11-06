-- autocompletar llaves/corchetes/parentesis
return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    
	config = function()
		local plugin_config = require("plugins.utilities.autopairs.config")
		plugin_config.setup()
	end,
}
