require("core")
require("core.mappings")

require("lazy").setup("plugins")

vim.cmd.colorscheme("catppuccin")

vim.o.foldcolumn = "1"
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]


vim.o.langmap="ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
