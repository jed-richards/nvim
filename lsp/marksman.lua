-- Marksman language server configuration
--
-- - https://github.com/artempyanykh/marksman
-- - https://github.com/artempyanykh/marksman/blob/main/Tests/default.marksman.toml
-- - https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#marksman

---@type vim.lsp.Config
return {
  cmd = { "marksman", "server" },
  filetypes = { "markdown", "markdown.mdx" },
  root_markers = { ".git", ".marksman.toml" },
}
