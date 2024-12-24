-- funcion que establece el directorio actual de trabajo
local function init_dir()
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			local dir = vim.fn.argc() > 0 and vim.fn.argv(0) or vim.fn.getcwd()
			vim.cmd("cd " .. dir)
		end,
	})
end

init_dir()
