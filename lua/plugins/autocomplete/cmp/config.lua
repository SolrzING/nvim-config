local cmp = require'cmp'


local M = {}

function M.setup()
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = {
				border = "rounded",
			},
			documentation = {
				border = "rounded",
			},
		},
		formatting = {
			format = function(entry, vim_item)
				local KIND_ICONS = {
					Tailwind = '󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞',
					Color = '󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞',
					Class = "Clase",
					-- Constant = '󰚞',
					-- Constructor = 4,
					-- Enum = 13,
					-- EnumMember = 20,
					-- Event = 23,
					-- Field = 5,
					-- File = 17,
					-- Folder = 19,
					Function = "Funcion",
					-- Interface = 8,
					-- Keyword = 14,
					-- Method = 2,
					-- Module = 9,
					Operator = "Operador",
					-- Property = 10,
					-- Reference = 18,
					Snippet = " ",
					-- Struct = 22,
					Text = "",
					-- TypeParameter = 25,
					-- Unit = 11,
					Value = "Valor",
					-- Variable = 6
				}
				if vim_item.kind == 'Color' and entry.completion_item.documentation then
					--GRUPO 1
					local _, _, r, g, b =
					---@diagnostic disable-next-line: param-type-mismatch
						string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')

					local _, _, hexcolor =
					---@diagnostic disable-next-line: param-type-mismatch
						string.find(entry.completion_item.documentation, '^#([0-9a-fA-F]+)')


					if r and g and b then
						local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
						local group = 'cmp_color_' .. color

						if vim.api.nvim_call_function('hlID', { group }) < 1 then
							vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
							vim.api.nvim_command('highlight ' .. ' ' .. 'PmenuSel' .. ' ' .. 'guibg=#FFFFFF guifg=#' .. color)
						end

						vim_item.kind = KIND_ICONS.Tailwind
						vim_item.kind_hl_group = group

						return vim_item
					end

					if hexcolor then
						--local highlight = vim.api.nvim_exec('echo ccc#highlight("'..hexcolor..'")', true)

						local group = 'cmp_color_' .. hexcolor

						if vim.api.nvim_call_function('hlID', { group }) < 1 then
							vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. hexcolor)
							vim.api.nvim_command('highlight ' .. ' ' .. 'PmenuSel' .. ' ' .. 'guibg=#FFFFFF guifg=#' .. hexcolor)
							--vim.api.nvim_command('highlight ' .. ' ' .. 'PmenuSbar' .. ' ' .. 'guibg=#FFFFFF guifg=#' .. hexcolor)

						end

						vim_item.kind = KIND_ICONS.Color
						vim_item.kind_hl_group = group

						return vim_item
					end
				end

				vim_item.kind = KIND_ICONS[vim_item.kind] or vim_item.kind

				return vim_item
			end,
		},
		mapping = cmp.mapping.preset.insert({
			['<C-k>'] = cmp.mapping.scroll_docs(-4),
			['<C-j>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<Tab>'] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
		}, {
			{ name = "buffer" },
		}, {
			{ name = 'nvim_lsp_signature_help' },
		}),
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
			{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		}),
		matching = { disallow_symbol_nonprefix_matching = false }
	})
end

return M

