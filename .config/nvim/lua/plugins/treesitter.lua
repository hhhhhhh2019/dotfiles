return {
	{
		"nvim-treesitter/nvim-treesitter",
		name = "nvim-treesitter.configs",
		dependencies =  {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
		},

		opts = {
			auto_install = true,
			highlight = {enablue = true},
			autotag = {enablue = true},
			indent = {enablue = true},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
				},

				swap = {
					enable = true,
					swap_next = {
						["<space>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<space>A"] = "@parameter.inner",
					},
				},
			},

			refactor = {
				highlight_definitions = {
					enable = true,
					clear_on_cursor_move = true,
				},
				highlight_current_scope = { enable = true },
				smart_rename = {
					enable = true,
					keymaps = {
						smart_rename = "grr",
					},
				},
				refactor = {
					navigation = {
						enable = true,
						keymaps = {
							goto_definition = "gnd",
							list_definitions = "gnD",
							list_definitions_toc = "gO",
							goto_next_usage = "<a-*>",
							goto_previous_usage = "<a-#>",
						},
					}
				},
			},
		}
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
			max_lines = 0,
			min_window_height = 0,
			line_numbers = true,
			mode = 'cursor',
		}
	},
}
