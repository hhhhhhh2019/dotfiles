return {
	"luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	config = function ()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			setopt = true,
			segments = {
				{sign = {name = {"Dap"}}},
				{sign = {namespace = {"diagnostic"}}},
				{text = {builtin.foldfunc}},
				{text = {builtin.lnumfunc}},
				{sign = {namespace = {"gitsign"}}},
			},
			ft_ignore = {
				"dap-repl","dapui_breakpoints","dapui_console","dapui_scopes",
				"dapui_watches","dapui_stacks",
			},
			bt_ignore = {
				"dap-repl","dapui_breakpoints","dapui_console","dapui_scopes",
				"dapui_watches","dapui_stacks",
			},
		})
	end
}
