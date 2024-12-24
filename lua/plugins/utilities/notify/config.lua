local M = {}

function M.setup()
	require("notify").setup {
		render = "wrapped-compact",
		stages = "fade_in_slide_out",
		background_colour = "NotifyBackground",
		timeout = 3000,
	}
	vim.notify = require("notify")

	require("telescope").load_extension("notify")
end

return M
