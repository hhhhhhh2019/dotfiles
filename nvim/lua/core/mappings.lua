vim.keymap.set('n', '<C-S-Down>', ':MoveLine(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Up>',  ':MoveLine(-1)<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-S-Left>', ':MoveHChar(-1)<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-S-Right>', ':MoveHChar(1)<CR>', { noremap = true, silent = true })

vim.keymap.set('v', '<C-S-Down>', ':MoveBlock(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Up>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Left>', ':MoveHBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-S-Right>', ':MoveHBlock(1)<CR>', { noremap = true, silent = true })


vim.keymap.set('n', "<C-Up>", "<cmd>wincmd k<cr>")
vim.keymap.set('n', "<C-Down>", "<cmd>wincmd j<cr>")
vim.keymap.set('n', "<C-Left>", "<cmd>wincmd h<cr>")
vim.keymap.set('n', "<C-Right>", "<cmd>wincmd l<cr>")


return {
	["<space>f"] = {name = "Telescope",
		["f"] = {function()
			require("telescope.builtin").find_files()
		end, "find file"},

		["b"] = {function()
			require("telescope.builtin").buffers()
		end, "list buffers"},

		["g"] = {function()
			require("telescope.builtin").live_grep()
		end, "live grep"},
	},


	["<space>d"] = {name = "lsp",
		["q"] = {function()
			vim.lsp.buf.code_action()
		end, "list quick fixes"},

		["d"] = {function()
			require("telescope.builtin").diagnostics()
		end, "list diagnostic"},

		["r"] = {function()
			require("telescope.builtin").lsp_references()
		end, "references for word under the cursor"},

		["t"] = {function()
			require("telescope.builtin").treesitter()
		end, "lists function names, variables, from Treesitter"},
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


	-- ["<C-S-Down"] = {"<cmd>MoveLine(1)<cr>", "move line down", mode="n"},
	-- ["<C-S-Up>"] = {"<cmd>MoveLine(-1)<cr>", "move line up", mode="n"},
	--
	-- ["<C-S-Down>"] = {"<cmd>MoveBlock(1)<cr>", "move block down", mode="v"},
	-- ["<C-S-Up>"] = {"<cmd>MoveBlock(-1)<cr>", "move block up", mode="v"},
}
