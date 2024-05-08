return {
	"lukas-reineke/indent-blankline.nvim",
	name = "ibl",
	opts = {
		indent = {
			char = '▎',
			tab_char = '▎',
		},

		scope = { enabled = false },

		exclude = {
			buftypes = {"nofile"},
			filetypes = {"dashboard",},
		}
	}
}
