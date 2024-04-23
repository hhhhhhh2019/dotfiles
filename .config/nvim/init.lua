local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd.colorscheme("catppuccin")

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.cursorline = true

vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.laststatus = 3
vim.opt.showmode = false

vim.opt.confirm = true

vim.opt.number = true
vim.opt.ruler = true

vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.undofile = true

vim.opt.foldcolumn = "1"
vim.opt.foldenable = false
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.syntax = "on"

vim.opt.list = true

vim.opt.mouse = "a"


local wk = require("which-key")
local tsb = require("telescope.builtin")
local tse = require("telescope").extensions

wk.register({
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
})


vim.keymap.set('n', '<C-S-Down>', ':move +1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Up>',  ':move -2<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'zo', require("fold-preview").toggle_preview)
