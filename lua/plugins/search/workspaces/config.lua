local M = {}



function M.setup()
	require("workspaces").setup({
		-- ruta a un archivo para almacenar los datos de los espacios de trabajo
		-- en un sistema unix esto sería ~/.local/share/nvim/workspaces
		path = vim.fn.stdpath("data") .. "/workspaces",

		-- para cambiar el directorio para nvim (:cd), o solo para la ventana (:lcd)
		-- obsoleto, usa cd_type en su lugar
		global_cd = false,

		-- controla cómo se cambia el directorio. las opciones válidas son "global", "local" y "tab"
		--   "global" cambia el directorio para el proceso de neovim. igual que el comando :cd
		--   "local" cambia el directorio para la ventana actual. igual que el comando :lcd
		--   "tab" cambia el directorio para la pestaña actual. igual que el comando :tcd
		--
		-- si se establece, anula el valor de global_cd
		cd_type = "tab",

		-- ordenar la lista de espacios de trabajo por nombre después de cargar desde la ruta de espacios de trabajo.
		sort = true,

		-- ordenar por uso reciente en lugar de por nombre. requiere que sort sea verdadero
		mru_sort = true,

		-- opción para activar automáticamente el espacio de trabajo al abrir neovim en un directorio de espacio de trabajo
		auto_open = false,

		-- opción para activar automáticamente el espacio de trabajo al cambiar de directorio no a través de este plugin
		-- establece en "autochdir" para habilitar auto_dir al usar :e y vim.opt.autochdir
		-- las opciones válidas son false, true y "autochdir"
		auto_dir = true,

		-- habilitar notificaciones de nivel informativo después de agregar o eliminar un espacio de trabajo
		notify_info = true,

		-- listas de hooks para ejecutar después de acciones específicas
		-- los hooks pueden ser una función lua o un comando vim (cadena)
		-- los hooks lua toman un nombre, una ruta y una tabla de estado opcional
		-- si solo se necesita un hook, se puede omitir la lista
		hooks = {
			add = {},
			remove = {},
			rename = {},
			open_pre = {},
			open = {},
		},
	})
	require('telescope').load_extension("workspaces")
end

return M
