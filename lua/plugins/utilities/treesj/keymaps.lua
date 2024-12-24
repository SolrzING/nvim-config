local M = {}

local keymap = require("function.keymap").keymap

function M.setup()
	keymap({ "n", }, "<leader>" .. "e", "", { desc = "Dividir/Unir codigo" } )

	keymap('n', '<leader>em', require('treesj').toggle, { desc = "Dividir/Unir codigo" } )
end

return M
