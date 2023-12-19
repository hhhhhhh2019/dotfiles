vim.opt.number     = true
vim.opt.list       = true
vim.opt.tabstop    = 2
vim.opt.shiftwidth = 2

vim.o.timeout      = true
vim.o.timeoutlen   = 300

vim.opt.confirm    = true
vim.opt.filetype   = "on"

vim.opt.clipboard:append { "unnamed", "unnamedplus" }

vim.opt.autoread = true

vim.cmd("colorscheme dracula")


require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "dracula-nvim",

		component_separators = { left = "", right = ""},
		section_separators   = { left = "", right = ""},
	},

	sections = {
		lualine_a = {"mode"},
		lualine_b = {"filename", "filetype"},
		lualine_c = {"branch", "diff"},
		lualine_x = {"diagnostics"},
		lualine_y = {"searchcount"},
		lualine_z = {"location", "progress"}
	},

	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})


local wk = require("which-key")

wk.setup({

})


require("nvim-treesitter.configs").setup({
	auto_install = true,

	highlight = {
		enable = true,
	},

	autotag = {
		enable = true,
	}
})



require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"%.o"
		}
	},

	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({})
		},

		undo = {
		}
	}
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("undo")


require("lspconfig").pyright.setup({

})


local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").clangd.setup({
	capabilities = capabilities,
})


require("lspconfig").quick_lint_js.setup({})


local cmp = require("cmp")

cmp.setup({
	sources = cmp.config.sources({
		{name = "nvim_lsp"},
		{name = "path"},
		{name = "fuzzy_buffer"},
		{name = "luasnip"},
	}),

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},

	window = {
		completion = {
			border = "rounded",
			scrollbar = "║",
		},
		documentation = {
			border = nil,
			scrollbar = "",
		},
	},

	mapping = cmp.mapping.preset.insert({
		["<M-d>"] = cmp.mapping.complete(),
		["<M-q>"] = cmp.mapping.confirm({ select = true }),
		["<M-e>"] = cmp.mapping.abort(),
	})
})


require("gitsigns").setup({

})


-- require("colorizer").setup({
-- 	user_default_options = {
-- 		RGB = true,
-- 		RRGGBB = true,
-- 		RRGGBBAA = true,
-- 		AARRGGBB = false,
-- 		css = true,
-- 		css_fn = true,
-- 		mode = "background",
-- 	}
-- })
require("colorizer").setup(
	nil,
	{
		names = true,
		RGB = true,
		RRGGBB = true,
		RRGGBBAA = true,
		css = true,
		mode = "background",
	}
)


require("neoscroll").setup({})
require("cinnamon").setup({})


require("renamer").setup({
	title = "Rename",
	min_width = 15,
	max_width = 45,
	border = true,
	border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	show_refs = true,
	with_qf_list = true,
	with_popup = true,
})


require("scope").setup({})


require("nvim-autopairs").setup({
	map_bs = false,
})


require("Comment").setup({
	padding = true,

	toggler = {
		line = "gcc",
		block = "gbc",
	},
	opleader = {
		line = 'gc',
		block = 'gb',
	},

	mappings = {
		basic = true,
		extra = true,
	},
})


local wilder = require("wilder")

local highlighters = {
	wilder.pcre2_highlighter(),
	wilder.lua_fzy_highlighter(),
}

wilder.setup({
	modes = {':', '/', '?'}
})

wilder.set_option('pipeline', {
	wilder.branch(
		wilder.cmdline_pipeline({
			fuzzy = true
		})
	)
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		highlighter = highlighters,
		min_width = '100%',
		border = 'rounded',

		left = {
			' ',
			wilder.popupmenu_devicons()
		},
		right = {
			' ',
			wilder.popupmenu_scrollbar(),
		},
	})
))



-- require("mini.align").setup({
-- 	
-- })


-- functions

-- https://gist.github.com/GnikDroy/c35ca0adaeca4f3c6e6193dd4abe6a0f

