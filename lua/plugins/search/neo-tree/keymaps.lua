local M = {}

local keymap = require("function.keymap").keymap

function M.setup()
    keymap("n", "<leader>tf", ":Neotree action=show source=filesystem toggle=true position=left<cr>", { desc = "Navegador de Neo-tree" } )
	keymap('n', '<leader>-', function()
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
				action = "show",          -- OPTIONAL, this is the default value
				source = "filesystem",     -- OPTIONAL, this is the default value
				position = "left",         -- OPTIONAL, this is the default value
				reveal_file = reveal_file, -- path to file or folder to reveal
			})
		end,
		{ desc = "Abrir Neotree" }
	);

end

return M
