local M = {}

function M.setup()
	require("noice").setup({
		popupmenu = {
			enabled = true, -- enables the Noice popupmenu UI
			---@type 'nui'|'cmp'
			backend = "nui", -- backend to use to show regular cmdline completions
			---@type NoicePopupmenuItemKind|false
			-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
			kind_icons = {}, -- set to `false` to disable icons
		},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		routes = {
			-- {
			-- 	filter = { event = "msg_show", kind = "", find = "written" },
			-- 	opts = { skip = true },
			-- },
			{
				filter = { event = "notify", min_height = 2 },
				view = 'popup',
			},
		},
		messages = {
			-- NOTE: If you enable messages, then the cmdline is enabled automatically.
			-- This is a current Neovim limitation.
			enabled = true, -- enables the Noice messages UI
			view = "mini", -- default view for messages
			view_error = "popup", -- view for errors
			view_warn = "notify", -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
		},
		views = {
			popup = {
				position = {
					row = "20%",
					col = "50%",
				},
				size = {
					width = "auto",
					height = "auto",
				},
				border = {
					padding = {
						top = 0,
						bottom = 0,
						left = 1,
						right = 1,
					},
					style = "rounded",
					text = {
						top = "Notification's",
						top_align = "center",
					},
				},
			},
		},
		commands = {
			history = {
				-- options for the message history that you get with `:Noice`
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
			},
			-- :Noice last
			last = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
				filter_opts = { count = 1 },
			},
			-- :Noice errors
			errors = {
				-- options for the message history that you get with `:Noice`
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = { error = true },
				filter_opts = { reverse = true },
			},
			all = {
				-- options for the message history that you get with `:Noice`
				view ="popup",
				opts = { enter = true, format = "details" },
				filter = {},
			},
		},
	})
end

return M
