local M = {}

local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt



function M.setup()
	ls.add_snippets("lua", {
		s('Nvim Main Template', fmt(
			[[
			return {{
				"{}",
				dependencies = {{{}}},
				enabled=true,
				config = function()
					local plugin_config = require("{}")
					plugin_config.setup()

					local keymaps_config = require("{}")
					keymaps_config.setup()
				end,
			}}
			]], {i(1),i(2),i(3),i(4)}
		))
	})



	ls.add_snippets("lua", {
		s('Nvim Keymaps Template', fmt(
			[[
			local M = {{}}

			local keymap = require("function.keymap").keymap



			function M.setup()
				{}
			end

			return M
			]], {i(1),}
		))
	})



	ls.add_snippets("lua", {
		s('Nvim Keymaps', fmt(
			[[
			keymap({{"n"}}, "<leader>{}", "{}", {{ desc = "{}" }} )
			]], {i(1),i(2),i(3)}
		))
	})



	ls.add_snippets("lua", {
		s('Nvim Config Template', fmt(
			[[
			local M = {{}}



			function M.setup()
				{}
			end

			return M
			]], {i(1),}
		))
	})
end

return M
