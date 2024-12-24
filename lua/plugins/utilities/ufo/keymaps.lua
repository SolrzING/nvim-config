local M = {}

local keymap = require("function.keymap").keymap

local ufo = require('ufo')

local plugin_key = "z"


function M.setup()
	keymap({ "n", }, "<leader>" .. plugin_key, "", { desc = "Colapsar" })
	keymap('n', '<leader>' .. plugin_key .. 'R', ufo.openAllFolds, { desc = "Abrir los pliegues" })
	keymap('n', '<leader>' .. plugin_key .. 'M', ufo.closeAllFolds, { desc = "Cerrar los pliegues" })
	keymap('n', '<leader>' .. plugin_key .. 'r', ufo.openFoldsExceptKinds, { desc = "" })
	keymap('n', '<leader>' .. plugin_key .. 'm', ufo.closeFoldsWith, { desc = "" }) -- closeAllFolds == closeFoldsWith(0)
end

return M
