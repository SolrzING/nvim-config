local M = {}

function M.setup()
	local codewindow = require('codewindow')
	codewindow.setup({
		active_in_terminals = false, -- ¿Debe activarse el minimapa para los buffers de terminal?
		auto_enable = false, -- Abre automáticamente el minimapa al entrar en un buffer (no excluido) (acepta una tabla de tipos de archivo)
		exclude_filetypes = { 'help' }, -- Elige ciertos tipos de archivo para no mostrar el minimapa
		max_minimap_height = 10, -- La altura máxima que puede tener el minimapa (incluyendo bordes)
		max_lines = nil, -- Si auto_enable es verdadero, no abrir el minimapa para buffers que tengan más de esta cantidad de líneas.
		minimap_width = 20, -- El ancho de la parte de texto del minimapa
		use_lsp = true, -- Usa el LSP integrado para mostrar errores y advertencias
		use_treesitter = true, -- Usa nvim-treesitter para resaltar el código
		use_git = true, -- Muestra pequeños puntos para indicar adiciones y eliminaciones de git
		width_multiplier = 4, -- Cuántos caracteres representa un punto
		z_index = 1, -- El z-index en el que estará la ventana flotante
		show_cursor = true, -- Muestra la posición del cursor en el minimapa
		screen_bounds = 'lines', -- Cómo se muestra el área visible, "lines": líneas arriba y abajo, "background": color de fondo
		window_border = 'single', -- El estilo del borde de la ventana flotante (acepta todas las opciones habituales)
		relative = 'win', -- A qué se colocará el minimapa en relación, "win": la ventana actual, "editor": todo el editor
		events = { 'TextChanged', 'InsertLeave', 'DiagnosticChanged', 'FileWritePost' } -- Eventos que actualizan la ventana de código
	})
	codewindow.apply_default_keybinds()
end

return M
