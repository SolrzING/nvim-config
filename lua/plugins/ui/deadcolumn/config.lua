local M = {}

local color_theme = require "plugins.ui.color_scheme.all_color"


--1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
function M.setup()
	require('deadcolumn').setup({
		scope = 'line', ---@type string|fun(): integer
		---@type string[]|fun(mode: string): boolean
		modes = function(mode)
			return mode:find('^[ictRss\x13]') ~= nil
		end,
		blending = {
			threshold = 0.75,
			colorcode = color_theme.main.white,
			hlgroup = { 'Normal', 'bg' },
		},
		warning = {
			alpha = 0.4,
			offset = 0,
			colorcode = color_theme.main.msgwarning,
			hlgroup = { 'Error', 'bg' },
		},
		extra = {
			---@type string?
			follow_tw = nil,
		},
	})
	vim.opt.colorcolumn = "80,120"
end

return M
