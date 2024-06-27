return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	lazy = false,
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = true,
		})
		require("mason-lspconfig").setup_handlers {
			function (server_name)
				require("lspconfig")[server_name].setup {}
			end,
		}
	end
}
