---@type vim.lsp.Config
return {
  cmd = { "tilt", "lsp", "start" },
  filetypes = { "tiltfile" },
  root_markers = { "Tiltfile", ".git" },
}
