require("nvim-treesitter.configs").setup({
	ensure_install = {"c", "lua", "python"},
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
	},

	autotag = {
		enable = true,
	},

	--indent = {
	--	enable = true,
	--},

	incremental_selection = {
		enable = true,
	}
})


require("nvim-ts-autotag").setup({})



require("gitsigns").setup({
	
})



require("telescope").setup({
	extensions = {
		undo = {
			use_delta = true,
		}
	}
})

require("telescope").load_extension("undo")



require("nvim-web-devicons").setup({
	color_icons = true,
	default = true
})



require("nvim-tree").setup({
	view = {
		width = 30,
	},
})



require("colorizer").setup({
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		RRGGBBAA = true,
		AARRGGBB = false,
		css = true,
		css_fn = true,
		mode = "background",
	}
})


--require("shade").setup({
--	overlay_opacity = 50,
--	opacity_step = 1,
--})



require("scope").setup({})



--require("bufferline").setup({
--	options = {
--		mode = "buffers",
--		themable = false,
--		close_command = "bdelete! %d",
--		left_mouse_command = "buffer %d",
--		right_mouse_command = "bdelete! %d",
--		modified_icon = '●',
--		close_icon = '',
--		left_trunc_marker = '',
--		right_trunc_marker = '',
--		color_icons = true,
--
--		offsets = {
--			{
--				filetype = "NvimTree",
--				text = "File Explorer",
--				text_align = "left",
--				separator = true
--			}
--		},
--
--		hover = {
--			enabled = true,
--			delay = 200,
--			reveal = {'close'}
--		},
--
--		show_close_icon = true,
--		separator_style = "slope"
--	}
--})



require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "dracula-nvim",
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
	},

	sections = {
		lualine_a = {'mode'},
		lualine_b = {'filename', 'fileformat'},
		lualine_c = {'branch', 'diff'},
		lualine_x = {},
		lualine_y = {'progress'},
		lualine_z = {'selectioncount', 'searchcount', 'location'}
	}
})


--  		
-- 	
-- 	


require("nvim-cursorline").setup({
	cursorline = {
		enable = false,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	}
})



require("dashboard").setup({
	theme = "hyper",
	config = {
		packages = { enable = true },
		project = { enable = true, limit = 8, label = 'projects', action = 'Telescope find_files cwd=' },
	}
})



--require("hologram").setup({
--	auto_display = true
--})



-- require("mkdir")



require("bqf").setup({

})



require("neogit").setup({

})



require("which-key").setup({

})



require("neoscroll").setup({
	hide_cursor = true,
	stop_eof = true,
	respect_scrolloff = true,
	cursor_scrolls_alone = true,
	performance_mode = true,
	mappings = {'<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
})

require("cinnamon").setup()



require("nvim-autopairs").setup({
	map_bs = false,
})



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



require("lspconfig").clangd.setup({})
require("lspconfig").julials.setup({})
require("lspconfig").pyright.setup({})




local cmp = require("cmp")

cmp.setup({
	-- sources = cmp.config.sources(
	-- 	{
	-- 		{ name = 'nvim_lsp' },
	-- 		{ name = 'path' },
	-- 		{ name = 'latex_symbols' },
	-- 		{ name = 'treesitter' },
	-- 		{ name = 'buffer' },
	-- 	}, {
	-- 		{ name = 'buffer' },
	-- 	}
	-- ),

	window = {
    completion = {
      border = 'rounded',
      scrollbar = '║',
    },
    documentation = {
      border = nil,
      scrollbar = '',
    },
  },

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'latex_symbols' },
		{ name = 'treesitter' },
		{ name = 'fuzzy_buffer' },
		{ name = 'buffer-lines' }
	}),

	mapping = cmp.mapping.preset.insert({
		['<M-d>'] = cmp.mapping.complete(),
		['<M-q>'] = cmp.mapping.confirm({ select = true }),
		['<M-e>'] = cmp.mapping.abort(),
	})
})




require("neodev").setup({
	library = {
		enabled = true,
		runtime = true,
		types = true,
		plugins = { "nvim-dap-ui" }
	},

	lspconfig = true
})



require('dap-python').setup('/usr/bin/python')

require("dap").adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" }
}

require('dap').adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode',
	name = 'lldb'
}

require("dap").configurations.c = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		adapter = "lldb",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = "${workspaceFolder}",
	},
}

require("dapui").setup()

require("dap-utils").setup({})

require("guess-indent").setup({})


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



vim.opt.number = true
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.list = true
vim.opt.tabstop=2
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
vim.opt.confirm = true
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.encoding="UTF-8"
vim.opt.foldenable = true
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.mousemoveevent = true


vim.o.timeout = true
vim.o.timeoutlen = 300

vim.cmd(":set foldmethod=expr")
vim.cmd(":set foldexpr=nvim_treesitter#foldexpr()")
vim.cmd(":set nofoldenable")


vim.cmd[[colorscheme dracula-soft]]


--vim.keymap.set('', "<C-l>", "<cmd>bnext<cr>")
--vim.keymap.set('', "<S-l>", "<cmd>bprev<cr>")
--vim.keymap.set('', "<C-p>", "<cmd>BD<cr>")
--vim.keymap.set('', "<C-b>", "<cmd>NvimTreeToggle<cr>")


vim.keymap.set('n', "<F2>", require("dapui").toggle)
vim.keymap.set('n', '<F5>', require('dap').continue)
vim.keymap.set('n', '<F6>', require('dap').toggle_breakpoint)

vim.keymap.set('n', "<C-Up>", "<cmd>wincmd k<cr>")
vim.keymap.set('n', "<C-Down>", "<cmd>wincmd j<cr>")
vim.keymap.set('n', "<C-Left>", "<cmd>wincmd h<cr>")
vim.keymap.set('n', "<C-Right>", "<cmd>wincmd l<cr>")


vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

vim.keymap.set('n', "ff", require('telescope.builtin').find_files)
vim.keymap.set('n', "fb", require('telescope.builtin').buffers)
vim.keymap.set('n', "fg", require('telescope.builtin').live_grep)


local opts = { noremap=true, silent=true }

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, opts)
