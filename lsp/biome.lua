---@type vim.lsp.Config
return {
  cmd = { "biome-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "jsonc",
  },
  root_markers = { "biome.json", "biome.jsonc" },
  on_attach = function(_, bufnr)
    -- Stop eslint for this buffer since biome handles linting
    for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
      if c.name == "eslint" then
        c:stop()
      end
    end
  end,
}
