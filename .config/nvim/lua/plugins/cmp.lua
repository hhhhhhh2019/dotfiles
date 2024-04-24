return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-path",
		{"tzachar/cmp-fuzzy-buffer",
		 dependencies = {
			"tzachar/fuzzy.nvim",
			dependencies = {"nvim-telescope/telescope-fzf-native.nvim",
					build = "make"}
		 }},
		 "L3MON4D3/LuaSnip",
	},

	opts = {
		sources = {
			{name = "nvim_lsp"},
			--{name = "calc"},
			--{name = "path"},
			--{name = "fuzzy_buffer"},
		},

		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		window = {
			completion = {
				border = "rounded",
				--scrollbar = "║",
				winblend = 20,
				winhighlight = "Normal:CmpNormal",
				scrolloff = 3,
			},
			documentation = {
				border = "rounded",
				winblend = 20,
				winhighlight = "Normal:CmpDocNormal",
				scrollbar = "",
			},
		},

		mapping = {
			["<M-d>"] = function () require("cmp").complete() end,
			["<M-q>"] = function () require("cmp").confirm({select = true, behavior=require("cmp").ConfirmBehavior.Replace}) end,
			["<M-e>"] = function () require("cmp").abort() end,
			["<M-a>"] = function () require("cmp").select_next_item({behavior = require("cmp").SelectBehavior.Select}) end,
			["<M-s>"] = function () require("cmp").select_prev_item({behavior = require("cmp").SelectBehavior.Select}) end,
			["<M-z>"] = function () require("cmp").scroll_docs(-1) end,
			["<M-x>"] = function () require("cmp").scroll_docs(1) end,
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
				return require("lspkind").cmp_format({ with_text = true})(entry, vim_item)
			end
		}
	}
}
