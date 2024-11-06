local M = {}

function M.setup()
	require("focus").setup({
		enable = true, -- Habilita el módulo
		commands = true, -- Crea comandos de Focus
		autoresize = {
			enable = true, -- Habilita o deshabilita el autoajuste de tamaño de los splits
			width = 0, -- Fuerza el ancho para la ventana enfocada
			height = 0, -- Fuerza la altura para la ventana enfocada
			minwidth = 0, -- Fuerza el ancho mínimo para la ventana no enfocada
			minheight = 0, -- Fuerza la altura mínima para la ventana no enfocada
			height_quickfix = 10, -- Establece la altura del panel de correcciones rápidas
		},
		split = {
			bufnew = true, -- Crea un buffer en blanco para nuevas ventanas de split
			tmux = false, -- Crea splits de tmux en lugar de splits de neovim
		},
		ui = {
			number = false, -- Muestra números de línea solo en la ventana enfocada
			relativenumber = false, -- Muestra números de línea relativos solo en la ventana enfocada
			hybridnumber = false, -- Muestra números de línea híbridos solo en la ventana enfocada
			absolutenumber_unfocussed = true, -- Preserva los números absolutos en las ventanas no enfocadas

			cursorline = true, -- Muestra una línea de cursor solo en la ventana enfocada
			cursorcolumn = false, -- Muestra la columna del cursor solo en la ventana enfocada
			colorcolumn = {
				enable = false, -- Muestra la columna de color solo en la ventana enfocada
				list = '+1', -- Establece la lista separada por comas para la columna de color
			},
			signcolumn = true, -- Muestra la columna de signos solo en la ventana enfocada
			winhighlight = false, -- Resaltado automático para ventanas enfocadas/no enfocadas
		},
	})
end

return M

