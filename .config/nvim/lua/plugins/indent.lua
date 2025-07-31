return {
{
	"nmac427/guess-indent.nvim",
	priority = 100,
	opts = {}
},
{
	"aruyu/nvim-indentconfig",
	priority = 101,
	opts = {
		default = {
			expandtab = false,
			size = 4
		},
		exclusions = {
			{
				expandtab = true,
				size = 4,
				filetype = { "python", "haskell" },
			},
		}
	}
}
}
