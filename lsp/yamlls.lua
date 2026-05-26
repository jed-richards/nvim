---@type vim.lsp.Config
return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = {
    "yaml",
    "yaml.docker-compose",
    "yaml.gitlab",
    "yaml.helm-values",
  },
  root_markers = { ".git" },
  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas(),
      validate = true,
      schemaStore = { enable = false, url = "" },
    },
  },
}
