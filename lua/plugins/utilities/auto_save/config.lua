local M = {}

function M.setup()
	require('auto-save').setup({
		enabled = true, -- iniciar auto-guardado cuando se carga el plugin (es decir, cuando tu gestor de paquetes lo carga)
		execution_message = {
			enabled = true,
			message = function() -- mensaje a imprimir al guardar
				return ("AutoSave: guardado a las " .. vim.fn.strftime("%H:%M:%S"))
			end,
			dim = 0.18, -- atenuar el color del `mensaje`
			cleaning_interval = 1250, -- (milisegundos) limpiar automáticamente MsgArea después de mostrar el `mensaje`. Ver :h MsgArea
		},
		trigger_events = { -- Ver :h events
			immediate_save = { "BufLeave", "FocusLost" }, -- eventos de vim que desencadenan un guardado inmediato
			defer_save = { "InsertLeave", "TextChanged" }, -- eventos de vim que desencadenan un guardado diferido (guarda después de `debounce_delay`)
			cancel_defered_save = { "InsertEnter" }, -- eventos de vim que cancelan un guardado diferido pendiente
		},
		-- función que toma el manejador del buffer y determina si se debe guardar el buffer actual o no
		-- devolver true: si el buffer está bien para ser guardado
		-- devolver false: si no está bien para ser guardado
		-- si se establece en `nil`, entonces no se aplica ninguna condición específica
		condition = nil,
		write_all_buffers = false, -- escribir todos los buffers cuando el actual cumpla con `condition`
		noautocmd = false, -- no ejecutar autocmds al guardar
		lockmarks = false, -- bloquear marcas al guardar, ver `:h lockmarks` para más detalles
		debounce_delay = 1000, -- retraso después del cual se ejecuta un guardado pendiente
		-- registrar mensajes de depuración en el archivo 'auto-save.log' en el directorio de caché de neovim, establecer en `true` para habilitar
		debug = false,
	})
end

return M
