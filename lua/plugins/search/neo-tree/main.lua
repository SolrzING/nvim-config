--  NEO-TREE: Arbol de busqueda
return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled=true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- no estrictamente necesario, pero recomendado
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Soporte opcional de imágenes en la ventana de vista previa: consulta `# Modo de vista previa` para obtener más información
		{
			's1n7ax/nvim-window-picker',
			version = '2.*',
			config = function()
				require 'window-picker'.setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { 'neo-tree', "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { 'terminal', "quickfix" },
						},
				},
			})
			end,
		},
	},
	config = function()
		local plugin_config = require("plugins.search.neo-tree.config")
		plugin_config.setup()

		local plugin_keymaps = require("plugins.search.neo-tree.keymaps")
		plugin_keymaps.setup()
	end
}
