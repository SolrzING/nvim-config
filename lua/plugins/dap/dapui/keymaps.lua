local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

local dapui = require("dapui")

function M.setup()
	keymap('n', "<leader>d", dapui.toggle(), extend('force', opts, { desc = "Toggle DAP" }))
end

return M
