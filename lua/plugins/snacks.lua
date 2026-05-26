-- https://github.com/folke/snacks.nvim
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    notifier = { enabled = true },
    gitbrowse = { enabled = true },
    zen = { enabled = true },
  },

  keys = {
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git browse",
    },
    {
      "<leader>tz",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen-mode",
    },
  },
}
