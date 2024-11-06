local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

function M.setup()
    keymap("n", "<leader>tf", ":Neotree action=show toggle=true position=left reveal<cr>", extend('force', opts, { desc = "Navegador de Neo-tree" }) )
	vim.keymap.set('n', '<leader>-', function()
		local reveal_file = vim.fn.expand('%:p')
		if (reveal_file == '') then
			reveal_file = vim.fn.getcwd()
		else
			local f = io.open(reveal_file, "r")
			if (f) then
				f.close(f)
			else
				reveal_file = vim.fn.getcwd()
			end
		end
		require('neo-tree.command').execute({
			action = "focus",          -- OPTIONAL, this is the default value
			source = "filesystem",     -- OPTIONAL, this is the default value
			position = "left",         -- OPTIONAL, this is the default value
			reveal_file = reveal_file, -- path to file or folder to reveal
		})
		end,
		{ desc = "Open neo-tree at current file or working directory" }
	);

end

return M
