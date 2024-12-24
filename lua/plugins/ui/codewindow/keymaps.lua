local M = {}

local keymap = require("function.keymap").keymap

local codewindow = require('codewindow')
local plugin_key = "<Tab>"

function M.setup()
	keymap({ "n", }, "<leader>" .. plugin_key, "", { desc = "Minimapa" })
	-- keymap('n', '<leader>' .. plugin_key .. 'o', codewindow.open_minimap, { desc = "Abrir el minimapa" })
	keymap('n', '<leader>' .. plugin_key .. 'm', codewindow.toggle_minimap, { desc = "Alternar el minimapa" })
	-- keymap('n', '<leader>' .. plugin_key .. 'c', codewindow.close_minimap, { desc = "Cerrar el minimapa" })
	keymap('n', '<leader>' .. plugin_key .. 'f', codewindow.toggle_focus, { desc = "Enfocar/desenfocar el minimapa" })
end

return M
