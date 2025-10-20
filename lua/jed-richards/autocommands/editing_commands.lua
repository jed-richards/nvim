local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight when yanking
autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = augroup("codemonkey-highlight-yank", {
    clear = true,
  }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- Remove trailing whitespace on write
autocmd({ "BufWritePre" }, {
  group = augroup("codemonkey-remove-trailing-ws", {
    clear = true,
  }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
