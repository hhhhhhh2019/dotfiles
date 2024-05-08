return {
	"nvimdev/dashboard-nvim",
	opts = {
		theme = 'doom',
		config = {
			header = {
"",
"",
' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
"",
"",
"",
"",
"",
			},
			center = {
				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'Load Session',
					desc_hl = 'String',
					key = 'l',
					keymap = 'SPC s',
					key_hl = 'Number',
					key_format = ' %s',
					action = 'SessionsLoad .session'
				},
				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'Find File           ',
					desc_hl = 'String',
					key = 'f',
					keymap = 'SPC f',
					key_hl = 'Number',
					key_format = ' %s',
					action = 'Telescope file_browser'
				},
			},
			footer = {}  --your footer
		}
	}
}
