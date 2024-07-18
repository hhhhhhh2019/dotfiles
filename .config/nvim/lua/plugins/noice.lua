return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				-- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},

		presets = {
			bottom_search = false,
			command_palette = {
				views = {
					cmdline_popup = {
						position = {
							row = "80%",
							col = "50%",
						},
						size = {
							min_width = 60,
							width = "auto",
							height = "auto",
						},
					},
				},
			},
		},
	},
}
