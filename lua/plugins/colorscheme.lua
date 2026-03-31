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
