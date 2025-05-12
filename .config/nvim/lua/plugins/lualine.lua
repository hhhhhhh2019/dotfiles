return {
	"nvim-lualine/lualine.nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {

options = {
	icons_enabled = true,
	theme = "catppuccin",
	component_separators = { left =  '∣', right = ''},
	section_separators = { left = '◗', right = '◖'},
},

sections = {
	lualine_a = {
		{ 'mode', fmt = function(str) return str:sub(1,1) end },
	},
	lualine_b = {
		{ 'filesize' },
		{ 'filetype', icon_only = true, padding = { left = 1, right = 0 }, separator = {} },
		{ 'filename', padding = { left = 0, right = 1 } },
	},
	lualine_c = {
		{ 'location' },
	},
	lualine_x = {'encoding'},
	lualine_y = {
		'searchcount',
		'selectioncount',
	},
	lualine_z = {
		{ 'diagnostics' }
	},
},

	}
}
