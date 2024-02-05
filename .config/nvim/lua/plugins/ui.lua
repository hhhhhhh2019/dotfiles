return {
	{"nvim-tree/nvim-web-devicons",
config = function()
	require("nvim-web-devicons").setup()
end},

	{"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"debugloop/telescope-undo.nvim",
			"Zane-/howdoi.nvim"
		},
config = function()
	local ts = require("telescope")

	ts.setup({
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({})
			},

			undo = {
				mappings = {
					["<C-y>"] = require("telescope-undo.actions").yank_additions,
					["<C-Y>"] = require("telescope-undo.actions").yank_deletions,
					["<C-u>"] = require("telescope-undo.actions").restore,
				}
			},

			dap = {
			},

			howdoi = {
				num_answers = 5,
			},
		}
	})

	ts.load_extension("ui-select")
	ts.load_extension("undo")
	ts.load_extension("dap")
	-- ts.load_extension("howdoi")
end},


	{"lewis6991/gitsigns.nvim",
config = function()
	require("gitsigns").setup()
end},


	{"lukas-reineke/indent-blankline.nvim",
config = function()
	local mocha = require("catppuccin.palettes").get_palette("mocha")

	local highlight = {
		"RainbowRed",
		"RainbowYellow",
		"RainbowBlue",
		"RainbowOrange",
		"RainbowGreen",
		"RainbowViolet",
		"RainbowCyan",
	}

	local hooks = require "ibl.hooks"

	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "RainbowRed",    {fg = mocha.red})
		vim.api.nvim_set_hl(0, "RainbowYellow", {fg = mocha.green})
		vim.api.nvim_set_hl(0, "RainbowBlue",   {fg = mocha.blue})
		vim.api.nvim_set_hl(0, "RainbowOrange", {fg = mocha.peach})
		vim.api.nvim_set_hl(0, "RainbowGreen",  {fg = mocha.teal})
		vim.api.nvim_set_hl(0, "RainbowViolet", {fg = mocha.sapphire})
		vim.api.nvim_set_hl(0, "RainbowCyan",   {fg = mocha.maroon})
	end)

	require("ibl").setup({
		indent = {
			highlight = highlight,
			char = '▎',
			tab_char = '▎',
		},

		scope = { enabled = false },
	})
end},


	{"j-hui/fidget.nvim",
config = function()
	require("fidget").setup({
		notification = {
			window = {
				winblend = 0,
			},
		}
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
				"filetype",
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


	{"sindrets/diffview.nvim",
config = function()

end},
}
