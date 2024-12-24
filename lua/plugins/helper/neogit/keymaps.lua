local M = {}

local keymap = require("function.keymap").keymap

local plugin_key = "g"

function M.setup()
	keymap({ "n", }, "<leader>" .. plugin_key, "", { desc = "Git" })

	keymap({ "n", "v" }, "<leader>" .. plugin_key .. "i", function () require('neogit').open() end, { desc = "Git Menu" })
end

return M
