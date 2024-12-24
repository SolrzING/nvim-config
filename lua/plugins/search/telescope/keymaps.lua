local M = {}

local keymap = require("function.keymap").keymap

local builtin = require('telescope.builtin')
local plugin_key = "f"

function M.setup()
	keymap({ "n", }, "<leader>" .. plugin_key, "", { desc = "Telescope" } )
	keymap("n", "<leader>" .. plugin_key .. "f", builtin.find_files, { desc = "Telescope Buscar archivos" } )
	keymap("n", "<leader>" .. plugin_key .. "g", builtin.live_grep, { desc = "Telescope Buscar x palabras" } )
	keymap("n", "<leader>" .. plugin_key .. "h", builtin.oldfiles, { desc = "Telescope Historial de archivos" } )
	keymap("n", "<leader>" .. plugin_key .. "b", builtin.buffers, { desc = "Telescope Buffers activos" } )
	keymap("n", "<leader>" .. plugin_key .. "y", builtin.help_tags, { desc = "Telescope Ayuda" } )
end


return M
