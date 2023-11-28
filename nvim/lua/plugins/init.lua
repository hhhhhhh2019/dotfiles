local plugins = {
	{"nvim-telescope/telescope.nvim",
		dependencies = {"nvim-lua/plenary.nvim"}
	},

	"nvim-tree/nvim-web-devicons",

	"nvim-treesitter/nvim-treesitter",

	"lewis6991/gitsigns.nvim",

	{"nvim-tree/nvim-tree.lua",
		dependencies = {"nvim-tree/nvim-web-devicons"}
	},

	"NvChad/nvim-colorizer.lua",

	"sunjon/Shade.nvim",

	"Mofiqul/dracula.nvim",

	"tiagovla/scope.nvim",

	--{"NTBBloodbath/galaxyline.nvim",
	--	dependencies = {"NTBBloodbath/galaxyline.nvim"}
	--},
	
	{"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons"
	},

	--{"romgrk/barbar.nvim",
	--	dependencies = {"lewis6991/gitsigns.nvim"}
	--},

	{"akinsho/bufferline.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons"}
	},

	"yamatsum/nvim-cursorline",

	{"nvimdev/dashboard-nvim",
		dependencies = {"nvim-tree/nvim-web-devicons"}
	},

	"edluffy/hologram.nvim",

	"jghauser/mkdir.nvim",

	"mfussenegger/nvim-dap",

	"mfussenegger/nvim-dap-python",

	{"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap"}
	},

	{"niuiic/dap-utils.nvim",
		dependencies = {"mfussenegger/nvim-dap"}
	},
	
	{"kevinhwang91/nvim-bqf",
		dependencies = {"nvim-treesitter/nvim-treesitter"}
	},

	"NeogitOrg/neogit",

	"folke/which-key.nvim",

	"karb94/neoscroll.nvim",
	"declancm/cinnamon.nvim",

	{"windwp/nvim-ts-autotag",
		dependencies = {"nvim-treesitter/nvim-treesitter"}
	},

	"windwp/nvim-autopairs",

	{"filipdutescu/renamer.nvim",
		dependencies = "nvim-lua/plenary.nvim"
	},

	"numToStr/Comment.nvim",

	{"debugloop/telescope-undo.nvim",
		dependencies = {"nvim-telescope/telescope.nvim"}
	},

	"qpkorr/vim-bufkill",

	"neovim/nvim-lspconfig",

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
	{"tzachar/cmp-fuzzy-buffer",
		dependencies = {"tzachar/fuzzy.nvim"}
	},
	"kdheepak/cmp-latex-symbols",
	"ray-x/cmp-treesitter",
	"amarakon/nvim-cmp-buffer-lines",

	"godlygeek/tabular",

	"mg979/vim-visual-multi",

	"folke/neodev.nvim",

	"nmac427/guess-indent.nvim",

	"gelguy/wilder.nvim",
}

require("lazy").setup(plugins)