local function split(line, pattern)
	if #pattern == 0 or #line == 0 then return { line } end
	local sections = {}
	local index = 1
	while index <= #line do
		local start_idx, end_idx = string.find(line, pattern, index)
		if start_idx ~= nil and end_idx >= start_idx then
			table.insert(sections, string.sub(line, index, start_idx - 1))
			table.insert(sections, string.sub(line, start_idx, end_idx))
			index = end_idx + 1
		else
			table.insert(sections, string.sub(line, index, #line))
			index = #line + 1
		end
	end
	return sections
end

local function compute_max_section_widths(splits)
	local max_split_length = 0
	for _, parts in ipairs(splits) do
		max_split_length = math.max(max_split_length, #parts)
	end

	local max_section_widths = {}
	for i = 1, max_split_length do
		max_section_widths[i] = 0
	end

	for _, parts in ipairs(splits) do
		if #parts ~= 1 then
			for i, part in ipairs(parts) do
				max_section_widths[i] = math.max(max_section_widths[i], #part)
			end
		end
	end
	return max_section_widths
end

local function align_line_right(parts, max_section_widths)
	for i, part in ipairs(parts) do
		-- last part doesn't need to be padded if empty string
		if #part ~= 0 or #parts ~= i then
			parts[i] = string.rep(" ", max_section_widths[i] - #part) .. part
		end
	end
	return parts
end

local function align_line_left(parts, max_section_widths)
	for i, part in ipairs(parts) do
		if i ~= #parts then -- last part doesn't need to be padded
			parts[i] = part .. string.rep(" ", max_section_widths[i] - #part)
		end
	end
	return parts
end

local function align_line_center(parts, max_section_widths)
	for i = 1, #parts do
		local left_pad = math.floor((max_section_widths[i] - #parts[i]) / 2)
		parts[i] = string.rep(" ", left_pad) .. parts[i]
		local right_pad = max_section_widths[i] - #parts[i]
		-- last part doesn't need to be padded on the right
		if i ~= #parts then
			parts[i] = parts[i] .. string.rep(" ", right_pad)
		end
	end
	return parts
end

local function align_all_lines(lines, pattern, align_fn)
	local splits = {}
	for _, line in ipairs(lines) do
		table.insert(splits, split(line, pattern))
	end
	local max_section_widths = compute_max_section_widths(splits)

	local new_lines = {}
	for _, parts in ipairs(splits) do
		local new_line = {}
		-- No need to align only one part
		local aligned = #parts == 1 and parts or align_fn(parts, max_section_widths)
		for _, part in ipairs(aligned) do
			table.insert(new_line, part)
		end
		table.insert(new_lines, table.concat(new_line))
	end
	return new_lines
end

local function align_all_selection(pattern, align_fn)
	local top, bot = vim.fn.getpos("'<"), vim.fn.getpos("'>")
	local startline = top[2] - 1
	local endline = bot[2]
		if startline > endline then
			tmp = startline
			startline = endline
			endline = tmp
		end
	local lines = vim.api.nvim_buf_get_lines(0, startline, endline, false)
	lines = align_all_lines(lines, pattern, align_fn)
	vim.api.nvim_buf_set_lines(0, startline, endline, false, lines)
	vim.fn.setpos("'<", top)
	vim.fn.setpos("'>", bot)
end

local function create_preview_fn(align_fn)
	return function(opts, _, _)
		align_all_selection(opts.args, align_fn)
		return 1
	end
end




vim.api.nvim_create_user_command("Align", function(opts)
	align_all_selection(opts.args, align_line_left)
end, {
	range = true,
	nargs = "+",
	preview = create_preview_fn(align_line_left)
})



require("hex").setup()


-- keybinds


local tb = require("telescope.builtin")
local tt = require("telescope.themes")


wk.register({
	--["<space>dc"] = {vim.lsp.buf.declaration, "declaration"},
	--["<space>de"] = {vim.lsp.buf.definition, "definition"},
	["<space>dc"] = {tb.lsp_implementations, "declaration"},
	["<space>de"] = {tb.lsp_definitions, "definition"},
	["<space>r"] = {tb.lsp_references, "references for word under the cursor"},
	["<space>qf"] = {vim.lsp.buf.code_action, "quick fixes"},
	["<space>qd"] = {tb.diagnostics, "lists diagnostics for all open buffers"},

	["<space>t"] = {tb.treesitter, "lists function names, variables, from Treesitter"},

	["<space>aa"] = {
		function()
			align_all_selection(vim.fn.input("Align character: "), align_line_left)
		end, "align", mode = "v"
	},

	--["<space>a"]

	["fb"] = {tb.buffers, "show buffers"},
	["ff"] = {tb.find_files, "find files"},
	["fg"] = {tb.live_grep, "live grep"},
})

-- vim.keymap.set('n', "x", "\"_x")
-- vim.keymap.set('v', "x", "\"_x")

vim.keymap.set('n', "<C-Up>", "<cmd>wincmd k<cr>")
vim.keymap.set('n', "<C-Down>", "<cmd>wincmd j<cr>")
vim.keymap.set('n', "<C-Left>", "<cmd>wincmd h<cr>")
vim.keymap.set('n', "<C-Right>", "<cmd>wincmd l<cr>")

vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

--vim.keymap.set("n", "<space>dc", vim.lsp.buf.declaration)
--vim.keymap.set("n", "<space>de", vim.lsp.buf.definition)
