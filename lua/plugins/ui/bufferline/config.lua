local M = {}

function M.setup()
	require("bufferline").setup({
		options = {
			mode = "buffers", --opciones: "tabs" | "buffers"
			separator_style = "thin",
			numbers = "ordinal",

			close_command = "Bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
			right_mouse_command = "", -- can be a string | function | false, see "Mouse actions"
			left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
			middle_mouse_command = nil,

			offsets = {
				{
					filetype = "neo-tree",
					text = "Explorador",
					highlight = "Directory",
					text_align = "center",
					separator = true
				}
			},
			hover = {
				enabled = true,
				delay = 0,
				reveal = {'close'}
			},
			diagnostics = "nvim_lsp",
		}
	})
end

return M


