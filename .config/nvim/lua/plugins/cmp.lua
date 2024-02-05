return {
	{"hrsh7th/nvim-cmp",
		dependencies = {
			{"tzachar/cmp-fuzzy-buffer", dependencies = {
				{"tzachar/fuzzy.nvim"},
				{"nvim-telescope/telescope-fzf-native.nvim",
				  build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"}
			}},
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-path",
		},
config = function()
	local cmp = require("cmp")

	cmp.setup({
		sources = {
			{name = "nvim_lsp"},
			{name = "fuzzy_buffer"},
			{name = "path"},
			{name = "codeium"},
		},

		window = {
			completion = {
				border = "rounded",
				scrollbar = "║",
			},
			documentation = {
				border = "rounded",
				scrollbar = "",
			},
		},

		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		mapping = {
			["<M-d>"] = cmp.mapping.complete(),
			["<M-q>"] = cmp.mapping.confirm({select = true, behavior=cmp.ConfirmBehavior.Replace}),
			["<M-e>"] = cmp.mapping.abort(),
			["<M-a>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
			["<M-s>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})
		},

		formatting = {
			format = function(entry, vim_item)
				if vim.tbl_contains({ "path" }, entry.source.name) then
					local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
					if icon then
						vim_item.kind = icon
						vim_item.kind_hl_group = hl_group
						return vim_item
					end
				end
				return require("lspkind").cmp_format({ with_text = false })(entry, vim_item)
			end
		}
	})
end},


	{"Exafunction/codeium.nvim",
config = function()
	local codeium = require("codeium")
	codeium.setup({})
end},
}
