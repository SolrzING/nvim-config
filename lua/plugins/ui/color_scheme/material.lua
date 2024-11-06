return {
	"marko-cerovac/material.nvim",
	enabled = true,
	lazy = false,
	priority = 1000,
	init = function ()
		vim.g.material_style = "darker"
	end,
	config = function ()
		require('material').setup({
			contrast = {
				terminal = true, -- Habilita el contraste para el terminal integrado
				sidebars = true, -- Habilita el contraste para ventanas tipo barra lateral (por ejemplo, Nvim-Tree)
				floating_windows = true, -- Habilita el contraste para ventanas flotantes
				cursor_line = false, -- Habilita un fondo más oscuro para la línea del cursor
				lsp_virtual_text = true, -- Habilita un fondo contrastado para el texto virtual de LSP
				non_current_windows = true, -- Habilita un fondo contrastado para ventanas no actuales
				filetypes = {}, -- Especifica qué tipos de archivo obtienen el fondo contrastado (más oscuro)
			},

			styles = { -- Da estilos a los comentarios como negrita, cursiva, subrayado, etc.
				comments = { italic = true },
				strings = { bold = true },
				keywords = { underline = true },
				functions = { bold = true, undercurl = true },
				variables = {},
				operators = {},
				types = {},
			},

			plugins = { -- Descomenta los plugins que usas para resaltarlos
				-- Plugins disponibles:
				-- "coc"
				"dap",
				-- "dashboard",
				-- "eyeliner",
				-- "fidget",
				-- "flash",
				-- "gitsigns",
				"harpoon",
				-- "hop",
				-- "illuminate",
				"indent-blankline",
				-- "lspsaga",
				-- "mini",
				-- "neogit",
				-- "neotest",
				"neo-tree",
				-- "neorg",
				-- "noice",
				"nvim-cmp",
				-- "nvim-navic",
				-- "nvim-tree",
				"nvim-web-devicons",
				-- "rainbow-delimiters",
				-- "sneak",
				"telescope",
				-- "trouble",
				"which-key",
				"nvim-notify",
			},

			disable = {
				colored_cursor = false, -- Deshabilita el cursor coloreado
				borders = false, -- Deshabilita los bordes entre ventanas divididas verticalmente
				background = false, -- Evita que el tema establezca el fondo (Neovim luego usa el fondo de tu terminal)
				term_colors = false, -- Evita que el tema establezca los colores del terminal
				eob_lines = false -- Oculta las líneas de fin de buffer
			},

			high_visibility = {
				lighter = false, -- Habilita texto de mayor contraste para el estilo más claro
				darker = false -- Habilita texto de mayor contraste para el estilo más oscuro
			},

			lualine_style = "stealth", -- Estilo de Lualine (puede ser 'stealth' o 'default')

			async_loading = true, -- Carga partes del tema de manera asincrónica para un inicio más rápido (activado por defecto)

			custom_colors = nil, -- Si deseas sobrescribir los colores predeterminados, establece esto a una función

			custom_highlights = {}, -- Sobrescribe los resaltados con los tuyos
		})
		vim.cmd 'colorscheme material'

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		local extend = vim.tbl_extend

		keymap("n", "<leader>co", function()
			local colors = require "material.colors"
			vim.api.nvim_echo({ { vim.inspect(colors), "Normal" } }, true, {})
		end, { desc = "Lista de colores de Material" })
	end
}
