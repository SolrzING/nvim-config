local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

function M.setup()
	-- keymap({ "n", "v" }, "<leader>+", ":command<CR>", extend('force', opts, { desc = "Description" }))
	keymap({ "n", "v" }, "<leader>gi", function () require('neogit').open() end, extend('force', opts, { desc = "Description" }))	
end

return M
