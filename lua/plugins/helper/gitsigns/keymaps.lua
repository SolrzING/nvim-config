local M = {}

function M.setup()
	require('gitsigns').setup{
		on_attach = function(bufnr)
			local gitsigns = require('gitsigns')

			local function keymap(mode, key_action, command_action, specific_opts)
				local general_opts = { noremap = true, silent = true }
				local opts = vim.tbl_extend('force', general_opts, specific_opts or {})
				opts.buffer = bufnr
				vim.keymap.set(mode, key_action, command_action, opts)
			end

			-- Navigation
			keymap('n', '<leader>gj', function()
				if vim.wo.diff then
				vim.cmd.normal({']c', bang = true})
				else
				gitsigns.nav_hunk('next')
				end
			end)

			keymap('n', '<leader>gk', function()
				if vim.wo.diff then
				vim.cmd.normal({'[c', bang = true})
				else
				gitsigns.nav_hunk('prev')
				end
			end)

			-- Actions
			keymap('n', '<leader>gs', gitsigns.stage_hunk, { desc = "Git stage hunk" })
			keymap('n', '<leader>gr', gitsigns.reset_hunk, { desc = "Git reset hunk" })
			keymap('v', '<leader>gs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Git stage hunk" })
			keymap('v', '<leader>gr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Git reset hunk" })
			keymap('n', '<leader>gS', gitsigns.stage_buffer, { desc = "Git stage buffer" })
			keymap('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = "Git undo stage hunk" })
			keymap('n', '<leader>gR', gitsigns.reset_buffer, { desc = "Git reset buffer" })
			keymap('n', '<leader>gp', gitsigns.preview_hunk, { desc = "Git preview hunk" })
			keymap('n', '<leader>gb', function() gitsigns.blame_line{full=true} end)
			keymap('n', '<leader>gb', gitsigns.toggle_current_line_blame)
			keymap('n', '<leader>gdi', gitsigns.diffthis)
			keymap('n', '<leader>gD', function() gitsigns.diffthis('~') end)
			keymap('n', '<leader>gdd', gitsigns.toggle_deleted, { desc = "Git toggle deleted" })

			-- Text object
			keymap({'o', 'x'}, '<leader>gh', ':<C-U>Gitsigns select_hunk<CR>')
		end
	}
end

return M
