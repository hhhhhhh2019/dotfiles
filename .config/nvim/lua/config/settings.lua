vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.clipboard = "unnamedplus"

vim.opt.list = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- vim.opt.softtabstop = 2
-- vim.opt.expandtab = false

vim.opt.undofile = true

vim.opt.showmode = false

vim.api.nvim_create_autocmd("TermOpen", {
	command = "setlocal nonumber norelativenumber"
})
