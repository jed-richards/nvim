---@brief
---
--- https://github.com/rust-lang/rust-analyzer
---
--- See [docs](https://rust-analyzer.github.io/book/configuration.html) for extra settings.

---@type vim.lsp.Config
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  capabilities = {
    experimental = {
      serverStatusNotification = true,
      commands = {
        commands = {
          "rust-analyzer.showReferences",
          "rust-analyzer.runSingle",
          "rust-analyzer.debugSingle",
        },
      },
    },
  },

  settings = {
    ["rust-analyzer"] = {
      lens = {
        debug = { enable = true },
        enable = true,
        implementations = { enable = true },
        references = {
          adt = { enable = true },
          enumVariant = { enable = true },
          method = { enable = true },
          trait = { enable = true },
        },
        run = { enable = true },
        updateTest = { enable = true },
      },
      check = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
    },
  },
}
