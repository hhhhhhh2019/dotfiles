local wk = require "which-key"
local ts = require "telescope.builtin"
local ext = require "telescope".extensions
local dap = require "dap"
local dapui = require "dapui"

wk.add({
	{ "<space>d", desc = "Debugger", mode = "n" },
	{ "<space>db", dap.toggle_breakpoint, desc = "Toggle Breakpoint", mode = "n" },
	{ "<space>dt", dapui.toggle, desc = "Toggle DapUI", mode = "n" },
	{ "<space>dc", dap.continue, desc = "Continue", mode = "n" },
	{ "<space>ds", dap.step_into, desc = "Step Into", mode = "n" },
	{ "<space>do", dap.step_over, desc = "Step Over", mode = "n" },
	{ "<space>de", dap.step_out, desc = "Step Out", mode = "n" },

	{ "<space>f", desc = "Telescope", mode = "n" },
	{ "<space>ff", ext.file_browser.file_browser, desc = "File Browser", mode = "n" },
	{ "<space>fb", ts.buffers, desc = "List Buffers", mode = "n" },
	{ "<space>fg", ts.live_grep, desc = "Live Grep", mode = "n" },
	{ "<space>fu", ext.undo.undo, desc = "Undo", mode = "n" },

	{ "<space>c", desc = "Code", mode = "n" },
	{ "<space>cq", ts.quickfix, desc = "Quick Fix", mode = "n" },
	{ "<space>cd", ts.diagnostics, desc = "Diagnostic", mode = "n" },
	{ "<space>cr", ts.lsp_references, desc = "List References", mode = "n" },
	{ "<space>cd", ts.lsp_definitions, desc = "List Defenitions", mode = "n" },
	{ "<space>ct", ts.lsp_type_definitions, desc = "List Type Defenitions", mode = "n" },

	{ "<space>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", desc = "Close Buffer", mode = "n" },
})
