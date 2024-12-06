vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	focusable = false,
	silent = true,
	max_height = 7,
})


vim.opt.updatetime = 500


vim.api.nvim_create_autocmd("CursorHoldI", {
	callback = vim.lsp.buf.signature_help
})
