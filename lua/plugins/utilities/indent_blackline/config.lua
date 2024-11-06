local M = {}

function M.setup()
	local highlight = {
		"ColorSelect1",
		"ColorSelect2",
		"ColorSelect3",
		"ColorSelect4",
	}

	local hooks = require "ibl.hooks"
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "ColorSelect1", { fg = "#3f3932" })
		vim.api.nvim_set_hl(0, "ColorSelect2", { fg = "#695c4a" })
		vim.api.nvim_set_hl(0, "ColorSelect3", { fg = "#b0a28f" })
		vim.api.nvim_set_hl(0, "ColorSelect4", { fg = "#695c4a" })
	end)

	require("ibl").setup { indent = { highlight = highlight } }
end

return M
