return {
-- 	{"williamboman/mason-lspconfig.nvim",
-- config = function()
-- 	local mason_lsp = require("mason-lspconfig")
--
-- 	mason_lsp.setup()
-- end},

	{"neovim/nvim-lspconfig",
config = function()
	local lspconfig = require("lspconfig")

	lspconfig.pyright.setup({})
	lspconfig.clangd.setup({})
	lspconfig.bashls.setup({})
	lspconfig.lua_ls.setup({})
	lspconfig.quick_lint_js.setup({})
	lspconfig.gdscript.setup({})
	lspconfig.julials.setup({})
end}
}
