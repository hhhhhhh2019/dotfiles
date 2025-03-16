return {
	"nvim-lualine/lualine.nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				icons_enabled = true,
				component_separators = { left = "", right = ""},
				section_separators = { left = "", right = ""},
			},

			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function (str, _)
							return string.sub(str, 1, 1)
						end
					},
					{
						-- require("noice").api.status.mode.get,
						-- cond = require("noice").api.status.mode.has,
					},
				},

				lualine_b = {
					"filename",
					{
						"filetype",
						padding = {left=0, right=0},
						icon_only = true,
					},
				},

				lualine_c = {
					"branch",
					{"diff", symbols = {added = '', modified = '󰛿', removed = ''}},
				},

				lualine_x = {
					{
						"diagnostics",
						colored = true,
						diagnostics_color = {
							error = {
								fg=require("lualine.utils.utils").extract_highlight_colors("DiagnosticError", "fg"),
								bg=require("lualine.utils.utils").extract_highlight_colors("DiagnosticError", "bg"),
							},
							warn = {
								fg=require("lualine.utils.utils").extract_highlight_colors("DiagnosticWarn", "fg"),
								bg=require("lualine.utils.utils").extract_highlight_colors("DiagnosticWarn", "bg"),
							},
							info = {
								fg=require("lualine.utils.utils").extract_highlight_colors("DiagnosticInfo", "fg"),
								bg=require("lualine.utils.utils").extract_highlight_colors("DiagnosticInfo", "bg"),
							},
							hint = {
								fg=require("lualine.utils.utils").extract_highlight_colors("DiagnosticHint", "fg"),
								bg=require("lualine.utils.utils").extract_highlight_colors("DiagnosticHint", "bg"),
							},
						},
					},
				},

				lualine_y = {
					"searchcount",
				},

				lualine_z = {
					"selectioncount",
					"location",
				},
			},
		})
	end
}
