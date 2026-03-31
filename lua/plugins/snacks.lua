require("snacks").setup({
  notifier = { enabled = true },
  gitbrowse = { enabled = true },
})

vim.keymap.set("n", "<leader>gB", function()
  Snacks.gitbrowse()
end, { desc = "Git browse" })
