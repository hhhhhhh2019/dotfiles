return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "auto",
		background = {
				light = "latte",
				dark = "mocha",
		},
		integrations = {
			noice = true,
			mason = true,
			notify = true,
			ufo = true,
		},
		styles = {
			comments = {},
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
	},
	config = function(lazy, opts)
		require("catppuccin").setup(opts)
		vim.cmd("colorscheme catppuccin")
	end
}
