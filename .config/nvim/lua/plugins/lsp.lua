return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.pylsp.setup({capabilities = capabilities, pylsp = { plugins = {
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
		lspconfig.glslls.setup       ({capabilities = capabilities})
	end
}
