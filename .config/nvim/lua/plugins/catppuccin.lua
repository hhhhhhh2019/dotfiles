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
		}
	},
	config = function(lazy, opts)
		require("catppuccin").setup(opts)
		vim.cmd("colorscheme catppuccin")
	end
}
