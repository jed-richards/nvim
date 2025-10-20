-- [[
--
-- My local plugins.
--
-- ]]

return {
  -- dir = "~/plugins/caseconvert.nvim",
  -- config = function()
  -- 	require("caseconvert").setup()
  -- end,

  -- {
  -- 	dir = "~/plugins/float-exec.nvim",
  -- 	config = function()
  -- 		require("float-exec").setup()
  -- 	end,
  -- },

  {
    dir = "~/plugins/pomodoro.nvim",
    config = function()
      require("pomodoro").setup({
        work_time = 25, -- Work duration in minutes (default: 25)
        short_break = 5, -- Short break duration in minutes (default: 5)
        long_break = 15, -- Long break duration in minutes (default: 15)
        sessions_until_long_break = 4, -- Sessions before long break (default: 4)
        auto_start_breaks = false, -- Auto-start breaks (default: false)
        auto_start_work = false, -- Auto-start work after break (default: false)
        notify = true, -- Show notifications (default: true)
      })
    end,
  },
}
