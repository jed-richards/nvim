-- YAML language server configuration

---@type vim.lsp.Config
return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  root_markers = { ".yamllint", ".yamllint.yml", ".yamllint.yaml", ".git" },
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
