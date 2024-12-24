local M = {}



function M.setup()
	require('grug-far').setup({
		windowCreationCommand = 'botright split',
		engines = {
			-- see https://github.com/BurntSushi/ripgrep
			ripgrep = {
				-- ripgrep executable to use, can be a different path if you need to configure
				path = 'rg',

				-- extra args that you always want to pass
				-- like for example if you always want context lines around matches
				extraArgs = '',

				-- whether to show diff of the match being replaced as opposed to just the
				-- replaced result. It usually makes it easier to understand the change being made
				showReplaceDiff = true,

				-- placeholders to show in input areas when they are empty
				-- set individual ones to '' to disable, or set enabled = false for complete disable
				placeholders = {
					-- whether to show placeholders
					enabled = true,

					search = '"foo" | "foo([a-z0-9]*)" | "fun\\("',
					replacement = '"bar" | "${1}_foo" | "$$MY_ENV_VAR"',
					replacement_lua = 'if vim.startsWith(match, "use") \\n then return "employ" .. match \\n else return match end',
					filesFilter = '"*.lua" | "*.{css,js}" | "**/docs/*.md" | "(specify one per line)"',
					flags = '--help --ignore-case (-i) --replace= (empty replace) --multiline (-U)',
					paths = '"/dir/folder" | "../" | "./name\\ file/" | "./dir/file.lua" | "~/.dir"',
				},
			},
		},
		keymaps = {
			replace = { n = '<localleader>r' },
			qflist = { n = '<localleader>q' },
			syncLocations = { n = '<localleader>s' },
			syncLine = { n = '<localleader>l' },
			close = { n = '<esc>' },
			historyOpen = { n = '<localleader>t' },
			historyAdd = { n = '<localleader>a' },
			refresh = { n = '<localleader>f' },
			openLocation = { n = '<localleader>o' },
			openNextLocation = { n = '<down>' },
			openPrevLocation = { n = '<up>' },
			gotoLocation = { n = '<enter>' },
			pickHistoryEntry = { n = '<enter>' },
			abort = { n = '<localleader>b' },
			help = { n = 'g?' },
			toggleShowCommand = { n = '<localleader>p' },
			swapEngine = { n = '<localleader>e' },
			previewLocation = { n = '<localleader>i' },
			swapReplacementInterpreter = { n = '<localleader>x' },
			applyNext = { n = '<localleader>j' },
			applyPrev = { n = '<localleader>k' },
		},
	})
end

return M
