return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"debugloop/telescope-undo.nvim",
	},
	opts = {
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({})
			},

			file_browser = {
				auto_depth = true,
			},

			undo = {},
		}
	},
	init = function ()
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("undo")
	end
}
