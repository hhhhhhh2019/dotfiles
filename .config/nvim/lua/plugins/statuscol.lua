return {
	"luukvbaal/statuscol.nvim",
	config = function ()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			setopt = true,
			segments = {
				{sign = {name = {"Dap"}}},
				{sign = {namespace = {"diagnostic"}}},
				{text = {builtin.foldfunc}},
				{text = {builtin.lnumfunc}},
				{sign = {namespace = {"gitsign"}}},
			},
		})
	end
}
