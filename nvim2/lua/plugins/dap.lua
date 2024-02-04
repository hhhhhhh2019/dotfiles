return {
	{"mfussenegger/nvim-dap",
		dependencies = {"rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text"},
config = function()
	local dap, dapui = require("dap"), require("dapui")

	dap.adapters.codelldb = {
		type = 'server',
		port = "${port}",
		executable = {
			command = '/usr/bin/codelldb',
			args = {"--port", "${port}"},
		}
	}

	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
		},
	}

	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp


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


	dap.configurations.python = {
		{
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
		},
	}


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


	require("nvim-dap-virtual-text").setup({
		show_stop_reason = false
	})
end},
}
