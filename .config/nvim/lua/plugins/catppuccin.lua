return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = true,
		integrations = {
			cmp = true,
			treesitter = true,
			which_key = true,
			diffview = true,
			fidget = true,
			flash = true,
			gitsigns = true,
			neogit = true,
			noice = true,
			-- dap = true,
			-- dap_ui = true,

			indent_blankline = {
				enabled = true,
				scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
				colored_indent_levels = false,
			},

			telescope = {
				enabled = true,
			},

			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
				},
				inlay_hints = {
						background = true,
				},
			},
		},
	}
}
