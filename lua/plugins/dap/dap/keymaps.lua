local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

local dap = require("dap")
local dapui = require("dapui")

function M.setup()
	keymap('n', '<Leader>dt', function() dap.toggle_breakpoint() end, extend('force', opts, { desc = "Toggle DAP" }))
	keymap('n', '<Leader>dc', function() dap.continue() end, extend('force', opts, { desc = "Continue DAP" }))
	keymap('n', '<Leader>du', function () dapui.toggle() end, extend('force', opts, { desc = "Toggle DAP UI" }))
end

return M
