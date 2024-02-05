return {
	{"catppuccin/nvim", name = "catppuccin", priority = 1000,
config = function()
	require("catppuccin").setup({
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


	{"nvim-treesitter/nvim-treesitter",
config = function()
	require("nvim-treesitter.configs").setup({
		auto_install = true,

		highlight = {
			enable = true,
		},
	})
end},


	{"folke/which-key.nvim",
config = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
end},


	{"fedepujol/move.nvim",
config = function()
	require("move").setup({})
end},


	{"windwp/nvim-autopairs",
config = function()
	require("nvim-autopairs").setup({})
end},


	{"jghauser/mkdir.nvim"},


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


	{"christoomey/vim-tmux-navigator"},


	{"echasnovski/mini.align",
config = function()
	require("mini.align").setup({
		mappings = {
			start = '',
			start_with_preview = '<Space>ca',
		},
	})
end},
}
