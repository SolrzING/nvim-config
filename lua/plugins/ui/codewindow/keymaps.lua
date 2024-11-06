local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

local codewindow = require('codewindow')
local minimap_leader_key = "<Tab>"


function M.setup()
	-- keymap('n', '<leader>' .. minimap_leader_key .. 'o', codewindow.open_minimap,
	-- 	extend('force', opts, { desc = "Abrir el minimapa" }))
	keymap('n', '<leader>' .. minimap_leader_key .. 'm', codewindow.toggle_minimap,
		extend('force', opts, { desc = "Alternar el minimapa" }))
	-- keymap('n', '<leader>' .. minimap_leader_key .. 'c', codewindow.close_minimap,
	-- 	extend('force', opts, { desc = "Cerrar el minimapa" }))
	keymap('n', '<leader>' .. minimap_leader_key .. 'f', codewindow.toggle_focus,
		extend('force', opts, { desc = "Enfocar/desenfocar el minimapa" }))
end

return M
