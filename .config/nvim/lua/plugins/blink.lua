local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then
    return false
  end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match("%s") == nil
end


return {
	"saghen/blink.cmp",
	version = '1.*',
	opts = {
		completion = {
			documentation = { auto_show = false },
			menu = { auto_show = true },
			list = { selection = { preselect = false }, cycle = { from_top = false } },
			accept = { auto_brackets = { enabled = true }, },
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		fuzzy = { implementation = "prefer_rust" },
		cmdline = { enabled = true },
		keymap = {
			preset = "none",
			['<Tab>'] = {
				'show',
				function(cmp)
					if has_words_before() then
						return cmp.insert_next()
					end
				end,
				'fallback',
			},
			['<S-Tab>'] = { 'insert_prev' },
		}
	}
}
