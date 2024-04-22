local wk = require("which-key")
local tsb = require("telescope.builtin")
local tse = require("telescope").extensions


wk.register({
	["<space>f"] = {
		name = "telescope",

		["f"] = {function()
			-- tsb.find_files()
			tse.file_browser.file_browser()
			-- local opts = {}
			-- opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
			-- require'telescope.builtin'.find_files(opts)
		end, "find files"},

		["b"] = {function()
			tsb.buffers()
		end, "list buffers"},

		["g"] = {function()
			tsb.live_grep()
		end, "live grep"},

		["c"] = {function()
			tsb.git_commits()
		end, "list commit"},

		["r"] = {function()
			tsb.oldfiles()
		end, "recent files"},

		["t"] = {function()
			tsb.treesitter()
		end, "treesitter"},

		["u"] = {function()
			tse.undo.undo()
		end, "undo"},
	},


	["<space>c"] = {
		name = "code",

		["r"] = {function()
			require("renamer").rename()
		end, "renamer"},


		["d"] = {
			name = "diffview",

			["o"] = {
				"<cmd>DiffviewOpen<cr>",
				"open diffview",
			},

			["q"] = {
				"<cmd>DiffviewClose<cr>",
				"close diffview",
			},

			["t"] = {
				"<cmd>DiffviewToggleFiles<cr>",
				"toggle diffview files",
			},
		}
	},


	["<space>b"] = {
		name = "buffer/window",

		["d"] = {
			"<cmd> :BD<cr>",
			"close buffer",
		},

		["v"] = {
			"<cmd>:vs<cr>",
			"split window vertically",
		},

		["h"] = {
			"<cmd>:split<cr>",
			"split window horizontally",
		},

		["q"] = {
			"<cmd>:q<cr>",
			"close split",
		},
	},


	["<space>d"] = {
		name = "LSP",

		["q"] = {function()
			vim.lsp.buf.code_action()
		end, "list quick fixes"},

		["d"] = {function()
			require("telescope.builtin").diagnostics()
		end, "list diagnostic"},

		["r"] = {function()
			require("telescope.builtin").lsp_references()
		end, "references for word under the cursor"},

		["f"] = {function()
			vim.diagnostic.open_float()
		end, "open float diagnostic"},

		["h"] = {function()
			vim.lsp.buf.hover()
		end, "open hover documentation"},
	},


	["<space>g"] = {
		name = "debugger",

		["t"] = {function()
			require("dapui").toggle()
		end, "toggle dapui"},

		["b"] = {function()
			require("dap").toggle_breakpoint()
		end, "toggle breakpoint"},

		["r"] = {function()
			require("dap").continue()
		end, "continue debugging"},
	},


	["<F2>"] = {function()
		require("dap").toggle_breakpoint()
	end, "toggle breakpoint"},

	["<F5>"] = {function()
		require("dap").continue()
	end, "continue debugging"},

	["<F12>"] = {function()
		require("dapui").eval(vim.fn.input("Eval: "))
	end, "eval expression"},

	["<F11>"] = {function()
		require("dap").step_into()
	end, "step into"},

	["<F10>"] = {function()
		require("dap").step_over()
	end, "step over"},

	["<F9>"] = {function()
		require("dap").step_out()
	end, "step out"},
})


vim.keymap.set('n', 'zo', require("fold-preview").toggle_preview)

vim.keymap.set({'n', 'i'}, "<C-Up>", "<cmd>wincmd k<cr>")
vim.keymap.set({'n', 'i'}, "<C-Down>", "<cmd>wincmd j<cr>")
vim.keymap.set({'n', 'i'}, "<C-Left>", "<cmd>wincmd h<cr>")
vim.keymap.set({'n', 'i'}, "<C-Right>", "<cmd>wincmd l<cr>")

vim.keymap.set({'n', 'i'}, "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set({'n', 'i'}, "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set({'n', 'i'}, "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set({'n', 'i'}, "<C-l>", "<cmd>TmuxNavigateRight<cr>")


vim.keymap.set('n', '<C-S-Down>', ':MoveLine(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Up>',  ':MoveLine(-1)<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-S-Left>', ':MoveHChar(-1)<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-S-Right>', ':MoveHChar(1)<CR>', { noremap = true, silent = true })

vim.keymap.set('v', '<C-S-Down>', ':MoveBlock(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Up>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Left>', ':MoveHBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Right>', ':MoveHBlock(1)<CR>', { noremap = true, silent = true })
