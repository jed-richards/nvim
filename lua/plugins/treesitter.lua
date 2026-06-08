return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local parsers = {
      "dockerfile",
      "ledger",
      "lua",
      "python",
      "starlark",
      "typescript",
      "tsx",
      "yaml",
    }

    -- TODO: install parsers like so
    require("nvim-treesitter").install(parsers)

    -- Tiltfile uses Starlark syntax; map the filetype to the parser
    vim.treesitter.language.register("starlark", "tiltfile")

    -- Create autocommand to enable treesitter for installed parsers
    local ft_patterns = vim.list_extend({ unpack(parsers) }, { "tiltfile" })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = ft_patterns,
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
