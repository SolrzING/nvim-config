local M = {}

local keymap = require("function.keymap").keymap

local ls = require "luasnip"



function M.setup()
	keymap({"n",}, "<A>", "", { desc = "Snippet" } )

	-- this will expand the current item or jump to the next item within the snippet.
	keymap({ "i", "s" }, "<A-l>", function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, { desc = "Siguiente espacio" } )

	-- this always moves to the previous item within the snippet
	keymap({ "i", "s" }, "<A-h>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, { desc = "Anterior espacio" } )

	-- This is useful for choice nodes (introduced in the forthcoming episode 2)
	keymap("i", "<A-n>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end, { desc = "Cambiar opcion" } )
end

return M
