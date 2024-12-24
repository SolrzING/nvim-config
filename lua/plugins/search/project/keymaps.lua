local M = {}

local keymap = require("function.keymap").keymap

local plugin_key = "f"



function M.setup()
	keymap("n", "<leader>" .. plugin_key .. "w", ":Telescope projects<cr>", { desc = "Telescope Proyectos" } )
end

return M
