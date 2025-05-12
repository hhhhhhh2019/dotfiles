return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"debugloop/telescope-undo.nvim",
	},
	opts = {
		file_browser = {},
		undo = {}
	},
	config = function(opts)
		require("telescope").setup(opts)
		require("telescope").load_extension "file_browser"
		require("telescope").load_extension "undo"
	end
}
