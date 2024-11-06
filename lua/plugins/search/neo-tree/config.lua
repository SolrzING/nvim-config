local M = {}

function M.setup()
	-- Si deseas iconos para errores de diagnóstico, deberás definirlos en algún lugar:
	vim.fn.sign_define("DiagnosticSignError",
		{text = " ", texthl = "DiagnosticSignError"})
	vim.fn.sign_define("DiagnosticSignWarn",
		{text = " ", texthl = "DiagnosticSignWarn"})
	vim.fn.sign_define("DiagnosticSignInfo",
		{text = " ", texthl = "DiagnosticSignInfo"})
	vim.fn.sign_define("DiagnosticSignHint",
		{text = "󰌵", texthl = "DiagnosticSignHint"})

	require("neo-tree").setup({
		close_if_last_window = false, -- Cierra Neo-tree si es la última ventana en la pestaña
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		-- La siguiente opcion esta desactualizada, revisar como actualizarla si lo llego a necesitar. by Terokl
		--enable_normal_mode_for_inputs = false, -- Habilita el modo normal para los cuadros de diálogo de entrada.
		open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- al abrir archivos, no utilices ventanas que contengan estos tipos de archivo o buftypes
		sort_case_insensitive = false, -- se utiliza al ordenar archivos y directorios en el árbol
		sort_function = nil , -- utiliza una función personalizada para ordenar archivos y directorios en el árbol
		-- sort_function = function (a,b)
		--			 if a.type == b.type then
		--					 return a.path > b.path
		--			 else
		--					 return a.type > b.type
		--			 end
		--	 end , -- esto ordena archivos y directorios de forma descendente
		default_component_configs = {
			container = {
				enable_character_fade = true
			},
			indent = {
				indent_size = 2,
				padding = 1, -- espacio adicional en el lado izquierdo
				-- guías de sangría
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				-- configuración de expansores, necesaria para anidar archivos
				with_expanders = nil, -- si es nulo y la anidación de archivos está habilitada, se habilitarán los expansores
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
				-- Las siguientes dos configuraciones son solo un respaldo, si usas nvim-web-devicons y configuras iconos predeterminados allí
				-- entonces estos nunca se utilizarán.
				default = "*",
				highlight = "NeoTreeFileIcon"
			},
			modified = {
				symbol = "[+]",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					-- Tipo de cambio
					added		 = "", -- o "✚", pero esta información es redundante si usas git_status_colors en el nombre
					modified	= "", -- o "", pero esta información es redundante si usas git_status_colors en el nombre
					deleted	 = "✖",-- esto solo se puede usar en la fuente git_status
					renamed	 = "󰁕",-- esto solo se puede usar en la fuente git_status
					-- Tipo de estado
					untracked = "",
					ignored	 = "",
					unstaged	= "󰄱",
					staged		= "",
					conflict	= "",
				}
			},
			-- Si no quieres usar estas columnas, puedes establecer `enabled = false` para cada una de ellas individualmente
			file_size = {
				enabled = true,
				required_width = 128, -- ancho mínimo de ventana requerido para mostrar esta columna
			},
			type = {
				enabled = true,
				required_width = 122, -- ancho mínimo de ventana requerido para mostrar esta columna
			},
			last_modified = {
				enabled = true,
				required_width = 88, -- ancho mínimo de ventana requerido para mostrar esta columna
			},
			created = {
				enabled = true,
				required_width = 110, -- ancho mínimo de ventana requerido para mostrar esta columna
			},
			symlink_target = {
				enabled = false,
			},
		},
		-- Una lista de funciones, cada una representando un comando personalizado global
		-- que estará disponible en todas las fuentes (si no se sobrescribe en `opts[source_name].commands`)
		-- ver `:h neo-tree-custom-commands-global`
		commands = {},
		window = {
			position = "left",
			width = 30,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["<space>"] = {
						"toggle_node",
						nowait = false, -- desactiva `nowait` si tienes combinaciones existentes que comienzan con este carácter que quieres usar
				},
				["<2-LeftMouse>"] = "open",
				["<cr>"] = "open",
				["<esc>"] = "cancel", -- cierra la vista previa o la ventana flotante de neo-tree
				["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				-- Leer `# Preview Mode` para más información
				["l"] = "focus_preview",
				["S"] = "open_split",
				["s"] = "open_vsplit",
				-- ["S"] = "split_with_window_picker",
				-- ["s"] = "vsplit_with_window_picker",
				["t"] = "open_tabnew",
				-- ["<cr>"] = "open_drop",
				-- ["t"] = "open_tab_drop",
				["w"] = "open_with_window_picker",
				--["P"] = "toggle_preview", -- entra en modo de vista previa, que muestra el nodo actual sin enfocar
				["C"] = "close_node",
				-- ['C'] = 'close_all_subnodes',
				["z"] = "close_all_nodes",
				--["Z"] = "expand_all_nodes",
				["a"] = {
					"add",
					-- este comando soporta expansión de corchetes al estilo BASH ("x{a,b,c}" -> xa,xb,xc). ver `:h neo-tree-file-actions` para detalles
					-- algunos comandos pueden tomar opciones de configuración opcionales, ver `:h neo-tree-mappings` para detalles
					config = {
						show_path = "none" -- "none", "relative", "absolute"
					}
				},
				["A"] = "add_directory", -- también acepta la opción config.show_path opcional como "add". esto también soporta expansión de corchetes al estilo BASH.
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy", -- toma entrada de texto para el destino, también acepta la opción config.show_path opcional como "add":
				-- ["c"] = {
				--	"copy",
				--	config = {
				--		show_path = "none" -- "none", "relative", "absolute"
				--	}
				--}
				["m"] = "move", -- toma entrada de texto para el destino, también acepta la opción config.show_path opcional como "add".
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
				["<"] = "prev_source",
				[">"] = "next_source",
				["i"] = "show_file_details",
			}
		},
		nesting_rules = {},
		filesystem = {
			filtered_items = {
				visible = true, -- cuando es verdadero, solo se mostrarán de manera diferente a los elementos normales
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_hidden = true, -- solo funciona en Windows para archivos/directorios ocultos
				hide_by_name = {
					--"node_modules"
				},
				hide_by_pattern = { -- utiliza patrones de estilo glob
					--"*.meta",
					--"*/src/*/tsconfig.json",
				},
				always_show = { -- permanece visible incluso si otras configuraciones normalmente lo ocultarían
					--".gitignored",
				},
				never_show = { -- permanece oculto incluso si visible se cambia a verdadero, esto sobrescribe always_show
					--".DS_Store",
					--"thumbs.db"
				},
				never_show_by_pattern = { -- utiliza patrones de estilo glob
					--".null-ls_*",
				},
			},
			follow_current_file = {
				enabled = false, -- Esto encontrará y enfocará el archivo en el buffer activo cada vez
				--							 -- que el archivo actual cambie mientras el árbol está abierto.
				leave_dirs_open = false, -- `false` cerrará directorios autoexpandidos, como con `:Neotree reveal`
			},
			group_empty_dirs = false, -- cuando es verdadero, las carpetas vacías se agruparán juntas
			hijack_netrw_behavior = "open_default", -- netrw deshabilitado, abrir un directorio abre neo-tree
																							-- en la posición que se especifique en window.position
								-- "open_current",	-- netrw deshabilitado, abrir un directorio se abre dentro de la
																							-- ventana como lo haría netrw, independientemente de window.position
								-- "disabled",		-- netrw se deja solo, neo-tree no maneja la apertura de directorios
			use_libuv_file_watcher = true, -- Esto usará los observadores de archivos a nivel del sistema operativo para detectar cambios
																			-- en lugar de depender de los eventos autocmd de nvim.
			window = {
				mappings = {
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["H"] = "toggle_hidden",
					["/"] = "fuzzy_finder",
					["D"] = "fuzzy_finder_directory",
					["#"] = "fuzzy_sorter", -- ordenamiento difuso usando el algoritmo fzy
					-- ["D"] = "fuzzy_sorter_directory",
					["f"] = "filter_on_submit",
					["<c-x>"] = "clear_filter",
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
					["o"] = { "show_help", nowait=false, config = { title = "Ordenar por", prefix_key = "o" }},
					["oc"] = { "order_by_created", nowait = false },
					["od"] = { "order_by_diagnostics", nowait = false },
					["og"] = { "order_by_git_status", nowait = false },
					["om"] = { "order_by_modified", nowait = false },
					["on"] = { "order_by_name", nowait = false },
					["os"] = { "order_by_size", nowait = false },
					["ot"] = { "order_by_type", nowait = false },
					-- ['<key>'] = function(state) ... end,
				},
				fuzzy_finder_mappings = { -- define atajos de teclado para la ventana emergente de filtro en modo fuzzy_finder
					["<down>"] = "move_cursor_down",
					["<C-n>"] = "move_cursor_down",
					["<up>"] = "move_cursor_up",
					["<C-p>"] = "move_cursor_up",
					-- ['<key>'] = function(state, scroll_padding) ... end,
				},
			},

			commands = {} -- Agrega un comando personalizado o sobrescribe uno global usando el mismo nombre de función
		},
		buffers = {
			follow_current_file = {
				enabled = false, -- Esto encontrará y enfocará el archivo en el buffer activo cada vez
				--							-- que el archivo actual cambie mientras el árbol está abierto.
				leave_dirs_open = false, -- `false` cerrará directorios autoexpandidos, como con `:Neotree reveal`
			},
			group_empty_dirs = true, -- cuando es verdadero, las carpetas vacías se agruparán juntas
			show_unloaded = true,
			window = {
				mappings = {
					["bd"] = "buffer_delete",
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
					["oc"] = { "order_by_created", nowait = false },
					["od"] = { "order_by_diagnostics", nowait = false },
					["om"] = { "order_by_modified", nowait = false },
					["on"] = { "order_by_name", nowait = false },
					["os"] = { "order_by_size", nowait = false },
					["ot"] = { "order_by_type", nowait = false },
				}
			},
		},
		git_status = {
			window = {
				position = "float",
				mappings = {
					["A"]	= "git_add_all",
					["gu"] = "git_unstage_file",
					["ga"] = "git_add_file",
					["gr"] = "git_revert_file",
					["gc"] = "git_commit",
					["gp"] = "git_push",
					["gg"] = "git_commit_and_push",
					["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
					["oc"] = { "order_by_created", nowait = false },
					["od"] = { "order_by_diagnostics", nowait = false },
					["om"] = { "order_by_modified", nowait = false },
					["on"] = { "order_by_name", nowait = false },
					["os"] = { "order_by_size", nowait = false },
					["ot"] = { "order_by_type", nowait = false },
				}
			}
		}

		--vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

	})
end

return M
