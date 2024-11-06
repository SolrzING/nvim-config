local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

local builtin = require('telescope.builtin')
local telescope_leader_key = "f"

function M.setup()
	keymap("n", "<leader>" .. telescope_leader_key .. "w", ":Telescope projects<cr>", { desc = "Telescope Proyectos" })
	keymap("n", "<leader>" .. telescope_leader_key .. "f", builtin.find_files, { desc = "Telescope Buscar archivos" })
	keymap("n", "<leader>" .. telescope_leader_key .. "g", builtin.live_grep, { desc = "Telescope Buscar x palabras" })
	keymap("n", "<leader>" .. telescope_leader_key .. "h", builtin.oldfiles, { desc = "Telescope Historial de archivos" })
	keymap("n", "<leader>" .. telescope_leader_key .. "b", builtin.buffers, { desc = "Telescope Buffers activos" })
	keymap("n", "<leader>" .. telescope_leader_key .. "y", builtin.help_tags, { desc = "Telescope Ayuda" })
end


return M
