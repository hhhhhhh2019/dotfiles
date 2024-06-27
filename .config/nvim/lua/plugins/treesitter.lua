return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			hightlight = {
				enabled = true,
			},
			indent = {
				enable = true
			},
		})
	end
}
