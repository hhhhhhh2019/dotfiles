return {
-- 	{"williamboman/mason-lspconfig.nvim",
-- config = function()
-- 	local mason_lsp = require("mason-lspconfig")
--
-- 	mason_lsp.setup()
-- end},


	{"folke/neodev.nvim",
config = function()
	local neodev = require("neodev")

	neodev.setup({
		library = {
			enabled = true,
			plugins = { "nvim-dap-ui" },
			types = true,
			runtime = true,
		},
		lspconfig = true,
	})



	-- neodev must be loaded before lspconfig

	local lspconfig = require("lspconfig")

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	lspconfig.pyright.setup      ({capabilities = capabilities})
	lspconfig.clangd.setup       ({capabilities = capabilities})
	lspconfig.bashls.setup       ({capabilities = capabilities})
	lspconfig.lua_ls.setup       ({capabilities = capabilities})
	lspconfig.quick_lint_js.setup({capabilities = capabilities})
	lspconfig.gdscript.setup     ({capabilities = capabilities})
	lspconfig.julials.setup      ({capabilities = capabilities})
end},


	{"neovim/nvim-lspconfig",
config = function()
end},


	{"filipdutescu/renamer.nvim",
config = function()
	require("renamer").setup({})
end},
}
