local _border = "rounded"

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


return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.pylsp.setup({pylsp = { plugins = {
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
		lspconfig.clangd.setup       ({})
		lspconfig.bashls.setup       ({})
		lspconfig.lua_ls.setup       ({})
		lspconfig.quick_lint_js.setup({})
		lspconfig.gdscript.setup     ({})
		lspconfig.julials.setup      ({})
		lspconfig.glslls.setup       ({})
	end
}
