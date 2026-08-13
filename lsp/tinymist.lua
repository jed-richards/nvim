---@brief
---
--- https://github.com/Myriad-Dreamin/tinymist
---
--- `tinymist`, a language server for Typst

---@type vim.lsp.Config
return {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  root_markers = { ".git" },
  single_file_support = true,
}
