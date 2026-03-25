return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePost" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "mypy" },
    }

    -- Determine which Python to use for type checking
    local venv_path = os.getenv("VIRTUAL_ENV")
    local python_bin = venv_path and (venv_path .. "/bin/python") or "python3"

    -- Setup Mypy
    -- Neovim will automatically pick the first 'mypy' it finds in your $PATH.
    -- (Venv first, then Mason/Global)
    lint.linters.mypy.args = {
      "--show-column-numbers",
      "--show-error-codes",
      "--hide-error-context",
      "--no-color",
      "--no-error-summary",
      "--no-pretty",
      "--python-executable",
      python_bin,
    }

    -- Trigger on Save
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
