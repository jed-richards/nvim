return {
  -- :Telescope help_tags
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- optional but recommended
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },

  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = require("telescope.themes").get_dropdown(),
      },
    })

    -- Enable telescope extensions, if installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    vim.keymap.set(
      "n",
      "<leader>ff",
      builtin.find_files,
      { desc = "Telescope find files" }
    )
    vim.keymap.set(
      "n",
      "<leader>fg",
      builtin.live_grep,
      { desc = "Telescope live grep" }
    )
    vim.keymap.set(
      "n",
      "<leader>fb",
      builtin.buffers,
      { desc = "Telescope buffers" }
    )
    vim.keymap.set(
      "n",
      "<leader>fh",
      builtin.help_tags,
      { desc = "Telescope help tags" }
    )

    -- set keymaps
    vim.keymap.set(
      "n",
      "<leader>sh",
      builtin.help_tags,
      { desc = "[S]earch [H]elp" }
    )
    vim.keymap.set(
      "n",
      "<leader>sk",
      builtin.keymaps,
      { desc = "[S]earch [K]eymaps" }
    )
    vim.keymap.set(
      "n",
      "<leader>sf",
      builtin.find_files,
      { desc = "[S]earch [F]iles" }
    )
    vim.keymap.set(
      "n",
      "<leader>ss",
      builtin.builtin,
      { desc = "[S]earch [S]elect Telescope" }
    )
    vim.keymap.set(
      "n",
      "<leader>sw",
      builtin.grep_string,
      { desc = "[S]earch current [W]ord" }
    )
    vim.keymap.set(
      "n",
      "<leader>sg",
      builtin.live_grep,
      { desc = "[S]earch by [G]rep" }
    )
    vim.keymap.set(
      "n",
      "<leader>sd",
      builtin.diagnostics,
      { desc = "[S]earch [D]iagnostics" }
    )
    -- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    -- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set(
      "n",
      "<leader>sb",
      builtin.buffers,
      { desc = "[S]earch [B]uffers" }
    )
    vim.keymap.set(
      "n",
      "<leader>sm",
      builtin.man_pages,
      { desc = "[S]earch [M]an Pages" }
    )

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })
  end,
}
