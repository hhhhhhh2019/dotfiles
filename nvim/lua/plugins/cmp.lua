return {
	{"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			{"tzachar/cmp-fuzzy-buffer", dependencies = {
				{"tzachar/fuzzy.nvim", dependencies = {
					{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
				}}
			}},
		},
config = function()
	local cmp = require("cmp")

	cmp.setup({
		sources = {
			{name = "nvim_lsp"},
			{name = "codeium"},
			{name = "luasnip"},
			{name = "fuzzy_buffer"},
			{name = "path"},
			{name = "nvim_lua"},
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

		preselect = cmp.PreselectMode.Item,

		completion = {
			keyword_length = 1,
			completeopt = "menu,menuone",
		},

		experimental = {
			ghost_text = true
		},

		formatting = {
			format = function(entry, vim_item)
				if vim.tbl_contains({ 'path' }, entry.source.name) then
					local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
					if icon then
						vim_item.kind = icon
						vim_item.kind_hl_group = hl_group
						return vim_item
					end
				end
				return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
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
