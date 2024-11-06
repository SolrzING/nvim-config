local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

function M.setup()
	keymap({ "n", "v" }, "<C-f>", ":MurenToggle<CR>", extend('force', opts, { desc = "Buscar/remplazar" }))
end

return M
