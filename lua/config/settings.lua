vim.g.mapleader = " " --tecla lider
vim.g.maplocalleader = ','

vim.o.number = true --Enumeracion
--vim.o.relativenumber = true --Enumeracion relativa
vim.o.clipboard = "unnamedplus"
vim.o.encoding = "utf-8"
vim.o.ruler = true
vim.o.mouse = "a"
vim.o.mousemoveevent = true

vim.g.terminal_emulator = 'alacritty'
vim.opt.autochdir = true

vim.o.cmdheight = 0

--Opciones de tabulacion
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
--vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.shiftwidth = 4

vim.opt.wrap = false  -- Salto de línea

-- Configuración específica para archivos Python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = false
	end,
})

vim.opt.termguicolors = true

vim.cmd[[set formatoptions-=ro]]
