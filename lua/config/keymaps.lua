local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

keymap({"v"		}, "<Tab>",			">gv",				extend('force', opts, { desc = "Tabulacion" }))
keymap({"v"		}, "<S-Tab>",		"<gv",				extend('force', opts, { desc = "Tabulacion Inversa" }))

keymap({"n"		}, "<C-s>",			":w<cr>",			extend('force', opts, { desc = "Guardar Archivo" }))
keymap({"n"		}, "<C-q>",			":q<cr>",			extend('force', opts, { desc = "Cerrar Archivo" }))

keymap({"v"		}, "<C-c>",			"\"+y",				extend('force', opts, {desc = "Copiar"}))
keymap({"v"		}, "<C-x>",			"\"+x",				extend('force', opts, {desc = "Cortar"}))

keymap({"n","v"	}, "<C-v>",			'"+p',				extend('force', opts, {desc = "Pegar"}))
keymap({"i"		}, "<C-v>",			'<C-o>"+P',		extend('force', opts, {desc = "Pegar"}))

keymap({"n","v"	}, "<C-z>",			"u",				extend('force', opts, {desc = "Deshacer"}))
keymap({"n","v"	}, "<C-y>",			"<C-r>",			extend('force', opts, {desc = "Rehacer"}))

