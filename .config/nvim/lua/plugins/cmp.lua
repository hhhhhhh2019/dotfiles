return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"https://codeberg.org/FelipeLema/cmp-async-path",
		"onsails/lspkind.nvim",
		"windwp/nvim-autopairs",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.setup({
			sources = cmp.config.sources({
				{name = "nvim_lsp"},
				{name = "async_path"},
				-- {name = "lazydev"},
			}),

			window = {
				completion = {
					border = "rounded",
					scrollbar = false,
					winblend = 0,
					winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal",
					scrolloff = 3,
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					border = "rounded",
					winblend = 0,
					winhighlight = "Normal:CmpDocNormal",
				},
			},

			completion = {
				autocomplete = false,
				noselect = true,
			},

			formatting = {
				fields = { "kind", "abbr" },
				format = require("lspkind").cmp_format({
					mode = "symbol",
				}),
				expandable_indicator = true
			},

			mapping = {
				["<Tab>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item()
					else
						cmp.complete()
					end
				end, {"i", "s"}),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, {"i", "s"}),

				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({select=true})
					else
						fallback()
					end
				end, {"i", "s"}),

				["<ESC>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.abort()
					else
						fallback()
					end
				end, {"i", "s"}),
			}
		})

		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done()
		)
	end
}
