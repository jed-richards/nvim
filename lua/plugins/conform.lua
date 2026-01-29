return {
  "stevearc/conform.nvim",

  ---@type conform.setupOpts
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },

      -- For standard JavaScript and React files (.js, .jsx)
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },

      -- For TypeScript and React files (.ts, .tsx)
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },

      python = {
        -- To fix auto-fixable lint errors.
        -- "ruff_fix",
        -- To run the Ruff formatter.
        "ruff_format",
        -- To organize the imports.
        "ruff_organize_imports",
      },
      --
      --
      -- yaml = { "prettier" },
      -- css = { "prettier" },
      -- html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      -- astro = { "prettier" },
      markdown = { "prettier" },
      --
      -- typst = { "typstyle" },
    },
  },
}
