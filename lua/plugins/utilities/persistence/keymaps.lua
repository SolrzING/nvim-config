local M = {}

local keymap = require("function.keymap").keymap

local plugin_key = "q"



function M.setup()
	keymap({ "n", }, "<leader>" .. plugin_key, "", { desc = "Sesiones" })
	-- load the session for the current directory
	keymap("n", "<leader>" .. plugin_key .. "s", function() require("persistence").load() end, { desc = "Cargar Session al directorio actual" })

	-- select a session to load
	keymap("n", "<leader>" .. plugin_key .. "S", function() require("persistence").select() end, { desc = "Seleccionar session" })

	-- load the last session
	keymap("n", "<leader>" .. plugin_key .. "l", function() require("persistence").load({ last = true }) end, { desc = "Cargar la ultima sesion" })

	-- stop Persistence => session won't be saved on exit
	keymap("n", "<leader>" .. plugin_key .. "d", function() require("persistence").stop() end, { desc = "Detener sistema de sesiones" })
end

return M
