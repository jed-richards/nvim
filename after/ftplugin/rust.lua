-- Set keymap to toggle inlayhints
vim.keymap.set("n", "<leader>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle [t]ype [h]ints" })
