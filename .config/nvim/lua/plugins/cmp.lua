return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{"tzachar/cmp-fuzzy-buffer",
			dependencies = {
				"tzachar/fuzzy.nvim",
				dependencies = {"nvim-telescope/telescope-fzf-native.nvim",
					build = "make"}
			}
		},

	},
	opts = {
		sources = {
			{name = "nvim_lsp"},
		},

		completion = {
			autocomplete = false,
		},

		window = {
			completion = {
				border = "rounded",
				--scrollbar = "║",
				winblend = 20,
				-- winhighlight = "Normal:CmpNormal",
				scrolloff = 3,
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
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
			["<M-d>"] = function () require("cmp").complete() end,
			["<M-q>"] = function () require("cmp").confirm({select = true, behavior=require("cmp").ConfirmBehavior.Append}) end,
			["<M-e>"] = function () require("cmp").abort() end,
			["<M-a>"] = function () require("cmp").select_next_item({behavior = require("cmp").SelectBehavior.Select}) end,
			["<M-s>"] = function () require("cmp").select_prev_item({behavior = require("cmp").SelectBehavior.Select}) end,
			["<M-z>"] = function () require("cmp").scroll_docs(-1) end,
			["<M-x>"] = function () require("cmp").scroll_docs(1) end,
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
	}
}
