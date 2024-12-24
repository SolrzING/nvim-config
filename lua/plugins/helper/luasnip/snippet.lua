local ls = require "luasnip"

local M = {}

function M.setup()
	local lua = require("plugins.helper.luasnip.snippet.lua")
	lua.setup()
	local icons = require("plugins.helper.luasnip.snippet.icons")
	icons.setup()
end

return M
