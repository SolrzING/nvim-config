local M = {}

local keymap = require("function.keymap").keymap



function M.setup()
    keymap("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })	
end

return M
