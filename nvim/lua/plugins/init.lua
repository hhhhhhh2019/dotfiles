require("lazy").setup({
	{"nvim-lualine/lualine.nvim", dependencies = {
		"nvim-tree/nvim-web-devicons"
	}},

	{"Mofiqul/dracula.nvim"},
	{"catppuccin/nvim", name = "catppuccin"},

	{"folke/which-key.nvim"},

	{"nvim-telescope/telescope.nvim", dependencies = {
		"nvim-lua/plenary.nvim"
	}},

	{"nvim-telescope/telescope-ui-select.nvim", dependencies = {
		"nvim-telescope/telescope.nvim"
	}},

	{"nvim-telescope/telescope-dap.nvim", dependencies = {
		"nvim-telescope/telescope.nvim"
	}},

	{"debugloop/telescope-undo.nvim"},

	{"nvim-treesitter/nvim-treesitter"},
	{"windwp/nvim-ts-autotag"},

	{"neovim/nvim-lspconfig"},

	{"hrsh7th/nvim-cmp"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/cmp-path"},
	{"tzachar/cmp-fuzzy-buffer", dependencies = {
		{"tzachar/fuzzy.nvim", dependencies = {
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
		}}
	}},
	{"saadparwaiz1/cmp_luasnip"},

	{"lewis6991/gitsigns.nvim"},

	-- {"norcalli/nvim-colorizer.lua"},
	{"NvChad/nvim-colorizer.lua"},

	{"jghauser/mkdir.nvim"},

	{"karb94/neoscroll.nvim"},
	{"declancm/cinnamon.nvim"},

	{"numToStr/Comment.nvim"},

	{"filipdutescu/renamer.nvim"},

	{"tiagovla/scope.nvim"},

	{"windwp/nvim-autopairs"},

	{"gelguy/wilder.nvim"},

	{"gsuuon/llm.nvim"},

	{"echasnovski/mini.nvim"},

	{"qpkorr/vim-bufkill"},

	{"echasnovski/mini.align"},

	-- {"Vonr/align.nvim"},

	{"L3MON4D3/LuaSnip", build = "make install_jsregexp"},

	{"00sapo/visual.nvim"},

	{"mg979/vim-visual-multi"},

	{"RaafatTurki/hex.nvim"},

	{"onsails/lspkind.nvim"},

	{"mfussenegger/nvim-dap"},
	{"rcarriga/nvim-dap-ui"},
	{"theHamsta/nvim-dap-virtual-text"},

	{"folke/neodev.nvim"},

	{"j-hui/fidget.nvim"},

	{"edluffy/hologram.nvim"},

	{"sindrets/diffview.nvim"},

	{"vzze/calculator.nvim"},

	{"Zane-/howdoi.nvim"},

	{"Exafunction/codeium.vim"},
})
