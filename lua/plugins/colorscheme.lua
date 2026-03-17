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
    lazy = true,
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
    "scottmckendry/cyberdream.nvim",
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
}
