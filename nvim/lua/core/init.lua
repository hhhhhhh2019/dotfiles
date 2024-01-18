vim.opt.clipboard = "unnamedplus"
-- vim.opt.cursorcolumn = true
vim.opt.cursorline = true

vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.laststatus = 3
vim.opt.showmode = false

vim.opt.confirm = true

vim.opt.number = true
vim.opt.ruler = true

vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.undofile = true

vim.opt.timeoutlen = 500
vim.opt.updatetime = 750

vim.opt.mouse = "a"

vim.opt.shortmess:append "I"

vim.opt.list = true


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
