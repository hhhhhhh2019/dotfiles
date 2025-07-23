return {
{
	"mason-org/mason.nvim",
	opts = {}
},
{
	"mason-org/mason-lspconfig.nvim",
	dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
	opts = {}
},
{
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-dap" },
	opts = {
		handlers = {
			function(config)
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				config.capabilities.textDocument.foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true
				}
				require("mason-nvim-dap").default_setup(config)
			end
		}
	}
}
}
