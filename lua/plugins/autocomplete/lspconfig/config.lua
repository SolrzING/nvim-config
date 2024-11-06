local M = {}

function M.setup()
	local on_attach = function(_, bufnr)
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		local opts = { buffer = bufnr, noremap = true, silent = true }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
		vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
	end


	local nvim_lsp = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- Lista de servidores lsp
	local servers = {
		"lua_ls",
		-- "emmet_language_server",
		"html",
		-- "tailwindcss",
		"cssls",
		"ts_ls",
		"pyright",
		"spyglassmc_language_server",
	}

	-- Ciclo para lista de servidores
	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end

	nvim_lsp.lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = {"vim"}
				}
			}
		}
	})

	local capabilities_html = vim.lsp.protocol.make_client_capabilities()
	capabilities_html.textDocument.completion.completionItem.snippetSupport = true
	nvim_lsp.html.setup({
		on_attach = on_attach,
		capabilities = capabilities_html,
		filetypes = { "html", "templ", "htmldjango" }
	})
end

return M
