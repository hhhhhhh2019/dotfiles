return {
-- 	{"williamboman/mason.nvim",
-- config = function()
-- 	local mason = require("mason")
--
-- 	mason.setup()
-- end},


	{"nvim-neorg/neorg",
config = function()
	local neorg = require("neorg")

	neorg.setup()
end},


	{"nvim-treesitter/nvim-treesitter",
config = function()
	local ts = require("nvim-treesitter.configs")

	ts.setup({
		auto_install = true,

		hightlight = {
			enable = true,
			use_languagetree = true
		},

		indent = {
			enable = false,
		}
	})
end},


	{"folke/which-key.nvim",
config = function()
	local wk = require("which-key")

	wk.setup()

	wk.register(require("core.mappings"))
end},


	{"lewis6991/gitsigns.nvim",
config = function()
	local gs = require("gitsigns")

	gs.setup()
end},


	{"nvim-tree/nvim-web-devicons",
config = function()
	local di = require("nvim-web-devicons")

	di.setup()
end},


	{"lukas-reineke/indent-blankline.nvim",
config = function()
	local ib = require("ibl")
	--ib.setup()
end},

	{"catppuccin/nvim", name = "catppuccin",
config = function()
	local cn = require("catppuccin")

	cn.setup({
		flavour = "mocha",
		background = {
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		show_end_of_buffer = false,
		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false,
		no_bold = true,
		no_underline = false,
		styles = {
			comments = { "italic" },
			conditionals = {},
			loops = {},
			functions = {},
			keywords = { "underline" },
			strings = { "italic" },
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},

		integrations = {
			cmp = true,
			gitsigns = true,
			treesitter = true,
			fidget = true,
			dap = true,
			dap_ui = true,
			which_key = true,
		},

		native_lsp = {
			enabled = true,
			virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
			},
			underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
			},
			inlay_hints = {
					background = false,
			},
		},
	})
end},


	{"nvim-lualine/lualine.nvim",
config = function()
	local line = require("lualine")

	line.setup({
		options = {
			icons_enabled = true,
			theme = "catppuccin",

			component_separators = { left = "", right = ""},
			section_separators = { left = "", right = ""},

			--           󰝤        
		},

		sections = {
			lualine_a = {"mode"},
			lualine_b = {
				"filename",
				{"diagnostics",
					sources = {"nvim_diagnostic"},
					-- symbols = {error = ' ', warn = ' ', info = ' '},
					colored = true,
					update_in_insert = false,
				}
			},
			lualine_c = {"branch", "diff"},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {"searchcount", "selectioncount", "location", "progress"},
		}
	})
end},


	{"windwp/nvim-autopairs",
config = function()
	local ap = require("nvim-autopairs")

	ap.setup({})
end},


	{"NvChad/nvim-colorizer.lua",
config = function()
	local color = require("colorizer")

	color.setup({
		nil,
		{
			names = true,
			RGB = true,
			RRGGBB = true,
			RRGGBBAA = true,
			css = true,
			mode = "background",
		}
	})
end},


	{"jghauser/mkdir.nvim"},


	{"karb94/neoscroll.nvim",
config = function()
	local scroll = require("neoscroll")

	scroll.setup({})
end},


	{"declancm/cinnamon.nvim",
config = function()
	local cinnamon = require("cinnamon")

	cinnamon.setup({})
end},


	{"numToStr/Comment.nvim",
config = function()
	local comment = require("Comment")

	comment.setup({})
end},


	{"tiagovla/scope.nvim",
config = function()
	local scope = require("scope")

	scope.setup({})
end},


	{"qpkorr/vim-bufkill"},


	{"RaafatTurki/hex.nvim",
config = function()
	local hex = require("hex")

	hex.setup({})
end},


	{"j-hui/fidget.nvim",
config = function()
	local fidget = require("fidget")
	fidget.setup({
		notification = {
			window = {
				winblend = 0,
			},
		}
	})
end},


	{"sindrets/diffview.nvim"},


-- 	{"00sapo/visual.nvim",
-- config = function()
-- 	local visual = require("visual")
--
-- 	visual.setup({})
-- end},


	{"echasnovski/mini.align",
config = function()
	local align = require("mini.align")
	align.setup({
		mappings = {
			start_with_preview = '<space>a',
		},
	})
end},


	{"fedepujol/move.nvim"},
}
