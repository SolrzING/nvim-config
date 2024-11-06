local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

local ufo = require('ufo')
local ufo_leader_key = "z"


function M.setup()
	keymap('n', ufo_leader_key .. 'R', ufo.openAllFolds,
		extend('force', opts, { desc = "Abrir los pliegues" }))
	keymap('n', ufo_leader_key .. 'M', ufo.closeAllFolds)
	keymap('n', ufo_leader_key .. 'r', ufo.openFoldsExceptKinds)
	keymap('n', ufo_leader_key .. 'm', ufo.closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
end

return M
