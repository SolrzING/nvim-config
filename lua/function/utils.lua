local M = {}



function M.list_to_table(list)
	local set = {}
	for _, v in ipairs(list) do
		set[v] = true
	end
	return set
end

function M.filter_buffer(buffers, buftype_set, filetype_set)
	local buffers_list = {}

	for _, buf in ipairs(buffers) do
		local buf_type = vim.bo[buf.bufnr].buftype
		local file_type = vim.bo[buf.bufnr].filetype
		if not buftype_set[buf_type] and not filetype_set[file_type] then
			table.insert(buffers_list, buf)
		end
	end

	return buffers_list
end



return M
