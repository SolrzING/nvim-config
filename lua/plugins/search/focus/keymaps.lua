local M = {}

local keymap = require("function.keymap").keymap

local plugin_key = "s"


function M.setup()
	keymap({ "n", }, "<leader>" .. plugin_key, "", { desc = "Focus Split" })
	keymap({ "n" }, "<leader>" .. plugin_key .. "c", ":FocusSplitCycle<cr>", { desc = "Tabulacion Inversa" })

	keymap({ "n" }, "<leader>" .. plugin_key .. "m", ":FocusMaximise<cr>", { desc = "Maximixar Espacio" })
	keymap({ "n" }, "<leader>" .. plugin_key .. "a", ":FocusAutoresize<cr>", { desc = "Autoredimensionar" })
	keymap({ "n" }, "<leader>" .. plugin_key .. "d", ":FocusEqualise<cr>", { desc = "Distribuir Equivalentemente" })

	keymap({ "n" }, "<leader>" .. plugin_key .. "k", ":FocusSplitUp<cr>", { desc = "Dividir Arriba" })
	keymap({ "n" }, "<leader>" .. plugin_key .. "j", ":FocusSplitDown<cr>", { desc = "Dividir Abajo" })
	keymap({ "n" }, "<leader>" .. plugin_key .. "h", ":FocusSplitLeft<cr>", { desc = "Dividir a la izquierda" })
	keymap({ "n" }, "<leader>" .. plugin_key .. "l", ":FocusSplitRight<cr>", { desc = "Dividir a la derecha" })

	keymap({ "n" }, "<leader>" .. plugin_key .. "n", ":FocusSplitNicely<cr>", { desc = "Dividir uniformemente" })
end

return M
