-- [[
--
-- All other plugins with minimal config
--
-- ]]

return {
  -- "gc" to comment visual selected regions
  { "numToStr/Comment.nvim", opts = {} },

  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        QUESTION = { color = "hint" },
      },
      signs = false,
    },
  },

  -- JSON Schemas
  "b0o/schemastore.nvim",
}
