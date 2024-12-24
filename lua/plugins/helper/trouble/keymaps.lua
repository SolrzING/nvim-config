local M = {}

local keymap = require("function.keymap").keymap



function M.setup()
	keymap({"n"}, "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" } )
	keymap({"n"}, "<leader>cs", "<cmd>Trouble lsp_document_symbols toggle focus=false win.position=right<cr>", { desc = "Symbols (Trouble)" } )
	keymap({"n"}, "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" } )
	keymap({"n"}, "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" } )
	keymap({"n"}, "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" } )
end

return M
