vim.g.mapleader = " "

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.clipboard = "unnamedplus"

vim.opt.list = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = false
vim.opt.softtabstop = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

vim.opt.undofile = true

vim.cmd("autocmd! BufNewFile,BufRead *.vs,*.fs,*.frag,*.comp,*.vert set ft=glsl")
