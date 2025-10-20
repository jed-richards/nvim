-- Nix language server configuration

---@type vim.lsp.Config
return {
  cmd = { "nil" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", "default.nix", "shell.nix", ".git" },
}
