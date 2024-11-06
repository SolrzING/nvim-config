return {
	'sainnhe/gruvbox-material',
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.g.gruvbox_material_enable_italic = true
		-- Available values:   `'material'`, `'mix'`, `'original'`
		-- Default value:      `'material'`
		vim.g.gruvbox_material_foreground = 'material'
		-- Available values:   `'hard'`, `'medium'`, `'soft'`
		-- Default value:      `'medium'`
		vim.g.gruvbox_material_background = 'hard'
		-- To enable bold in function name just like the original gruvbox, set this
		-- option to `1` 
		vim.g.gruvbox_material_enable_bold = 1
		-- Dim inactive windows. Only works in Neovim currently. 
		vim.g.gruvbox_material_dim_inactive_windows = 1
		-- The contrast of line numbers, indent lines, etc. 
		vim.g.gruvbox_material_ui_contrast = 'high'

		vim.cmd.colorscheme('gruvbox-material')

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		local extend = vim.tbl_extend

		keymap("n", "<leader>co", function()
			local color_theme = {
				main = {}
			}

			-- Función para obtener colores del esquema actual
			local function get_colors()
				local groups = {
					bg = "Todo",
					fg = "Fg",
					
					agua = "Aqua",
					black = "Todo",
					blue = "Blue",
					cyan = "DevIconHyprland",
					gray = "Comment",
					green = "Green",
					orange = "Orange",
					purple = "Purple",
					red = "Red",
					white = "Fg",
					yellow = "Yellow",

					msgerror = "ErrorMsg",
					msgwarning = "WarningMsg",
					msginfo = "InfoFloat",
					msghint = "Purple",
				}

				for name, group in pairs(groups) do
					local hl = vim.api.nvim_get_hl_by_name(group, true)
					if hl.foreground then
						color_theme.main[name] = string.format("#%06x", hl.foreground)
					end
				end
			end

			get_colors()

			-- Imprimir el tema de colores
			vim.api.nvim_echo({ { vim.inspect(color_theme), "Normal" } }, true, {})
		end, { desc = "Lista de colores de Material" })
	end
}
