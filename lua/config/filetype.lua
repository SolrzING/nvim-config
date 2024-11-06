vim.filetype.add({
	-- Detectar y asignar el tipo de archivo según la extensión del nombre de archivo
	extension = {
		mcfunction = "mcfunction",  -- Añadir la extensión .mcfunction
	},
	-- Detectar y aplicar tipos de archivo según el nombre completo del archivo
	filename = {
		--[[
		[".env"] = "dotenv",
		["env"] = "dotenv",
		["tsconfig.json"] = "jsonc",
		]]
	},
	-- Detectar y aplicar tipos de archivo según ciertos patrones en los nombres de archivo
	pattern = {
		-- INFO: Coincide con nombres de archivo como - ".env.example", ".env.local", etc.
		
		-- ["%.env%.[%w_.-]+"] = "dotenv",
	},
})
