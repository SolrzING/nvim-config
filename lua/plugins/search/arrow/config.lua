local M = {}

function M.setup()
	require("arrow").setup({
		show_icons = true,
		always_show_path = false,
		separate_by_branch = false, -- Los marcadores se separarán por rama de git
		hide_handbook = false, -- establecer en verdadero para ocultar los atajos en el menú.
		save_path = function()
			return vim.fn.stdpath("cache") .. "/arrow"
		end,
		mappings = {
		edit = "e",
		delete_mode = "d",
		clear_all_items = "C",
		toggle = "s", -- utilizado como guardar si separate_save_and_remove es verdadero
		open_vertical = "v",
		open_horizontal = "-",
		quit = "q",
		remove = "x", -- solo se utiliza si separate_save_and_remove es verdadero
		next_item = "}",
		prev_item = "{"
		},
		custom_actions = {
			open = function(target_file_name, current_file_name) end, -- target_file_name = archivo seleccionado para abrir, current_file_name = nombre del archivo desde donde se llamó esto
			split_vertical = function(target_file_name, current_file_name) end,
			split_horizontal = function(target_file_name, current_file_name) end,
		},
		window = { -- controla la apariencia y posición de una ventana de flecha (ver nvim_open_win() para todas las opciones)
			width = "auto",
			height = "auto",
			row = "auto",
			col = "auto",
			border = "double",
		},
		per_buffer_config = {
			lines = 4, -- Número de líneas mostradas en la vista previa.
			sort_automatically = true, -- Ordenar automáticamente las marcas del buffer.
			treesitter_context = nil, -- puede ser { line_shift_down = 2 }
		},
		separate_save_and_remove = false, -- si es verdadero, eliminará el interruptor y creará los mapas de teclas de guardar/eliminar.
		leader_key = "<leader>,",
		buffer_leader_key = '<leader>;', -- Per Buffer Mappings
		save_key = "cwd", -- lo que se utilizará como raíz para guardar los marcadores. También puede ser `git_root`.
		global_bookmarks = true, -- si es verdadero, arrow guardará archivos globalmente (ignora separate_by_branch)
		index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- teclas asignadas al índice de marcadores, es decir, el primer marcador será accesible por 1, y el duodécimo - por c
		full_path_list = { "update_stuff" } -- los nombres de archivo en esta lista SIEMPRE mostrarán también la ruta del archivo.
	})
end

return M
