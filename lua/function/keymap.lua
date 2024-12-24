local M = {}



function M.keymap(mode, key_action, command_action, specific_opts)
	local general_opts = { noremap = true, silent = true }
	local opts = vim.tbl_extend('force', general_opts, specific_opts or {})
	vim.keymap.set(mode, key_action or "", command_action, opts)
end



return M
