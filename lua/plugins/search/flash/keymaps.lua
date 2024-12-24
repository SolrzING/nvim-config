local M = {}

local keymap = require("function.keymap").keymap



function M.setup()
    keymap( { "n", "x", "o" }, "ss", function() require("flash").jump() end, { desc = "Flash" })
    keymap( { "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
    keymap( { "n", "x", "o" }, "sf", function()
		require("flash").jump({
			search = { mode = "search", max_length = 0 },
			label = { after = { 0, 0 } },
			pattern = "^"
		})
	end, { desc = "Flash Treesitter" })
    -- keymap( "o", "r",  function() require("flash").remote() end, { desc = "Remote Flash" })
    -- keymap( { "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
    -- keymap( { "c" }, "<leader>r", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
end

return M
