return {
	"lukas-reineke/indent-blankline.nvim",
	name = "ibl",
	event = "VeryLazy",
	opts = {
		indent = {
			char = '⎸',
			tab_char = '⎸',
		},

		scope = { enabled = true },

		exclude = {
			buftypes = {"nofile"},
			filetypes = {"dashboard"},
		}
	},
}
