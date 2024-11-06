local M = {}

-- local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local extend = vim.tbl_extend

function M.setup()
	-- keymap({ "n", "v" }, "<leader>+", ":command<CR>", extend('force', opts, { desc = "Description" }))
	require('gitsigns').setup{
		on_attach = function(bufnr)
		local gitsigns = require('gitsigns')

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', '<leader>gj', function()
			if vim.wo.diff then
			vim.cmd.normal({']c', bang = true})
			else
			gitsigns.nav_hunk('next')
			end
		end)

		map('n', '<leader>gk', function()
			if vim.wo.diff then
			vim.cmd.normal({'[c', bang = true})
			else
			gitsigns.nav_hunk('prev')
			end
		end)

		-- Actions
		map('n', '<leader>gs', gitsigns.stage_hunk, extend('force', opts, { desc = "Git stage hunk" }))
		map('n', '<leader>gr', gitsigns.reset_hunk, extend('force', opts, { desc = "Git reset hunk" }))
		map('v', '<leader>gs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, extend('force', opts, { desc = "Git stage hunk" }))
		map('v', '<leader>gr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, extend('force', opts, { desc = "Git reset hunk" }))
		map('n', '<leader>gS', gitsigns.stage_buffer, extend('force', opts, { desc = "Git stage buffer" }))
		map('n', '<leader>gu', gitsigns.undo_stage_hunk, extend('force', opts, { desc = "Git undo stage hunk" }))
		map('n', '<leader>gR', gitsigns.reset_buffer, extend('force', opts, { desc = "Git reset buffer" }))
		map('n', '<leader>gp', gitsigns.preview_hunk, extend('force', opts, { desc = "Git preview hunk" }))
		map('n', '<leader>gb', function() gitsigns.blame_line{full=true} end)
		map('n', '<leader>gb', gitsigns.toggle_current_line_blame)
		map('n', '<leader>gdi', gitsigns.diffthis)
		map('n', '<leader>gD', function() gitsigns.diffthis('~') end)
		map('n', '<leader>gdd', gitsigns.toggle_deleted, extend('force', opts, { desc = "Git toggle deleted" }))

		-- Text object
		map({'o', 'x'}, '<leader>gh', ':<C-U>Gitsigns select_hunk<CR>')
		end
	}
end

return M
