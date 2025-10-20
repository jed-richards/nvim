-- [[
--
-- iron.nvim - Interactive Repl Over Neovim
--
-- Keymaps using <leader>r prefix:
-- - <leader>ro: toggle REPL
-- - <leader>rR: restart REPL
-- - <leader>r[mlpfubr]: send operations
-- - <leader>r[icq]: interact/clear/quit
--
-- ]]

return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "zsh" },
          },
          python = {
            command = function()
              if vim.fn.executable("ipython") == 1 then
                return { "ipython", "--no-autoindent" }
              else
                return { "python3" }
              end
            end,
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
            env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
          },
        },
        -- set the file type of the newly created repl to ft
        -- bufnr is the buffer id of the REPL and ft is the filetype of the
        -- language being used for the REPL.
        repl_filetype = function(bufnr, ft)
          return ft
          -- or return a string name such as the following
          -- return "iron"
        end,
        -- How the repl window will be displayed
        -- See below for more information
        -- repl_open_cmd = view.bottom(40),
        repl_open_cmd = "vertical split", -- use vim command directly

        -- repl_open_cmd can also be an array-style table so that multiple
        -- repl_open_commands can be given.
        -- When repl_open_cmd is given as a table, the first command given will
        -- be the command that `IronRepl` initially toggles.
        -- Moreover, when repl_open_cmd is a table, each key will automatically
        -- be available as a keymap (see `keymaps` below) with the names
        -- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
        -- For example,
        --
        -- repl_open_cmd = {
        --   view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
        --   view.split.rightbelow("%25")  -- cmd_2: open a repl below
        -- }
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        -- REPL management
        toggle_repl = "<leader>ro", -- "repl open"
        restart_repl = "<leader>rR", -- "repl restart" (capital R for restart)

        -- Send operations
        send_motion = "<leader>rm", -- send motion/text object
        visual_send = "<leader>rm", -- send visual selection
        send_line = "<leader>rl", -- send current line
        send_file = "<leader>rf", -- send entire file
        send_paragraph = "<leader>rp", -- send paragraph
        send_until_cursor = "<leader>ru", -- send from start to cursor
        send_code_block = "<leader>rb", -- send code block/cell
        send_code_block_and_move = "<leader>rn", -- send block and move to next

        -- REPL interaction
        cr = "<leader>r<cr>", -- send carriage return
        interrupt = "<leader>ri", -- interrupt execution
        clear = "<leader>rc", -- clear REPL
        exit = "<leader>rq", -- quit REPL
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    })

    -- -- iron also has a list of commands, see :h iron-commands for all available commands
    -- vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<cr>")
    -- vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>")
  end,
}
