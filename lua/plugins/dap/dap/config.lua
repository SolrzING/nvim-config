local M = {}

local dap = require("dap")
local dapui = require("dapui")
local dapython =	require("dap-python")

function M.setup()
	dapui.setup()
	dapython.setup("python")


	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end

return M
