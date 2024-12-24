local M = {}

local keymap = require("function.keymap").keymap

local plugin_key = "s"



function M.setup()
	keymap({ "n", }, "<leader>" .. plugin_key, "", { desc = "Split" })
	keymap('n', '<A-h>', require('smart-splits').resize_left, { desc = "Resize left" })
	keymap('n', '<A-j>', require('smart-splits').resize_down, { desc = "Resize down" })
	keymap('n', '<A-k>', require('smart-splits').resize_up, { desc = "Resize up" })
	keymap('n', '<A-l>', require('smart-splits').resize_right, { desc = "Resize right" })
	-- moving between splits
	keymap('n', '<C-h>', require('smart-splits').move_cursor_left, { desc = "" })
	keymap('n', '<C-j>', require('smart-splits').move_cursor_down, { desc = "" })
	keymap('n', '<C-k>', require('smart-splits').move_cursor_up, { desc = "" })
	keymap('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = "" })
	keymap('n', '<C-\\>', require('smart-splits').move_cursor_previous, { desc = "" })
	-- swapping buffers between windows
	keymap('n', '<leader>' .. plugin_key .. 'h', require('smart-splits').swap_buf_left, { desc = "Swap left" })
	keymap('n', '<leader>' .. plugin_key .. 'j', require('smart-splits').swap_buf_down, { desc = "Swap down" })
	keymap('n', '<leader>' .. plugin_key .. 'k', require('smart-splits').swap_buf_up, { desc = "Swap up" })
	keymap('n', '<leader>' .. plugin_key .. 'l', require('smart-splits').swap_buf_right, { desc = "Swap right" })
end

return M
