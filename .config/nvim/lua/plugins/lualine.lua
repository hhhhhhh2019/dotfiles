return {
	"nvim-lualine/lualine.nvim",
	opts = {
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
	}
}
