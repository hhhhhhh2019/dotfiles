return {
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


	local lspconfig = require("lspconfig")

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- lspconfig.pyright.setup      ({capabilities = capabilities, root_dir = vim.loop.cwd})
	lspconfig.pylsp.setup        ({capabilities = capabilities, pylsp = { plugins = {
		flake8 = {
			enabled = true,
		},

		pylint = {
			enabled = true,
		},

		rope_autoimport = {
			enabled = true,
		},

		rope_completion = {
			enabled = true,
		},

		black = {
			enabled = true,
		},

		mccabe = {
			enabled = true,
		},

		pycodestyle = {
			enabled = true,
		},

		yapf = {
			enabled = true,
		},
	}}})
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
