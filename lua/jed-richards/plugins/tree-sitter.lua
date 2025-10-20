-- [[
--
-- Highlight, edit, and navigate code
--
-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--
-- ]]

return { --
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "markdown", "vim", "vimdoc" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
