local M = {}

function M.setup()
    require("Comment").setup({
		---Añadir un espacio entre el comentario y la línea
		padding = true,
		---Si el cursor debe mantenerse en su posición
		sticky = true,
		---Líneas a ignorar mientras se comenta/descomenta
		ignore = '^$',
		---LHS de los mapeos de alternancia en modo NORMAL
		toggler = {
			---Mapeo de tecla para alternar comentario de línea
			line = "gc",
			---Mapeo de tecla para alternar comentario de bloque
			block = "gb",
		},
		---LHS de los mapeos pendientes de operador en modo NORMAL y VISUAL
		opleader = {
			---Mapeo de tecla para comentario de línea
			line = 'gcc',
			---Mapeo de tecla para comentario de bloque
			block = 'gbc',
		},
		---LHS de mapeos adicionales
		extra = {
			---Añadir comentario en la línea de arriba
			above = 'gcO',
			---Añadir comentario en la línea de abajo
			below = 'gco',
			---Añadir comentario al final de la línea
			eol = 'gcA',
		},
		---Habilitar mapeos de teclas
		---NOTA: Si se establece en `false`, entonces el plugin no creará ningún mapeo
		mappings = {
			---Mapeo pendiente de operador; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,
			---Mapeo adicional; `gco`, `gcO`, `gcA`
			extra = false,
		},
		---Función a llamar antes de comentar/descomentar
		pre_hook = nil,
		---Función a llamar después de comentar/descomentar
		post_hook = nil,
	})
end

return M
