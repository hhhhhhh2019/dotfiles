vim.cmd.colorscheme("catppuccin")

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


vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd("syntax on")



local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = _border
	}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.signature_help, {
		border = _border
	}
)

vim.diagnostic.config{
	float={border=_border}
}


-- vim.api.nvim_command("au VimEnter * SessionRestore")


vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"


vim.cmd("au BufRead,BufNewFile *.comp,*.glsl,*.vert,*.frag   set filetype=glsl")
