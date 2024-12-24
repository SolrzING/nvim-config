local M = {}



function M.setup()
    require("outline").setup {
		outline_window = {
			-- Dónde abrir la ventana dividida: derecha/izquierda
			position = 'right',
			-- Los comandos de división predeterminados utilizados son 'topleft vs' y 'botright vs'
			-- dependiendo de `position`. Puedes cambiar esto proporcionando tu propio
			-- `split_command`.
			-- `position` no se considerará si `split_command` no es nil.
			-- Este debe ser un comando válido de vim utilizado para abrir la división para la
			-- ventana de contorno. Ejemplo: 'rightbelow vsplit'.
			-- El ancho se puede incluir (lo que anulará la configuración de ancho a continuación):
			-- Ejemplo: `topleft 20vsp` para evitar un parpadeo de ventanas al redimensionar.
			split_command = nil,
			-- Porcentaje o entero de columnas
			width = 25,
			-- Si el ancho es relativo al ancho total de nvim
			-- Cuando relative_width = true, esto significa tomar el 25% del total
			-- del ancho de pantalla para la ventana de contorno.
			relative_width = true,
			-- Cerrar automáticamente la ventana de contorno si se activa goto_location y no para
			-- peek_location
			auto_close = false,
			-- Desplazarse automáticamente a la ubicación en el código al navegar por la ventana de contorno.
			auto_jump = false,
			-- booleano o entero para la duración en milisegundos para aplicar un resaltado temporal
			-- al saltar. falso para deshabilitar.
			jump_highlight_duration = 300,
			-- Si centrar la línea del cursor verticalmente en la pantalla al
			-- saltar/enfocar. Ejecuta zz.
			center_on_jump = true,
			-- Opciones de Vim para la ventana de contorno
			show_numbers = false,
			show_relative_numbers = false,
			wrap = false,
			-- verdadero/falso/'focus_in_outline'/'focus_in_code'.
			-- Los dos últimos significan mostrar solo la línea del cursor cuando el enfoque está en el contorno/código.
			-- 'focus_in_outline' se puede usar si las operaciones outline_items.auto_set_cursor
			-- son demasiado distractivas debido al contraste visual causado por la línea del cursor.
			show_cursorline = true,
			-- Habilitar esto solo si has habilitado la línea del cursor para que el color de tu cursor pueda
			-- mezclarse con la línea del cursor, en efecto, como si tu cursor estuviera oculto
			-- en la ventana de contorno.
			-- Esto hace que tu línea de cursor tenga el mismo color como si el cursor
			-- no estuviera enfocado en la ventana de contorno.
			-- Esta función es experimental.
			hide_cursor = false,
			-- Si auto-enfocar en la ventana de contorno cuando se abre.
			-- Establecer en falso para *siempre* mantener el enfoque en tu buffer anterior al abrir
			-- el contorno.
			-- Si habilitas esto, aún puedes usar bangs en :Outline! o :OutlineOpen!
			-- para mantener el enfoque en tu código. Si esto es falso, mantener el enfoque será
			-- obligatorio para :Outline/:OutlineOpen y no podrás tener el
			-- otro comportamiento.
			focus_on_open = true,
			-- Opción winhighlight para la ventana de contorno.
			-- Consulta :help 'winhl'
			-- Para cambiar el color de fondo a "CustomHl", por ejemplo, usa "Normal:CustomHl".
			winhl = '',
		},


		outline_items = {
			-- Mostrar detalles adicionales con los símbolos (dependiente de lsp) como virtual next
			show_symbol_details = true,
			-- Mostrar los números de línea correspondientes de cada símbolo en la columna izquierda como
			-- texto virtual, para una navegación rápida cuando no está enfocado en el contorno.
			-- ¿Por qué? Consulta este comentario:
			-- https://github.com/simrat39/symbols-outline.nvim/issues/212#issuecomment-1793503563
			show_symbol_lineno = false,
			-- Si resaltar el símbolo actualmente sobre el que se pasa el ratón y todos los padres directos
			highlight_hovered_item = true,
			-- Si establecer automáticamente la ubicación del cursor en el contorno para que coincida
			-- con la ubicación en el código cuando el enfoque está en el código. Si está deshabilitado, puedes usar
			-- `:OutlineFollow[!]` desde cualquier ventana o `<C-g>` desde la ventana del contorno para
			-- activar esto manualmente.
			auto_set_cursor = true,
			-- Eventos de Autocmd para activar automáticamente estas operaciones.
			auto_update_events = {
				-- Incluye tanto el establecimiento del cursor como el resaltado del elemento sobre el que se pasa el ratón.
				-- Las dos opciones anteriores son respetadas.
				-- Esto se puede activar manualmente a través de la API lua `follow_cursor`,
				-- comando :OutlineFollow, o <C-g>.
				follow = { 'CursorMoved' },
				-- Volver a solicitar símbolos del proveedor.
				-- Esto se puede activar manualmente a través de la API lua `refresh_outline`, o
				-- comando :OutlineRefresh.
				items = { 'InsertLeave', 'WinEnter', 'BufEnter', 'BufWinEnter', 'TabEnter', 'BufWritePost' },
			},
		},

		-- Opciones para las guías de contorno que ayudan a mostrar la jerarquía en árbol de los símbolos
		guides = {
			enabled = true,
			markers = {
				-- Se recomienda que los marcadores inferior y medio utilicen el mismo número
				-- de caracteres para alinear todos los nodos secundarios verticalmente.
				bottom = '└',
				middle = '├',
				vertical = '│',
			},
		},

		symbol_folding = {
			-- Profundidad a partir de la cual los nodos se plegarán por defecto. Establecer en falso para desplegar todo al abrir.
			autofold_depth = 1,
			-- Cuándo desplegar automáticamente nodos
			auto_unfold = {
				-- Desplegar automáticamente el símbolo actualmente sobre el que se pasa el ratón
				hovered = true,
				-- Plegar automáticamente cuando el nivel raíz solo tenga esta cantidad de nodos.
				-- Establecer verdadero para 1 nodo, falso para 0.
				only = true,
			},
			markers = { '', '' },
		},

		preview_window = {
			-- Abrir automáticamente la vista previa de la ubicación del código al navegar por la ventana de contorno
			auto_preview = true,
			-- Abrir automáticamente hover_symbol al abrir la vista previa (ver mapeos de teclas para
			-- hover_symbol).
			-- Si deshabilitas esto, aún puedes abrir hover_symbol usando tu mapeo de teclas
			-- a continuación.
			open_hover_on_preview = true,
			width = 50,          -- Porcentaje o entero de columnas
			min_width = 50,      -- Número mínimo de columnas	
			-- Si el ancho es relativo al ancho total de nvim.
			-- Cuando relative_width = true, esto significa tomar el 50% del total
			-- del ancho de pantalla para la ventana de vista previa, asegurando que el ancho resultante tenga al menos 50
			-- caracteres de ancho.
			relative_width = true,
			height = 50,         -- Porcentaje o entero de líneas
			min_height = 10,     -- Número mínimo de líneas
			-- Similar a relative_width, excepto que la altura es relativa a la altura de la ventana
			-- del contorno.
			relative_height = true,
			-- Opción de borde para la ventana flotante de vista previa.
			-- Las opciones incluyen: single/double/rounded/solid/shadow o un array de caracteres
			-- de borde.
			-- Consulta :help nvim_open_win() y busca la opción "border".
			border = 'single',
			-- Opciones winhl para la ventana de vista previa, consulta ':h winhl'
			winhl = 'NormalFloat:',
			-- Pseudo-transparencia de la ventana de vista previa, consulta ':h winblend'
			winblend = 0,
			-- Función experimental que te permite editar el contenido fuente en vivo
			-- en la ventana de vista previa. Como el "editor emergente" de VS Code.
			live = false,
		},


		-- Estos mapeos de teclas pueden ser una cadena o una tabla para múltiples teclas.
		-- Establecer en `{}` para deshabilitar. (Usar 'nil' volverá a las teclas predeterminadas)
		keymaps = {
			show_help = '?',
			close = {'<Esc>', 'q'},
			-- Saltar al símbolo bajo el cursor.
			-- Puede cerrar automáticamente la ventana de contorno cuando se activa, ver
			-- la opción 'auto_close' arriba.
			goto_location = '<Cr>',
			-- Saltar al símbolo bajo el cursor pero mantener el enfoque en la ventana de contorno.
			peek_location = 'o',
			-- Visitar la ubicación en el código y cerrar el contorno inmediatamente
			goto_and_close = '<S-Cr>',
			-- Cambiar la posición del cursor de la ventana de contorno para que coincida con la ubicación actual en el código.
			-- 'Opuesto' a goto/peek_location.
			restore_location = '<C-g>',
			-- Abrir información de símbolo de hover dependiente de LSP/proveedor
			hover_symbol = '<C-space>',
			-- Vista previa del código de ubicación del símbolo bajo el cursor
			toggle_preview = 'K',
			rename_symbol = 'r',
			code_actions = 'a',
			-- Estas acciones de plegado colapsan nodos del árbol, no el plegado de código
			fold = 'h',
			unfold = 'l',
			fold_toggle = '<Tab>',
			-- Alternar plegados para todos los nodos.
			-- Si al menos un nodo está plegado, esta acción plegará todos los nodos.
			-- Si todos los nodos están plegados, esta acción desplegará todos los nodos.
			fold_toggle_all = '<S-Tab>',
			fold_all = 'W',
			unfold_all = 'E',
			fold_reset = 'R',
			-- Moverse hacia abajo/arriba una línea y peek_location inmediatamente.
			-- También puedes usar outline_window.auto_jump=true para hacer esto para cualquier
			-- j/k/<down>/<up>.
			down_and_jump = '<C-j>',
			up_and_jump = '<C-k>',
		},

		providers = {
			priority = { 'lsp', 'coc', 'markdown', 'norg' },
			-- Configuración para cada proveedor (se admiten proveedores de terceros)
			lsp = {
				-- Nombres de clientes LSP a ignorar
				blacklist_clients = {},
			},
			markdown = {
				-- Lista de tipos de archivo soportados para usar el proveedor markdown
				filetypes = {'markdown'},
			},
		},

		symbols = {
			-- Filtrar por tipos (cadena) para símbolos en el contorno.
			-- Los tipos posibles son las claves en la tabla de íconos a continuación.
			-- Una lista de filtros es un string[] con un campo opcional exclude (booleano).
			-- La opción symbols.filter toma ya sea una lista de filtros o pares clave-valor ft:filterList.
			-- Poner exclude=true en la lista de cadenas para filtrar excluyendo la lista de
			-- tipos en su lugar.
			-- Incluir todo excepto String y Constant:
			-- filter = { 'String', 'Constant', exclude = true }
			-- Incluir solo Package, Module y Function:
			-- filter = { 'Package', 'Module', 'Function' }
			-- Ver más ejemplos a continuación.
			filter = nil,
			-- Puedes usar una función personalizada que devuelva el ícono para cada tipo de símbolo.
			-- Esta función toma un tipo (cadena) como parámetro y debe devolver un
			-- ícono como cadena.
			---@param kind string Clave de la tabla de íconos a continuación
			---@param bufnr integer Código del buffer
			---@returns string|boolean La cadena del ícono a mostrar, como "f", o `false`
			---											 para volver a `icon_source`.
			icon_fetcher = nil,
			-- Fuente de terceros para obtener íconos. Esto se utiliza como un respaldo si
			-- icon_fetcher devolvió una cadena vacía.
			-- Valores actualmente soportados: 'lspkind'
			icon_source = nil,
			-- La siguiente opción de respaldo si tanto icon_fetcher como icon_source han fallado, es
			-- el mapeo personalizado de íconos especificado a continuación. La tabla icons también es
			-- necesaria para especificar el grupo hl.
			icons = {
				File = { icon = '󰈔', hl = 'Identifier' },
				Module = { icon = '󰆧', hl = 'Include' },
				Namespace = { icon = '󰅪', hl = 'Include' },
				Package = { icon = '󰏗', hl = 'Include' },
				Class = { icon = '𝓒', hl = 'Type' },
				Method = { icon = 'ƒ', hl = 'Function' },
				Property = { icon = '', hl = 'Identifier' },
				Field = { icon = '󰆨', hl = 'Identifier' },
				Constructor = { icon = '', hl = 'Special' },
				Enum = { icon = 'ℰ', hl = 'Type' },
				Interface = { icon = '󰜰', hl = 'Type' },
				Function = { icon = '', hl = 'Function' },
				Variable = { icon = '', hl = 'Constant' },
				Constant = { icon = '', hl = 'Constant' },
				String = { icon = '𝓐', hl = 'String' },
				Number = { icon = '#', hl = 'Number' },
				Boolean = { icon = '⊨', hl='Boolean' },
				Array= { icon='󰅪', hl='Constant'},
				Object= { icon='⦿', hl='Type'},
				Key= { icon='🔐', hl='Type'},
				Null= { icon='NULL', hl='Type'},
				EnumMember= { icon='', hl='Identifier'},
				Struct= { icon='𝓢', hl='Structure'},
				Event= { icon='🗲', hl='Type'},
				Operator= { icon='+', hl='Identifier'},
				TypeParameter= { icon='𝙏', hl='Identifier'},
				Component= { icon='󰅴', hl='Function'},
				Fragment= { icon='󰅴', hl='Constant'},
				TypeAlias= { icon=' ', hl='Type'},
				Parameter= { icon=' ', hl='Identifier'},
				StaticMethod= { icon=' ', hl='Function'},
				Macro= { icon=' ', hl='Function'},
			},
		},
	}
end

return M
