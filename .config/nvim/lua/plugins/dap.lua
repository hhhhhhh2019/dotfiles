return {
-- {
-- 	"rcarriga/nvim-dap-ui",
-- 	name = "dapui",
-- 	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
-- 	opts = {},
-- 	config = function(opts)
-- 		local dap, dapui = require("dap"), require("dapui")
--
-- 		dapui.setup(opts)
--
-- 		dap.listeners.before.attach.dapui_config = function()
-- 			dapui.open()
-- 		end
--
-- 		dap.listeners.before.launch.dapui_config = function()
-- 			dapui.open()
-- 		end
--
-- 		dap.listeners.before.event_terminated.dapui_config = function()
-- 			dapui.close()
-- 		end
--
-- 		dap.listeners.before.event_exited.dapui_config = function()
-- 			dapui.close()
-- 		end
-- 	end
-- },
{
	"theHamsta/nvim-dap-virtual-text",
	dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
	opts = {}
},
{
	"https://github.com/igorlfs/nvim-dap-view",
	dependencies = { "mfussenegger/nvim-dap" },
	opts = {}
},
}
