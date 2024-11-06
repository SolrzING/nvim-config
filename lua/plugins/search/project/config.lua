local M = {}

function M.setup()
	require("project_nvim").setup({
		-- El modo manual no cambia automáticamente tu directorio raíz, así que tienes
		-- la opción de hacerlo manualmente usando el comando `:ProjectRoot`.
		manual_mode = true,

		-- Métodos para detectar el directorio raíz. **"lsp"** usa el lsp nativo de neovim
		-- mientras que **"pattern"** usa coincidencia de patrones glob estilo vim-rooter. Aquí
		-- el orden importa: si uno no se detecta, el otro se usa como alternativa. Puedes
		-- también eliminar o reorganizar los métodos de detección.
		detection_methods = { "lsp", "pattern" },

		-- Todos los patrones usados para detectar el dir raíz, cuando **"pattern"** está en
		-- detection_methods
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

		-- Tabla de clientes lsp a ignorar por nombre
		-- ej: { "efm", ... }
		ignore_lsp = {},

		-- No calcular el dir raíz en directorios específicos
		-- Ej: { "~/.cargo/*", ... }
		exclude_dirs = {"/home/minemaxz"},

		-- Mostrar archivos ocultos en telescope
		show_hidden = true,

		-- Cuando se establece en falso, recibirás un mensaje cuando project.nvim cambie tu
		-- directorio.
		silent_chdir = false,

		-- Qué alcance para cambiar el directorio, las opciones válidas son
		-- * global (predeterminado)
		-- * tab
		-- * win
		scope_chdir = 'tab',

		-- Ruta donde project.nvim almacenará el historial del proyecto para usar en
		-- telescope
		datapath = vim.fn.stdpath("data"),
	})

	-- local project_nvim = require("project_nvim")
	-- local recent_projects = project_nvim.get_recent_projects()
	--
	-- print(vim.inspect(recent_projects))

	-- require("nvim-tree").setup({
	-- 	sync_root_with_cwd = true,
	-- 	respect_buf_cwd = true,
	-- 	update_focused_file = {
	-- 		enable = true,
	-- 		update_root = true
	-- 	},
	-- })

	require('telescope').load_extension('projects')
end

return M
