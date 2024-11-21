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


vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	-- buffer = 1,
	callback = function(_)
		vim.api.nvim_buf_set_keymap(0, "n", "<space>pm", "lua require('config.functions').manim_render_scene", {expr=true})
		-- vim.keymap.set("n", "<space>pm", functions.manim_render_scene)
	end,
})

