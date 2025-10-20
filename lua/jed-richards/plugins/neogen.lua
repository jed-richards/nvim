-- [[
--
-- Neogen - A pluging for generating type annotations
--
-- ]]

return {
  "danymat/neogen",
  -- config = true,
  config = function()
    require("neogen").setup({
      enabled = true,
      snippet_engine = "luasnip",
      languages = {
        python = {
          template = {
            annotation_convention = "numpydoc",
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>ngf", function()
      require("neogen").generate({ type = "func" })
    end, { desc = "[N]eogen [G]enerate [f]unction" })

    vim.keymap.set("n", "<leader>ngc", function()
      require("neogen").generate({ type = "class" })
    end, { desc = "[N]eogen [G]enerate [C]lass" })

    vim.keymap.set("n", "<leader>ngt", function()
      require("neogen").generate({ type = "type" })
    end, { desc = "[N]eogen [G]enerate [T]ype" })

    vim.keymap.set("n", "<leader>ngF", function()
      require("neogen").generate({ type = "file" })
    end, { desc = "[N]eogen [G]enerate [F]ile" })
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
