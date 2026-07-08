return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePost" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "mypy" },
      markdown = { "vale" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
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

        -- actionlint only applies to GitHub Actions workflow files, so it's
        -- run explicitly here rather than via linters_by_ft.yaml (which
        -- would run it against every yaml file)
        local filename = vim.api.nvim_buf_get_name(0)
        if filename:match("%.github/workflows/.+%.ya?ml$") then
          lint.try_lint("actionlint")
        end
      end,
    })
  end,
}
