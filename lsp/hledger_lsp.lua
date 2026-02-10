-- https://github.com/juev/hledger-lsp/tree/main

---@type vim.lsp.Config
return {
  cmd = { "hledger-lsp" },
  filetypes = { "hledger", "ledger", "journal" },
  root_markers = { ".git", "*.journal" },
  single_file_support = true,
}
