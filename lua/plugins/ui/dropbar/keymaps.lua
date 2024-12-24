local M = {}

local keymap = require("function.keymap").keymap



function M.setup()
	local dropbar_api = require('dropbar.api')
	keymap('n', '<Leader>.', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
	keymap('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
	keymap('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
end

return M
