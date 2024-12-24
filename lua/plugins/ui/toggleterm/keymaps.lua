local M = {}

local keymap = require("function.keymap").keymap

function M.setup()
	keymap({ "n", "v" }, "<F5>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })

	function _G.set_terminal_keymaps()
		local opts = {buffer = 0}
		keymap('t', '<esc>', [[<C-\><C-n>]], opts)
		keymap('t', 'jk', [[<C-\><C-n>]], opts)
		keymap('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
		keymap('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
		keymap('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
		keymap('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
		keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
	end

	-- if you only want these mappings for toggle term use term://*toggleterm#* instead
	vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

return M
