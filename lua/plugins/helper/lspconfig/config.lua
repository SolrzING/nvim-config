local M = {}

function M.setup()
	local on_attach = function(_, bufnr)
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		local keymap = vim.keymap.set
		local opts = { buffer = bufnr, noremap = true, silent = true }
		local extend = vim.tbl_extend
		-- keymap('n', 'gD', vim.lsp.buf.declaration, extend('force', opts, { desc = "Ir a la declaración" }))  -- Ir a la declaración
		keymap('n', 'gd', vim.lsp.buf.definition, extend('force', opts, { desc = "Ir a la definición" }))   -- Ir a la definición
		-- keymap('n', 'K', vim.lsp.buf.hover, extend('force', opts, { desc = "Mostrar información sobre el símbolo" }))          -- Mostrar información sobre el símbolo
		keymap('n', 'gi', vim.lsp.buf.implementation, extend('force', opts, { desc = "Ir a la implementación" })) -- Ir a la implementación
		keymap('n', '<leader>lk', vim.lsp.buf.signature_help, extend('force', opts, { desc = "Ayuda de firma" })) -- Ayuda de firma
		-- keymap('n', '<leader>lwa', vim.lsp.buf.add_workleader_folder, extend('force', opts, { desc = "Añadir carpeta de trabajo" })) -- Añadir carpeta de trabajo
		-- keymap('n', '<leader>lwr', vim.lsp.buf.remove_workleader_folder, extend('force', opts, { desc = "Eliminar carpeta de trabajo" })) -- Eliminar carpeta de trabajo
		-- keymap('n', '<leader>lwl', function()
		-- 	print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
		-- end, extend('force', opts, { desc = "Listar carpetas de trabajo" })) -- Listar carpetas de trabajo
		keymap('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, extend('force', opts, { desc = "Añadir carpeta de trabajo" })) -- Añadir carpeta de trabajo 
		keymap('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, extend('force', opts, { desc = "Eliminar carpeta de trabajo" })) -- Eliminar carpeta de trabajo 
		keymap('n', '<leader>lwl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, extend('force', opts, { desc = "Listar carpetas de trabajo" })) -- Listar carpetas de trabajo 
		keymap('n', '<leader>ld', vim.lsp.buf.type_definition, extend('force', opts, { desc = "Ir a la definición de tipo" })) -- Ir a la definición de tipo
		keymap('n', '<leader>lr', vim.lsp.buf.rename, extend('force', opts, { desc = "Renombrar símbolo" })) -- Renombrar símbolo
		keymap('n', 'gr', vim.lsp.buf.references, extend('force', opts, { desc = "Referencias al símbolo" })) -- Referencias al símbolo
		keymap('n', '<leader>dd', vim.diagnostic.open_float, extend('force', opts, { desc = "Mostrar diagnóstico en flotante" })) -- Mostrar diagnóstico en flotante
		keymap('n', '{d', vim.diagnostic.goto_prev, extend('force', opts, { desc = "Ir al diagnóstico anterior" })) -- Ir al diagnóstico anterior
		keymap('n', '}d', vim.diagnostic.goto_next, extend('force', opts, { desc = "Ir al siguiente diagnóstico" })) -- Ir al siguiente diagnóstico
		keymap('n', '<leader>dl', vim.diagnostic.setloclist, extend('force', opts, { desc = "Establecer lista de ubicación para diagnósticos" })) -- Establecer lista de ubicación para diagnósticos
	end


	local nvim_lsp = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- Lista de servidores lsp
	local servers = {
		"lua_ls",
		"emmet_language_server",
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
