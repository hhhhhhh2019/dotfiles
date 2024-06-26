local wk  = require("which-key")
local tsb = require("telescope.builtin")
local tse = require("telescope").extensions

wk.register({
	["<space>s"] = {
		name = "sessions",

		["l"] = {
			"<cmd>SessionsLoad .session<cr>",
			"load session"
		},

		["s"] = {
			"<cmd>SessionsSave .session<cr>",
			"save session"
		},
	},

	["<space>f"] = {
		name = "file/buffer jumping",

		["f"] = {function ()
			tse.file_browser.file_browser()
		end, "file browser"},

		["g"] = {function()
			tsb.live_grep()
		end, "live grep"},

		["b"] = {function()
			tsb.buffers()
		end, "list buffers"},

		["u"] = {function()
			tse.undo.undo()
		end, "undo"},
	},

	["<space>c"] = {
		name = "code",

		["r"] = {function()
			require("renamer").rename()
		end, "renamer"},

		["a"] = {
			name = "align",

			["c"] = { function ()
					require("align").align_to_char({preview=true})
				end, "align to char", mode = "v"
			},

			["r"] = { function ()
					require("align").align_to_string({preview=true, regex=false})
				end, "align to char", mode = "v"
			},

			["s"] = { function ()
					require("align").align_to_string({preview=true, regex=true})
				end, "align to char", mode = "v"
			},
		},

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
			"<cmd> :bd<cr>",
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
			tsb.diagnostics()
		end, "list diagnostic"},

		["r"] = {function()
			tsb.lsp_references()
		end, "references for word under the cursor"},

		["f"] = {function()
			vim.diagnostic.open_float()
		end, "open float diagnostic"},

		["h"] = {function()
			vim.lsp.buf.hover()
		end, "open hover documentation"},
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


vim.keymap.set('n', '<C-S-Down>', ':move +1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Up>',  ':move -2<CR>', { noremap = true, silent = true })

vim.keymap.set('v', '<C-S-Down>', ':MoveBlock(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Up>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Left>', ':MoveHBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Right>', ':MoveHBlock(1)<CR>', { noremap = true, silent = true })
