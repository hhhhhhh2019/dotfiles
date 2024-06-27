return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		options = {
			theme = "catppuccin",

			--           󰝤       
			component_separators = { left = "", right = ""},
			section_separators = { left = "", right = ""},
		},

		sections = {
			lualine_a = {"mode"},
			lualine_b = {
				{"filetype", icon_only = true},
				"filename"
			},
			lualine_c = {
				"branch",
				{"diff", symbols = {added = '', modified = '󰛿', removed = ''}}
			},
			lualine_x = {"diagnostics"},
			lualine_y = {},
			lualine_z = {"searchcount", "selectioncount", "location"}
		},
	},
}
