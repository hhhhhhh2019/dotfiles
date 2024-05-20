return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{"rcarriga/nvim-dap-ui",
			dependencies = "nvim-neotest/nvim-nio"
		},
		"theHamsta/nvim-dap-virtual-text"
	},

	init = function ()
		local dap, dapui = require("dap"), require("dapui")

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" }
		}


		dap.adapters.python = function(cb, config)
			if config.request == 'attach' then
				local port = (config.connect or config).port
				local host = (config.connect or config).host or '127.0.0.1'
				cb({
					type = 'server',
					port = assert(port, '`connect.port` is required for a python `attach` configuration'),
					host = host,
					options = {
						source_filetype = 'python',
					},
				})
			else
				cb({
					type = 'executable',
					command = 'python',
					args = { '-m', 'debugpy.adapter' },
					options = {
						source_filetype = 'python',
					},
				})
			end
		end


		dap.configurations.c = {{
			name = "Launch",
			type = "gdb",
			request = "launch",
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = "${workspaceFolder}",
			stopAtBeginningOfMainSubprogram = false,
		}}
		dap.configurations.cpp = dap.configurations.c
		dap.configurations.rust = dap.configurations.c


		dap.configurations.python = {{
			type = 'python';
			request = 'launch';
			name = "Launch file";

			program = "${file}";
			pythonPath = function()
				local cwd = vim.fn.getcwd()
				if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
					return cwd .. '/venv/bin/python'
				elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
					return cwd .. '/.venv/bin/python'
				else
					return '/usr/bin/python'
				end
			end;
		}}


		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		dapui.setup()

		local sign = vim.fn.sign_define

		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

		vim.api.nvim_set_hl(0, "DapUIStepOverNC", {bg="bg"})
		vim.api.nvim_set_hl(0, "DapUIStepOver", {bg="bg"})
		vim.api.nvim_set_hl(0, "DapUIStepIntoNC", {bg="bg"})
		vim.api.nvim_set_hl(0, "DapUIStepBackNC", {bg="bg"})
		vim.api.nvim_set_hl(0, "DapUIStepOutNC", {bg="bg"})
		vim.api.nvim_set_hl(0, "DapUIStopNC", {bg="bg", fg="red"})
		vim.api.nvim_set_hl(0, "DapUIRestartNC", {bg="bg", fg="red"})
		vim.api.nvim_set_hl(0, "DapUIPlayPause", {bg="bg", fg="green"})
		-- "#A9FF68"


		require("nvim-dap-virtual-text").setup({
			show_stop_reason = true
		})
	end
}
