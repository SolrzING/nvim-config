local M = {}

function M.setup()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"emmet_language_server",
			"html",
			"tailwindcss",
			"cssls",
			"ts_ls",
			"pyright",
			-- "spyglassmc_language_server"
		},
	})
end

return M
