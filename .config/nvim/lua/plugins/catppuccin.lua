return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	opts = {

flavour = "auto",
background = {
	light = "latte",
	dark = "mocha",
},
transparent_background = false,
term_colors = true,
styles = {
	comments = {},
	conditionals = {},
},
compile_path = vim.fn.stdpath "cache" .. "/catppuccin",

default_integrations = true,
integrations = {

}

	},

	config = function(opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme "catppuccin"
	end
}
