return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })

      -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim?tab=readme-ov-file#configuration
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Language servers
          "typescript-language-server",
          "eslint-lsp",
          "lua-language-server",
          "ruff",
          "pyright",
          "jsonls",
          "tailwindcss-language-server",
          "html-lsp",
          "rust-analyzer",

          -- Formatters
          "stylua",
          "prettierd",
          "prettier",

          -- Linters
          "mypy",
        },

        -- If mason-lspconfig is installed, mason-tool-installer can
        -- accept lspconfig package names unless the integration is
        -- disabled.
        integrations = {
          ["mason-lspconfig"] = true,
        },
      })

      -- https://github.com/mason-org/mason-lspconfig.nvim?tab=readme-ov-file#configuration
      require("mason-lspconfig").setup({
        automatic_enable = false, -- disable automatic enabling of lsp
      })
    end,
  },
}
