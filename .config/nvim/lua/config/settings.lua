vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.clipboard = "unnamedplus"

vim.opt.list = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false

vim.opt.undofile = true

vim.schedule(function()
	vim.cmd.colorscheme "catppuccin"
end)


local functions = require("config/functions")


vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function(_)
		vim.keymap.set("n", "<space>pm", functions.manim_render_scene, {buffer=true})
	end,
})

