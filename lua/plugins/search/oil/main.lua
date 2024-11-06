return {
	'stevearc/oil.nvim',
	enabled=false,
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	vim.keymap.set("n", "<leader>-", function ()
		require("oil").toggle_float()
	end, { desc = "toggle float" }),
}
