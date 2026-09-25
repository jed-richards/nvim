return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- mason-nvim-dap bridges Mason-installed debug adapters (e.g. debugpy)
    -- into nvim-dap, mirroring how mason-lspconfig wires up LSPs.
    require("mason-nvim-dap").setup({
      ensure_installed = { "python" },
      handlers = {},
    })

    dapui.setup()

    -- debugpy is installed by Mason via mason-tool-installer (see lsp.lua)
    local mason_registry = require("mason-registry")
    local debugpy_path = mason_registry.get_package("debugpy"):get_install_path()
    require("dap-python").setup(debugpy_path .. "/venv/bin/python")

    -- Auto open/close the UI around debug sessions
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Signs
    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "B", texthl = "DapBreakpoint", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
      "DapStopped",
      { text = "->", texthl = "DapStopped", linehl = "DapStopped", numhl = "" }
    )

    -- Keymaps
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebug: Toggle [B]reakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug: [C]ontinue / Start" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug: Step [I]nto" })
    vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebug: Step [O]ver" })
    vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "[D]ebug: Step [O]ut" })
    vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "[D]ebug: Toggle [R]epl" })
    vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "[D]ebug: Run [L]ast" })
    vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "[D]ebug: [T]erminate" })
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "[D]ebug: Toggle [U]I" })
    vim.keymap.set(
      "n",
      "<leader>dB",
      function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      { desc = "[D]ebug: Conditional [B]reakpoint" }
    )

    -- Python-specific
    vim.keymap.set(
      "n",
      "<leader>dpr",
      function()
        require("dap-python").test_method()
      end,
      { desc = "[D]ebug [P]ython: [R]un nearest test method" }
    )
    vim.keymap.set(
      "n",
      "<leader>dpc",
      function()
        require("dap-python").test_class()
      end,
      { desc = "[D]ebug [P]ython: Run [C]lass" }
    )
  end,
}
