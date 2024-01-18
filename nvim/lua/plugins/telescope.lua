return {
	{"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"debugloop/telescope-undo.nvim",
			"Zane-/howdoi.nvim",
		},
config = function()
	local ts = require("telescope")

	ts.setup({
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({})
			},

			undo = {
			},

			dap = {
			},

			howdoi = {
				num_answers = 5,
			},
		}
	})

	ts.load_extension("ui-select")
	ts.load_extension("undo")
	ts.load_extension("dap")
	ts.load_extension("howdoi")
end},
}
