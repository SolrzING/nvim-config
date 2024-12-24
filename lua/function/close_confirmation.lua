local M = {}

local list_to_table = require("function.utils").list_to_table
local filter_buffer = require("function.utils").filter_buffer
local menu_close = require("function.nui.menu_close_confirmation").menu_close



function M.close_confirmation()
	local buftype_list_for_not_save = {
		"terminal",
		"help",
		"nofile",
	}
	local buftype_list_for_not_count = {
		-- "terminal",
		-- "help",
		-- "nofile",
	}

	local filetype_list_for_not_save = {
		"incline",
		-- "neo-tree",
	}
	local filetype_list_for_not_count = {
		"incline",
		-- "neo-tree",
		"notify",
		"noice",
	}


	-- Convertir las listas a tablas
	local buftype_set_for_not_save = list_to_table(buftype_list_for_not_save)
	local buftype_set_for_not_count = list_to_table(buftype_list_for_not_count)
	local filetype_set_for_not_save = list_to_table(filetype_list_for_not_save)
	local filetype_set_for_not_count = list_to_table(filetype_list_for_not_count)


	local modified_buffers = vim.fn.getbufinfo({bufmodified = 1}) -- Obtener info de todos los buffer modificados
	-- Filtrar los buffers que se pueden guardar
	local saveable_buffers = filter_buffer(modified_buffers, buftype_set_for_not_save, filetype_set_for_not_save)
	-- for _, win in ipairs(saveable_buffers) do
	-- 	vim.notify("Split ID: " .. win.winid .. ", Buffer: " .. win.bufnr .. ", Filetype: " .. vim.bo[win.bufnr].filetype .. ", Buftype: " .. vim.bo[win.bufnr].buftype, vim.log.levels.INFO)
	-- end



	local splits = vim.fn.getwininfo()  -- Obtener información de todas las ventanas
	-- Obtener los splits que hay en la ventana actual
	local splits_filtrados = filter_buffer(splits, buftype_set_for_not_count, filetype_set_for_not_count)
	-- for _, win in ipairs(splits_filtrados) do
	-- 	vim.notify("Split ID: " .. win.winid .. ", Buffer: " .. win.bufnr .. ", Filetype: " .. vim.bo[win.bufnr].filetype .. ", Buftype: " .. vim.bo[win.bufnr].buftype, vim.log.levels.INFO)
	-- end



	-- vim.notify(#saveable_buffers .. " " .. #splits_filtrados)
    if #saveable_buffers > 0 and #splits_filtrados <= 1 then
 		menu_close(saveable_buffers)
	else
		vim.cmd('quit')
	end
end

return M
