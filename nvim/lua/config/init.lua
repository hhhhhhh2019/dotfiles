vim.opt.number = true
vim.opt.list = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.opt.confirm = true
vim.opt.filetype = "on"

vim.opt.clipboard:append { "unnamed", "unnamedplus" }

vim.cmd("colorscheme dracula")


require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "dracula-nvim",

		component_separators = { left = "", right = ""},
		section_separators = { left = "", right = ""},
	},

	sections = {
		lualine_a = {"mode"},
		lualine_b = {"filename", "filetype"},
		lualine_c = {"branch", "diff"},
		lualine_x = {"diagnostics"},
		lualine_y = {"searchcount"},
		lualine_z = {"location", "progress"}
	},

	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})


local wk = require("which-key")

wk.setup({

})


require("nvim-treesitter.configs").setup({
	auto_install = true,

	highlight = {
		enable = true,
	},

	autotag = {
		enable = true,
	}
})



require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"%.o"
		}
	},

	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({})
		},

		undo = {
		}
	}
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("undo")


require("lspconfig").pyright.setup({

})


local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").clangd.setup({
	capabilities = capabilities,
})


require("lspconfig").quick_lint_js.setup({})


local cmp = require("cmp")

cmp.setup({
	sources = cmp.config.sources({
		{name = "nvim_lsp"},
		{name = "path"},
		{name = "fuzzy_buffer"},
	}),

	window = {
		completion = {
			border = "rounded",
			scrollbar = "║",
		},
		documentation = {
			border = nil,
			scrollbar = "",
		},
	},

	mapping = cmp.mapping.preset.insert({
		["<M-d>"] = cmp.mapping.complete(),
		["<M-q>"] = cmp.mapping.confirm({ select = true }),
		["<M-e>"] = cmp.mapping.abort(),
	})
})


require("gitsigns").setup({

})


-- require("colorizer").setup({
-- 	user_default_options = {
-- 		RGB = true,
-- 		RRGGBB = true,
-- 		RRGGBBAA = true,
-- 		AARRGGBB = false,
-- 		css = true,
-- 		css_fn = true,
-- 		mode = "background",
-- 	}
-- })
require("colorizer").setup(
	nil,
	{
		names = true,
		RGB = true,
		RRGGBB = true,
		RRGGBBAA = true,
		css = true,
		mode = "background",
	}
)


require("neoscroll").setup({})
require("cinnamon").setup({})


require("renamer").setup({
	title = "Rename",
	min_width = 15,
	max_width = 45,
	border = true,
	border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	show_refs = true,
	with_qf_list = true,
	with_popup = true,
})


require("scope").setup({})


require("nvim-autopairs").setup({
	map_bs = false,
})


require("Comment").setup({
	padding = true,

	toggler = {
		line = "gcc",
		block = "gbc",
	},
	opleader = {
		line = 'gc',
		block = 'gb',
	},

	mappings = {
		basic = true,
		extra = true,
	},
})


local wilder = require("wilder")

local highlighters = {
	wilder.pcre2_highlighter(),
	wilder.lua_fzy_highlighter(),
}

wilder.setup({
	modes = {':', '/', '?'}
})

wilder.set_option('pipeline', {
	wilder.branch(
		wilder.cmdline_pipeline({
			fuzzy = true
		})
	)
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		highlighter = highlighters,
		min_width = '100%',
		border = 'rounded',

		left = {
			' ',
			wilder.popupmenu_devicons()
		},
		right = {
			' ',
			wilder.popupmenu_scrollbar(),
		},
	})
))



require("mini.align").setup({
	
})






-- keybinds


local tb = require("telescope.builtin")
local tt = require("telescope.themes")


wk.register({
	--["<space>dc"] = {vim.lsp.buf.declaration, "declaration"},
	--["<space>de"] = {vim.lsp.buf.definition, "definition"},
	["<space>dc"] = {tb.lsp_implementations, "declaration"},
	["<space>de"] = {tb.lsp_definitions, "definition"},
	["<space>r"] = {tb.lsp_references, "references for word under the cursor"},
	["<space>qf"] = {vim.lsp.buf.code_action, "quick fixes"},
	["<space>qd"] = {tb.diagnostics, "lists diagnostics for all open buffers"},

	["<space>t"] = {tb.treesitter, "lists function names, variables, from Treesitter"},

	--["<space>a"]

	["fb"] = {tb.buffers, "show buffers"},
	["ff"] = {tb.find_files, "find files"},
	["fg"] = {tb.live_grep, "live grep"},
})

vim.keymap.set('n', "<C-Up>", "<cmd>wincmd k<cr>")
vim.keymap.set('n', "<C-Down>", "<cmd>wincmd j<cr>")
vim.keymap.set('n', "<C-Left>", "<cmd>wincmd h<cr>")
vim.keymap.set('n', "<C-Right>", "<cmd>wincmd l<cr>")

vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

--vim.keymap.set("n", "<space>dc", vim.lsp.buf.declaration)
--vim.keymap.set("n", "<space>de", vim.lsp.buf.definition)
