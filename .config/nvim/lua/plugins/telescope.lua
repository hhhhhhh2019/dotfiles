return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		-- "Zane-/howdoi.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	opts = {
		extensions = {
			["ui-select"] = {
				-- require("telescope.themes").get_dropdown({})
			},

			-- howdoi = {
			-- 	num_answers = 5,
			-- },

			file_browser = {
				auto_depth = true,
			},
		}
	},
	init = function ()
		require("telescope").load_extension("file_browser")
		-- require("telescope").load_extension("howdoi")
		require("telescope").load_extension("ui-select")
	end
}
