local M = {}

function M.setup()
	vim.o.foldcolumn = '1' -- '0' is not bad
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	require("ufo").setup({
		provider_selector = function(bufnr, filetype, buftype)
			--[[A function as a selector for fold providers. For now, there are
				'lsp' and 'treesitter' as main provider, 'indent' as fallback provider]]
			return {'treesitter', 'indent'}
		end,
		open_fold_hl_timeout = 400,
		-- open_fold_hl_timeout = 		-- 	Time in millisecond between the range to be highlgihted and to be cleared
		-- while opening the folded line, `0` value will disable the highlight
		-- default = 400
		-- },
		close_fold_kinds_for_ft = {
			default = {}
			-- After the buffer is displayed (opened for the first time), close the
			-- folds whose range with `kind` field is included in this option. For now,
			-- 'lsp' provider's standardized kinds are 'comment', 'imports' and 'region'.
			-- This option is a table with filetype as key and fold kinds as value. Use a
			-- default value if value of filetype is absent.
			-- Run `UfoInspect` for details if your provider has extended the kinds.
			-- default = {default = {}}
		},
		fold_virt_text_handler = nil,
		-- 	A function customize fold virt text, see ### Customize fold text
		-- 	default = nil
		enable_get_fold_virt_text = false,
			-- Enable a function with `lnum` as a parameter to capture the virtual text
			-- for the folded lines and export the function to `get_fold_virt_text` field of
			-- ctx table as 6th parameter in `fold_virt_text_handler`
			-- default = false
		preview = {
			-- Configure the options for preview window and remap the keys for current
			-- buffer and preview buffer if the preview window is displayed.
			-- Never worry about the users's keymaps are overridden by ufo, ufo will save
			-- them and restore them if preview window is closed.
			win_config = {
				border = {'', '─', '', '', '', '─', '', ''},
				winblend = 12,
				winhighlight = 'Normal:Folded',
				maxheight = 20,
			},
			-- mappings = {
			-- 	default = [[see ###Preview function table for detail]],
			-- }
		}
	})
end

return M

