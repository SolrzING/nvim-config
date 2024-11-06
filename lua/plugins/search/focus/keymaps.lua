local M = {}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

local focus_leader_key = "s"


function M.setup()
	keymap({ "n" }, "<leader>" .. focus_leader_key .. "c", ":FocusSplitCycle<cr>", { desc = "Tabulacion Inversa" })

	keymap({ "n" }, "<leader>" .. focus_leader_key .. "m", ":FocusMaximise<cr>", { desc = "Maximixar Espacio" })
	keymap({ "n" }, "<leader>" .. focus_leader_key .. "a", ":FocusAutoresize<cr>", { desc = "Autoredimensionar" })
	keymap({ "n" }, "<leader>" .. focus_leader_key .. "a", ":FocusEqualise<cr>", { desc = "Distribuir Equivalentemente" })

	keymap({ "n" }, "<leader>" .. focus_leader_key .. "k", ":FocusSplitUp<cr>", { desc = "Dividir Arriba" })
	keymap({ "n" }, "<leader>" .. focus_leader_key .. "j", ":FocusSplitDown<cr>", { desc = "Dividir Abajo" })
	keymap({ "n" }, "<leader>" .. focus_leader_key .. "h", ":FocusSplitLeft<cr>", { desc = "Dividir a la izquierda" })
	keymap({ "n" }, "<leader>" .. focus_leader_key .. "l", ":FocusSplitRight<cr>", { desc = "Dividir a la derecha" })

	keymap({ "n" }, "<leader>" .. focus_leader_key .. "n", ":FocusSplitNicely<cr>", { desc = "Dividir uniformemente" })
end

return M
