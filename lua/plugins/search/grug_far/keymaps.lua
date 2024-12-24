local M = {}

local keymap = require("function.keymap").keymap

function M.setup()
	keymap({"n", "v"}, "<C-f>a", function ()
		require('grug-far').toggle_instance({ instanceName="grug_far_1", })
	end, { desc = "Buscar/Remplazar" } )
	keymap({"n", "v"}, "<C-f>f", function ()
		require('grug-far').toggle_instance({ instanceName="grug_far_1", prefills = { paths = vim.fn.expand("%") } })
	end, { desc = "Buscar/Remplazar - current file" } )
end

return M
