return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		-- flavour = "auto",
		background = {
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		show_end_of_buffer = false,
		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false,
		no_bold = true,
		no_underline = false,
		styles = {
			comments = { "italic" },
			conditionals = {},
			loops = {},
			functions = {},
			keywords = { "underline" },
			strings = { "italic" },
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},

		integrations = {
			cmp = true,
			gitsigns = true,
			treesitter = true,
			fidget = true,
			dap = true,
			dap_ui = true,
			which_key = true,
		},

		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = false,
			},
		},
	}
}
