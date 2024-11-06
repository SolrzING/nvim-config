local M = {}

function M.setup()
	local ccc = require("ccc")
	local mapping = ccc.mapping

	ccc.setup({
		-- Your preferred settings
		-- Example: enable highlighter
		highlighter = {
			auto_enable = true,
			lsp = true,
		},
	})
end

return M
