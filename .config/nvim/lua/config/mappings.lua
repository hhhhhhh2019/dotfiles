local wk  = require("which-key")
local tsb = require("telescope.builtin")
local tse = require("telescope").extensions


wk.add({
	{"<space>f", group="telescope"},
	{"<space>ff", tse.file_browser.file_browser, desc="file browser", mode="n"},
	{"<space>fg", tsb.live_grep, desc="live grep", mode="n"},
	{"<space>ft", tsb.treesitter, desc="treesitter", mode="n"},
	{"<space>fu", tse.undo.undo, desc="undo history", mode="n"},

	{"<space>b", group="buffers"},
	{"<space>bd", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", desc="close buffer", mode="n"},
	{"<space>bb", tsb.buffers, desc="list buffers", mode="n"},

	{"<space>c", group="code"},
	{"<space>cr", "<cmd>IncRename<cr>", desc="renamer"},
	{"<space>cd", group="diffview"},
	{"<space>cdo", "<cmd>DiffviewOpen<cr>", desc="open diffview"},
	{"<space>cdc", "<cmd>DiffviewClose<cr>", desc="close diffview"},

	{"<space>d", group="LSP"},
	{"<space>dq", vim.lsp.buf.code_action, desc="list quick fixes"},
	{"<space>dd", tsb.diagnostics, desc="list diagnostics"},
	{"<space>dr", tsb.lsp_references, desc="references for word under the cursor"},
	{"<space>df", vim.diagnostic.open_float, desc="open float diagnostic"},
	{"<space>dh", vim.lsp.buf.hover, desc="open hover documentation"},

	{"<F2>", require("dap").toggle_breakpoint, desc="toggle breakpoint"},
	{"<F5>", require("dap").continue, desc="continue debugging"},
	{"<F12>", function()
		require("dapui").eval(vim.fn.input("Eval: "))
	end, desc="eval expression"},
	{"<F11>", require("dap").step_into, desc="step into"},
	{"<F10>", require("dap").step_over, desc="step over"},
	{"<F9>", require("dap").step_out, desc="step out"},
})


vim.keymap.set('n', '<C-S-Down>', ':move +1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Up>',  ':move -2<CR>', { noremap = true, silent = true })

vim.keymap.set('v', '<C-S-Down>', ':MoveBlock(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Up>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Left>', ':MoveHBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Right>', ':MoveHBlock(1)<CR>', { noremap = true, silent = true })

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })
