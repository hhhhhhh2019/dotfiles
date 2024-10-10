return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"windwp/nvim-autopairs",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			sources = cmp.config.sources({
				{name = "nvim_lsp"},
			}),

			completion = {
				autocomplete = false,
			},

			window = {
				completion = {
					border = "rounded",
					scrollbar = "",
					winblend = 20,
					winhighlight = "Normal:CmpNormal,FloatBorder:Pmenu,Search:None",
					scrolloff = 3,
					-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					border = "rounded",
					winblend = 20,
					winhighlight = "Normal:CmpDocNormal",
					scrollbar = "",
				},
			},

			mapping = {
				["<C-d>"] = cmp.mapping.complete(),
				["<C-q>"] = cmp.mapping.confirm({select = true, behavior=require("cmp").ConfirmBehavior.Append}),
				["<C-w>"] = cmp.mapping.abort(),
				["<C-a>"] = cmp.mapping.select_next_item({behavior = require("cmp").SelectBehavior.Select}),
				["<C-s>"] = cmp.mapping.select_prev_item({behavior = require("cmp").SelectBehavior.Select}),
				["<C-z>"] = cmp.mapping.scroll_docs(-1),
				["<C-x>"] = cmp.mapping.scroll_docs(1),
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					return kind
				end,
			},
		})

		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done()
		)
	end
}
