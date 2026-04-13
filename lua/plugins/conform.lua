return {
  "stevearc/conform.nvim",

  ---@type conform.setupOpts
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters = {
      biome = {
        -- Only run biome when a biome config is found in the project
        condition = function(_, ctx)
          return vim.fs.find(
            { "biome.json", "biome.jsonc" },
            { path = ctx.filename, upward = true }
          )[1] ~= nil
        end,
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },

      -- For standard JavaScript and React files (.js, .jsx)
      -- biome runs first when biome.json is present, otherwise prettierd/prettier
      javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },

      -- For TypeScript and React files (.ts, .tsx)
      typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },

      python = {
        -- To fix auto-fixable lint errors.
        "ruff_fix",
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
      json = { "biome", "prettierd", "prettier", stop_after_first = true },
      jsonc = { "biome", "prettierd", "prettier", stop_after_first = true },
      -- astro = { "prettier" },
      markdown = { "prettier" },
      --
      -- typst = { "typstyle" },
    },
  },
}
