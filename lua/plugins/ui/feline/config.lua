local M = {}

function M.setup()
	local line_ok, feline = pcall(require, "feline")
	if not line_ok then
		return
	end

	local color_theme = require "plugins.ui.color_scheme.all_color"

	local alpha = {
		fg = color_theme.main.fg,
		bg = color_theme.main.bg,

		yellow = color_theme.main.yellow,
		blue = color_theme.main.blue,
		red = color_theme.main.red,

		orange = color_theme.main.orange,
		purple = color_theme.main.purple,
		green = color_theme.main.green,

		cyan = color_theme.main.cyan,

		white = color_theme.main.white,
		black = color_theme.main.black,

		error = color_theme.main.msgerror,
		hint = color_theme.main.msghint,
		info = color_theme.main.msginfo,
		warning = color_theme.main.msgwarning,
	}

	local vi_mode_colors = {
		["NORMAL"] = "green",
		["OP"] = "green",
		["INSERT"] = "yellow",
		["VISUAL"] = "cyan",
		["LINES"] = "cyan",
		["BLOCK"] = "darkred",
		["REPLACE"] = "purple",
		["V-REPLACE"] = "purple",
		["ENTER"] = "cyan",
		["MORE"] = "cyan",
		["SELECT"] = "orange",
		["COMMAND"] = "green",
		["SHELL"] = "green",
		["TERM"] = "green",
		["NONE"] = "yellow",
	}

	local vi_mode_text = {
		n =			"NORMAL",
		i =			"INSERT",
		v =			"VISUAL",
		[''] =	"VBLOCK",
		V =			"V-LINE",
		c =			"CMMAND",
		no =		"UNKNOWN",
		s =			"UNKNOWN",
		S =			"UNKNOWN",
		ic =		"UNKNOWN",
		R =			"RPLACE",
		Rv =		"UNKNOWN",
		cv =		"UNKWON",
		ce =		"UNKNOWN",
		r =			"RPLACE",
		rm =		"UNKNOWN",
		t =			"INSERT"
	}

	local c = {
		vim_mode = {
			provider = function()
				return ' ' .. vi_mode_text[vim.fn.mode()] .. ' '
			end,
			hl = function()
				return {
					bg = require("feline.providers.vi_mode").get_mode_color(),
					fg = "bg",
					style = "bold",
					name = "NeovimModeHLColor",
				}
			end,
		},

		neocomposer = {
			provider = function()
				return require('NeoComposer.ui').status_recording() or ""
			end,
			-- hl = {
			-- 	fg = "yellow",
			-- 	bg = "bg",
			-- 	style = "bold",
			-- },
			-- left_sep = "block",
			-- right_sep = "block",
		},


		gitBranch = {
			provider = "git_branch",
			hl = {
				fg = "yellow",
				bg = "bg",
				style = "bold",
			},
			-- left_sep = "block",
			-- right_sep = "block",
		},
		gitDiffAdded = {
			provider = "git_diff_added",
			hl = {
				fg = "green",
				bg = "bg",
			},
			-- left_sep = "block",
			-- right_sep = "block",
		},
		gitDiffRemoved = {
			provider = "git_diff_removed",
			hl = {
				fg = "red",
				bg = "bg",
			},
			-- left_sep = "block",
			-- right_sep = "block",
		},
		gitDiffChanged = {
			provider = "git_diff_changed",
			hl = {
				fg = "blue",
				bg = "bg",
			},
			-- left_sep = "block",
			-- right_sep = "right_filled",
		},


		__ = {
			provider = " ",
			hl = {
				fg = "bg",
				bg = "bg",
			},
		},

		I = {
			provider = "|",
			hl = {
				fg = "fg",
				bg = "bg",
			},
		},


		fileinfo = {
			provider = {
				name = "file_info",
				opts = {
					colored_icon = false,
					type = "full-path",
				},
			},
			short_provider = {
				name = "file_info",
				opts = {
					type = "short-path",
				},
			},
			hl = {
				style = "bold",
			},
			-- left_sep = " ",
			-- right_sep = " ",
		},



		diagnostic_errors = {
			provider = "diagnostic_errors",
			icon = '  ',
			hl = {
				fg = "error",
			},
		},
		diagnostic_warnings = {
			provider = "diagnostic_warnings",
			icon = '  ',
			hl = {
				fg = "warning",
			},
		},
		diagnostic_info = {
			provider = "diagnostic_info",
			icon = '  ',
			hl = {
				fg = "info",
			},
		},
		diagnostic_hints = {
			provider = "diagnostic_hints",
			icon = ' 󰌵 ',
			hl = {
				fg = "hint",
			},
		},



		lsp_client_names = {
			provider = "lsp_client_names",
			hl = {
				fg = "bg",
				bg = "yellow",
				style = "bold",
			},
			left_sep = "block",
			right_sep = "block",
		},
		file_type = {
			provider = {
				name = "file_type",
				opts = {
					filetype_icon = false,
					case = "titlecase",
				},
			},
			hl = {
				fg = "bg",
				bg = "blue",
				style = "bold",
			},
			left_sep = "block",
			right_sep = "block",
		},
		file_encoding = {
			provider = "file_encoding",
			hl = {
				fg = "white",
				bg = "bg",
				style = "italic",
			},
			-- left_sep = "block",
			-- right_sep = "block",
		},
		position = {
			provider = "position",
			hl = {
				fg = "green",
				bg = "bg",
				style = "bold",
			},
			-- left_sep = "block",
			-- right_sep = "block",
		},
		line_percentage = {
			provider = "line_percentage",
			hl = {
				fg = "cyan",
				bg = "bg",
				style = "bold",
			},
			-- left_sep = "block",
			-- right_sep = "block",
		},
	}

	local left_1 = {
		c.vim_mode,
		c.__,
		c.neocomposer,
		-- c.I,
		-- c.__,
		c.gitBranch,
		c.gitDiffAdded,
		c.gitDiffRemoved,
		c.gitDiffChanged,
		-- c.__,
		-- c.I,
		-- c.__,
		-- c.fileinfo,
	}

	local left_2 = {
		c.__,
	}

	local right_2 = {

	}

	local right_1 = {
		c.diagnostic_errors,
		c.diagnostic_warnings,
		c.diagnostic_info,
		c.diagnostic_hints,
		c.__,
		c.lsp_client_names,
		c.file_type,
		c.__,
		c.file_encoding,
		c.__,
		c.position,
		c.__,
		c.line_percentage,
		c.__,
	}

	local left_inac = {
		c.file_type,
	}

	local components = {
		active = {
			left_1,
			--left_2,
			--right_2,
			right_1
		},
		inactive = {
			left_inac,
		},
	}

	feline.setup({
		components = components,
		theme = alpha,
		vi_mode_colors = vi_mode_colors,
		-- force_inactive = {
		-- 	filetypes = {
		-- 		"neo-tree",
		-- 		"Neo-tree",
		-- 		"^neo-tree$",
		-- 		"^Neo-tree$'",
		-- 		"help",
		-- 	},
		-- 	buftypes = {
		-- 		"neo-tree",
		-- 		"Neo-tree",
		-- 		"^neo-tree$",
		-- 		"^Neo-tree$'",
		-- 	},
		-- },
	})
end

return M
