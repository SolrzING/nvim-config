local keymap = require("function.keymap").keymap

local close_confirmation = require("function.close_confirmation").close_confirmation



keymap({"v"		}, "<Tab>",			">gv",						{ desc = "Tabulacion" })
keymap({"v"		}, "<S-Tab>",		"<gv",						{ desc = "Tabulacion Inversa" })

keymap({"n"		}, "<C-s>",			function()
	local last_save_time = 0
	local save_cooldown = 1000 -- Tiempo en milisegundos

    local current_time = vim.loop.now()
    if current_time - last_save_time >= save_cooldown then
        vim.cmd("w")
        last_save_time = current_time
    end
end,					{ desc = "Guardar Archivo" })

keymap({"n"		}, "<C-q>",			close_confirmation,	{ desc = "Cerrar Archivo" })

keymap({"v"		}, "<C-c>",			"\"+y",						{ desc = "Copiar" })
keymap({"v"		}, "<C-x>",			"\"+x",						{ desc = "Cortar" })

-- keymap({"n","v"	}, "<C-v>",			'"+p',						{ desc = "Pegar" })
keymap({"n","v"	}, "<C-v>",		function ()
	local clipboard = vim.fn.getreg("+")
	vim.api.nvim_command([[normal! "+p]])
	vim.fn.setreg("+", clipboard)
end , { desc = "Copiar sin perdida" })
keymap({"i"		}, "<C-v>",			'<C-o>"+P',					{ desc = "Pegar" })

keymap({"n","v"	}, "<C-z>",			"u",						{ desc = "Deshacer" })
keymap({"n","v"	}, "<C-y>",			"<C-r>",					{ desc = "Rehacer" })


keymap({"n","v"	}, "<leader>t1", function ()
	vim.notify('Testeando\n\n', "error", { title='Experimentando'})
	vim.notify('Testeando', "warn", { title='Experimentando'})
	vim.notify('Testeandooooooooooooo', "", { title='Experimentando'})
end, {desc = ""})
keymap({"n","v"	}, "<leader>t2", function ()
	 local input = vim.fn.input("¿Guardar antes de Salir? Si:s/No:n/Cancelar:c")
	 vim.notify(input)
 end, {desc = ""})
keymap({"n","v"	}, "<leader>t3", function ()
	 local input = vim.fn.confirm("¿Guardar antes de Salir? Si:s/No:n/Cancelar:c", "&Si\n&No\n&Cancelar", 1)
	 vim.notify(input)
end, {desc = ""})
keymap({"n","v"	}, "<leader>t4", function ()
	local input = vim.ui.select({"type1","type2"}, {
			prompt = 'Seleccione una opcion:',
			format_item = function(item)
				return "Las opciones son: " .. item
			end,
		},
		function(choice)
		end
	)
	vim.notify(input)

end, {desc = ""})

keymap({"n","v"	}, "<leader>t5", function ()

end, {desc = ""})
keymap({"n","v"	}, "<leader>t6", function ()

end, {desc = ""})
