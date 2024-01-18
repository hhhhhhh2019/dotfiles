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


require("catppuccin").setup({
	flavour = "mocha",
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
		nvimtree = true,
		treesitter = true,
		notify = false,
		markdown = true,
		mini = {
				enabled = true,
				indentscope_color = "",
		},
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
})

--vim.cmd("colorscheme dracula")
vim.cmd("colorscheme catppuccin")


require("fidget").setup {
	notification = {
		window = {
			winblend = 0,
		},
	}
}



require("lualine").setup({
	options = {
		icons_enabled = true,
		--theme = "dracula-nvim",
		theme = "catppuccin",

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


local tb = require("telescope.builtin")
local tt = require("telescope.themes")


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
		},

		dap = {
		},

		howdoi = {
			num_answers = 5,
		},
	}
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("undo")
require("telescope").load_extension("dap")
require("telescope").load_extension("howdoi")



local capabilities = require("cmp_nvim_lsp").default_capabilities()


require("lspconfig").pyright.setup({
	capabilities = capabilities,
})

-- require("lspconfig").pylsp.setup({
-- 	capabilities = capabilities,
-- })

require("lspconfig").clangd.setup({
	capabilities = capabilities,
})

require("lspconfig").bashls.setup({
	capabilities = capabilities,
})

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
})

require("lspconfig").quick_lint_js.setup({
	capabilities = capabilities,
})


require("lspconfig").gdscript.setup({
	capabilities = capabilities,

	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	}
})


require("lspconfig").julials.setup({
	capabilities = capabilities,
})


local cmp = require("cmp")

cmp.event:on('confirm_done', require("nvim-autopairs.completion.cmp").on_confirm_done())

cmp.setup({
	sources = cmp.config.sources({
		{name = "nvim_lsp"},
		{name = "path"},
		{name = "fuzzy_buffer"},
		{name = "luasnip"},
	}),

	snippet = {
		-- expand = function(args)
		-- 	require("luasnip").lsp_expand(args.body)
		-- end
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

	mapping = cmp.mapping.preset.insert({
		["<M-d>"] = cmp.mapping.complete(),
		["<M-q>"] = cmp.mapping.confirm({select = true, behavior=cmp.ConfirmBehavior.Replace}),
		["<M-e>"] = cmp.mapping.abort(),
		["<M-a>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
		["<M-s>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})
	}),

	preselect = cmp.PreselectMode.Item,

	completion = {
		keyword_length = 1,
		completeopt = "menu,menuone,noinsert,noselect",
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



require("mini.align").setup({
	mappings = {
		start_with_preview = '<space>a',
	},
})


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



require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
})


local dap, dapui = require("dap"), require("dapui")

-- dap.adapters.gdb = {
-- 	type = "executable",
-- 	command = "gdb",
-- 	args = { "-i", "dap" }
-- }
--
-- dap.configurations.c = {
-- 	{
-- 		name = "Launch",
-- 		type = "gdb",
-- 		request = "launch",
-- 		program = function()
-- 			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 	}
-- }


dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	executable = {
		command = '/usr/bin/codelldb',
		args = {"--port", "${port}"},
	}
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


dap.adapters.python = function(cb, config)
	if config.request == 'attach' then
		---@diagnostic disable-next-line: undefined-field
		local port = (config.connect or config).port
		---@diagnostic disable-next-line: undefined-field
		local host = (config.connect or config).host or '127.0.0.1'
		cb({
			type = 'server',
			port = assert(port, '`connect.port` is required for a python `attach` configuration'),
			host = host,
			options = {
				source_filetype = 'python',
			},
		})
	else
		cb({
			type = 'executable',
			command = 'python',
			args = { '-m', 'debugpy.adapter' },
			options = {
				source_filetype = 'python',
			},
		})
	end
end


dap.configurations.python = {
	{
		type = 'python';
		request = 'launch';
		name = "Launch file";

		program = "${file}";
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
				return cwd .. '/venv/bin/python'
			elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
				return cwd .. '/.venv/bin/python'
			else
				return '/usr/bin/python'
			end
		end;
	},
}


require("nvim-dap-virtual-text").setup({
	show_stop_reason = false
})


dapui.setup()


dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end


local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})



require("calculator")



-- require('hologram').setup{
-- 	auto_display = true
-- }


-- keybinds


function get_visual_selection()
	local top, bot = vim.fn.getpos("'<"), vim.fn.getpos("'>")

	local startline = top[2] - 1
	local endline = bot[2]

	print(top[0], top[1], top[2], top[3], bot[0], bot[1], bot[2], bot[3])

	local lines = vim.api.nvim_buf_get_lines(0, startline, endline, false)

	print(lines)
end


local function calculate_selection()
	local selection = get_visual_selection()
	--local result = vim.fn.eval(selection)
	--print(result)
end




wk.register({
	--["<space>dc"] = {vim.lsp.buf.declaration, "declaration"},
	--["<space>de"] = {vim.lsp.buf.definition, "definition"},
	["<space>dc"] = {tb.lsp_implementations, "declaration"},
	["<space>de"] = {tb.lsp_definitions, "definition"},
	["<space>r"] = {tb.lsp_references, "references for word under the cursor"},
	["<space>qf"] = {vim.lsp.buf.code_action, "quick fixes"},
	["<space>qd"] = {tb.diagnostics, "lists diagnostics for all open buffers"},

	["<space>t"] = {tb.treesitter, "lists function names, variables, from Treesitter"},

	["<space>m"] = {require("calculator").calculate, "calculate math expr", mode="v"},

	-- ["<C-g>"] = {function () return vim.fn["codeium#Accept"]() end, "codeium accept", mode="i"},

	-- ["<space>aa"] = {
	-- 	function()
	-- 		require("align").align_to_string({
	-- 				preview = true,
	-- 				regex = false
	-- 		})
	-- 	end, "align", mode = "v"
	-- },
	--
	-- ["<space>ar"] = {
	-- 	function()
	-- 		require("align").align_to_string({
	-- 				preview = true,
	-- 				regex = true
	-- 		})
	-- 	end, "align with regex", mode = "v"
	-- },

	-- {
	-- 	function()
	-- 		align_all_selection(vim.fn.input("Align character: "), align_line_left)
	-- 	end, "align", mode = "v"
	-- },

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

vim.keymap.set('n', "<C-S-Down>", "<cmd>m +1<cr>")
vim.keymap.set('n', "<C-S-Up>",   "<cmd>m -2<cr>")

vim.keymap.set('n', "<F12>", function()
	dapui.eval(vim.fn.input("dap eval "))
end)
vim.keymap.set('n', "<F3>", dapui.float_element)
vim.keymap.set('n', "<F2>", dap.toggle_breakpoint)
vim.keymap.set('n', "<F5>", dap.continue)
vim.keymap.set('n', "<F11>", dap.step_into)
vim.keymap.set('n', "<F10>", dap.step_over)
vim.keymap.set('n', "<F9>", dap.step_out)

vim.keymap.set('v', "<F12>", get_visual_selection)

vim.keymap.set('i', "<F2>", require("renamer").rename)

-- vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
-- vim.keymap.set("i", "<c-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true, silent = true })
-- vim.keymap.set("i", "<c-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true, silent = true })
-- vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })

--vim.keymap.set("n", "<space>dc", vim.lsp.buf.declaration)
--vim.keymap.set("n", "<space>de", vim.lsp.buf.definition)
