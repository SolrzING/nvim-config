local M = {}

local keymap = require("function.keymap").keymap

function M.setup()
	keymap({ "n", "v" }, "<C-f>e", ":MurenToggle<CR>", { desc = "Buscar/remplazar muren" })
end

return M
