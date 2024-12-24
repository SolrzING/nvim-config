local M = {}



function M.setup()
	---@alias lazydev.Library {path:string, words:string[], mods:string[]}
	---@alias lazydev.Library.spec string|{path:string, words?:string[], mods?:string[]}
	---@class lazydev.Config

	require('lazydev').setup({
		runtime = vim.env.VIMRUNTIME --[[@as string]],
		library = { ---@type lazydev.Library.spec[]
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},	integrations = {
			-- Fixes lspconfig's workspace management for LuaLS
			-- Only create a new workspace if the buffer is not part
			-- of an existing workspace or one of its libraries
			lspconfig = true,
			-- add the cmp source for completion of:
			-- `require "modname"`
			-- `---@module "modname"`
			cmp = true,
			-- same, but for Coq
			coq = false,
		},
		---@type boolean|(fun(root:string):boolean?)
		enabled = function(root_dir)
			return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
		end,
	})
end

return M