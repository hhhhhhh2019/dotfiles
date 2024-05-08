return {
	"natecraddock/sessions.nvim",
	opts = {
		events = { "VimLeavePre", "WinEnter" },
		session_filepath = vim.fn.stdpath("data") .. "/sessions",
		absolute = true,
	}
}
