local M = {}


function M.menu_close(saveable_buffers)
	local Layout = require("nui.layout")
	local Popup = require("nui.popup")


	local menu_bg = Popup({
		position = {
			row = "25%",
			col = "50%",
		},
		size = {
			width = 49,
			height = 1,
		},
		enter = true,
		focusable = true,
		zindex = 50,
		relative = "editor",
		border = {
			-- padding = {
			-- 	top = 2,
			-- 	bottom = 2,
			-- 	left = 3,
			-- 	right = 3,
			-- },
			style = "rounded",
			text = {
				top = {{" ¿Desea Guardar antes de Salir? ", "WarningFloat"}},
				top_align = "center",
			},
		},
		buf_options = {
			modifiable = true,
			readonly = false,
		},
		win_options = {
			winblend = 10,
			winhighlight = "Normal:WarningFloat,FloatBorder:WarningFloat",
		},
	})

	local function options_button(row, col, width, height)
		return {
			position = {
				row = row,
				col = col,
			},
			size = {
				width = width,
				height = height,
			},
			enter = true,
			focusable = true,
			zindex = 51,
			relative = "editor",
			border = {
				padding = {
					-- top = 2,
					-- bottom = 2,
					left = 2,
					right = 2 -1,
				},
				style = "double",
			},
			buf_options = {
				modifiable = true,
				readonly = false,
			},
			win_options = {
				winblend = 10,
				winhighlight = "Normal:InfoFloat,FloatBorder:InfoFloat",
			},
		}
	end

	local button_yes = Popup(options_button("25%", "37%", 8, 1))
	local button_no = Popup(options_button("25%", "46%", 8, 1))
	local button_cancel = Popup(options_button("25%", "60%", 12, 1))

	menu_bg:mount()


	-- Configuracion para el desplazamiento entre botones-
	local button_focus = 3
	local function focus_item(action)
		if action == "pre" then
			button_focus = button_focus -1
		elseif action == "next" then
			button_focus = button_focus +1
		end

		if button_focus < 1 then
			button_focus = 3
		elseif button_focus > 3 then
			button_focus = 1
		end

		if button_focus == 1 then
			-- vim.notify("opcion 1")
			-- vim.api.nvim_set_current_buf(button_yes.bufnr)
			vim.api.nvim_set_current_win(button_yes.winid)
			-- vim.notify(button_yes.winid)
			-- vim.api.nvim_win_set_cursor(button_yes.winid, {1, 0})
		elseif button_focus == 2 then
			-- vim.notify("opcion 2")
			-- vim.api.nvim_set_current_buf(button_no.bufnr)
			vim.api.nvim_set_current_win(button_no.winid)
			-- vim.notify(button_no.winid)
			-- vim.api.nvim_win_set_cursor(button_no.winid, {1, 0})
		elseif button_focus == 3 then
			-- vim.notify("opcion 3")
			-- vim.api.nvim_set_current_buf(button_cancel.bufnr)
			vim.api.nvim_set_current_win(button_cancel.winid)
			-- vim.notify(button_cancel.winid)
			-- vim.api.nvim_win_set_cursor(button_cancel.winid, {1, 0})
		end
	end

	local function keymap_focus_item(item)
		item:map('n', 'h', function () focus_item("pre") end, { noremap = true, silent = true })
		item:map('n', 'l', function () focus_item("next") end, { noremap = true, silent = true })
	end

	keymap_focus_item(button_yes)
	keymap_focus_item(button_no)
	keymap_focus_item(button_cancel)


	-- Configuracion de la distribucion de los botones
	local gap = Popup({
		enter = false,
		focusable = false,
		zindex = 51,
		relative = "editor",
		buf_options = {
			modifiable = false,
			readonly = false,
		},
		win_options = {
			winhighlight = "Normal:InfoFloat,FloatBorder:InfoFloat",
		},
	})

	local layout = Layout({
			relative = {
				type = "win",
				winid = menu_bg.winid,
			},
			position = {
				row = 0,
				col = -1,
			},
			size = {
				width = 51,
				height = 3,
			},
		},
		Layout.Box({
			Layout.Box(gap, {
				size = {
					width = 3,
					height = 0,
				},
			}),
			Layout.Box(button_yes, {
				size = {
					width = 8,
					height = 3,
				},
			}),
			Layout.Box(gap, {
				size = {
					width = 3,
					height = 0,
				},
			}),
			Layout.Box(button_no, {
				size = {
					width = 8,
					height = 3,
				},
			}),
			Layout.Box(gap, {
				size = {
					width = 12,
					height = 0,
				},
			}),
			Layout.Box(button_cancel, {
				size = {
					width = 14,
					height = 3,
				},
			}),
			Layout.Box(gap, {
				size = {
					width = 3,
					height = 0,
				},
			}),
		}, { dir = "row" })
	)

	layout:mount()


	-- Configurar el texto que contiene los botones-
	local NuiText = require("nui.text")

	local linenr_start, byte_start, linenr_end, byte_end = 1, 0, 1, 0


	local function add_text(text, item)
		local bufnr, ns_id = item.bufnr, item.ns_id
		local item_text = NuiText(text)
		item_text:render(bufnr, ns_id, linenr_start, byte_start, linenr_end, byte_end)
		vim.bo[bufnr].modifiable = false
	end

	add_text("Si", button_yes)
	add_text("No", button_no)
	add_text("Cancelar", button_cancel)


	-- Configuracion de la accion salir
	local function action_exit()
		menu_bg:unmount()
		button_yes:unmount()
		button_no:unmount()
		button_cancel:unmount()
		layout:unmount()
		gap:unmount()
	end

	menu_bg:map("n", "<esc>", action_exit, { noremap = true })
	button_yes:map("n", "<esc>", action_exit, { noremap = true })
	button_no:map("n", "<esc>", action_exit, { noremap = true })
	button_cancel:map("n", "<esc>", action_exit, { noremap = true })


	-- Configuracion de las acciones que se ejecutan al ejecutar la(s) tecla(s) de accion
	local function on_button_click(bufnr)
		local quit_boolean = true
		local quitall_boolean = false
		if bufnr == button_yes.bufnr then
			-- vim.notify("acción 1")
			-- Guarda todos los buffers modificados que se pueden guardar
			for _, buf in ipairs(saveable_buffers) do
				vim.api.nvim_buf_call(buf.bufnr, function()
					vim.cmd('write')
				end)
			end
		elseif bufnr == button_no.bufnr then
			-- vim.notify("acción 2")
			quit_boolean = false
			quitall_boolean = true
		elseif bufnr == button_cancel.bufnr then
			-- vim.notify("acción 3")
			quit_boolean = false
		end
		action_exit()

		if quit_boolean then
			-- vim.notify("cerrar")
			vim.cmd('quit')
		elseif quitall_boolean then
			-- vim.notify("cerrar todo")
			vim.cmd('quit!')
		end
	end
	button_yes:map('n', '<CR>', function () on_button_click(button_yes.bufnr) end, { noremap = true, silent = true })
	button_no:map('n', '<CR>', function () on_button_click(button_no.bufnr) end , { noremap = true, silent = true })
	button_cancel:map('n', '<CR>', function () on_button_click(button_cancel.bufnr) end , { noremap = true, silent = true })


end

return M

