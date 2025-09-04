return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				-- backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				-- width = 0.6, -- width of the Zen window
				width = 85, -- width of the Zen window
				height = 1, -- height of the Zen window
				options = {
					-- signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					foldcolumn = "0", -- disable fold column
					list = false, -- disable whitespace characters
				},
			},
			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					-- you may turn on/off statusline in zen mode by setting 'laststatus'
					-- statusline will be shown only if 'laststatus' == 3
					laststatus = 0, -- turn off the statusline in zen mode
				},
				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = true }, -- disables the tmux statusline
				todo = { enabled = false }, -- if set to "true", todo-comments.nvim highlights will be disabled
			},
			-- callback where you can add custom code when the Zen window opens
			on_open = function(win)
				-- Turn off colorcolumn
				vim.opt.colorcolumn = ""

				-- Set bg to not be transparent
				-- TODO: this should happen based on colorscheme
				vim.api.nvim_set_hl(0, "Normal", { bg = "#24273A" })
				vim.api.nvim_set_hl(0, "ZenBg", { bg = "#191724" })
			end,
			-- callback where you can add custom code when the Zen window closes
			on_close = function()
				-- Turn colorcolumn back on
				vim.opt.colorcolumn = "80" -- column at 80 to keep files "clean"

				-- Set bg back to transparent
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			end,
		})

		vim.keymap.set("n", "<leader>z", "<CMD>ZenMode<CR>", { desc = "Toggle [Z]en Mode" })
	end,
}
