-- SourceKit-LSP language server configuration

---@type vim.lsp.Config
return {
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift" },
  root_markers = { "Package.swift", ".git" },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}
