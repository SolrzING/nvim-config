local M = {}

local keymap = require("function.keymap").keymap

local dap = require("dap")
local dapui = require("dapui")

local plugin_key = "d"



function M.setup()
	keymap({ "n", }, "<leader>" .. plugin_key, "", { desc = "DAP" } )

	keymap('n', '<Leader>' .. plugin_key ..'t', function() dap.toggle_breakpoint() end, { desc = "Toggle DAP" })
	keymap('n', '<Leader>' .. plugin_key ..'c', function() dap.continue() end, { desc = "Continue DAP" })
	keymap('n', '<Leader>' .. plugin_key ..'u', function () dapui.toggle() end, { desc = "Toggle DAP UI" })
end

return M
