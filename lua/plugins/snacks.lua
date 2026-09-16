-- https://github.com/folke/snacks.nvim
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    notifier = { enabled = true },
    gitbrowse = { enabled = true },
    zen = {
      enabled = true,
      win = {
        -- force an opaque backdrop so the buffer behind zen mode isn't visible
        -- (with a transparent colorscheme, snacks skips the backdrop entirely)
        backdrop = { transparent = false, blend = 0 },
        wo = {
          number = false,
          relativenumber = false,
          colorcolumn = "",
        },
        keys = {
          ["<leader>tn"] = function(self)
            local wo = vim.wo[self.win]
            wo.number = not wo.number
            wo.relativenumber = wo.number
          end,
        },
      },
    },
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
