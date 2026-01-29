return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local parsers = {
      "python",
      "typescript",
      "tsx",
    }

    -- TODO: install parsers like so
    require("nvim-treesitter").install(parsers)

    -- Create autocommand to enable treesitter for installed parsers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim
        -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        -- vim.wo.foldmethod = "expr"
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
