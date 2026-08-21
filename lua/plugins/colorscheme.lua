return {
  -- colorschemes
  {
    -- https://github.com/dchinmay2/alabaster.nvim
    "dchinmay2/alabaster.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    dependencies = {
      "f-person/auto-dark-mode.nvim",
    },
    config = function()
      vim.cmd("colorscheme alabaster")

      -- Setup auto dark mode
      require("auto-dark-mode").setup({
        update_interval = 3000,
        set_dark_mode = function()
          vim.o.background = "dark"
        end,
        set_light_mode = function()
          vim.o.background = "light"
        end,
      })
    end,
  },
  {
    "kepano/flexoki-neovim",
    enabled = false,
    name = "flexoki",
    lazy = true,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        dim_inactive_windows = true,
        extend_background_behind_borders = true,
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
      })
    end,
  },
  {
    -- https://github.com/tanmaymanojgandhi/circadia
    -- Neovim port lives at ports/neovim, not the repo root, so it must be
    -- appended to rtp manually; there's no colors/ file, so it's applied
    -- via require("circadia").setup() rather than :colorscheme.
    "tanmaymanojgandhi/circadia",
    enabled = true,
    lazy = false,
    priority = 1000,
    dependencies = {
      "f-person/auto-dark-mode.nvim",
    },
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/ports/neovim")
      -- clear require cache in case rtp was appended after first load attempt
      package.loaded["circadia"] = nil
      package.loaded["circadia.palette"] = nil

      local circadia = require("circadia")
      circadia.setup({ mode = vim.o.background })

      require("auto-dark-mode").setup({
        update_interval = 3000,
        set_dark_mode = function()
          vim.o.background = "dark"
          circadia.setup({ mode = "dark" })
        end,
        set_light_mode = function()
          vim.o.background = "light"
          circadia.setup({ mode = "light" })
        end,
      })
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    dependencies = {
      "f-person/auto-dark-mode.nvim",
    },
    config = function()
      require("cyberdream").setup({
        variant = "auto",
        saturation = 1,
        hide_fillchars = false,
      })

      vim.cmd.colorscheme("cyberdream")

      -- -- Setup auto dark mode
      -- require("auto-dark-mode").setup({
      --   update_interval = 3000,
      --   set_dark_mode = function()
      --     vim.o.background = "dark"
      --   end,
      --   set_light_mode = function()
      --     vim.o.background = "light"
      --   end,
      -- })
    end,
  },
}
