return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = "HiPhish/rainbow-delimiters.nvim",
	name = "ibl",
	event = "VeryLazy",
	opts = {
		indent = {
			char = '⎸',
			tab_char = '⎸',
		},

		scope = { enabled = false },

		exclude = {
			buftypes = {"nofile"},
			filetypes = {"dashboard"},
		}
	},
}
