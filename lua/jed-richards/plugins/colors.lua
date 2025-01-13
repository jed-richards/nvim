-- [[
--
-- Use `:Telescope colorscheme` to see installed colorschemes using
--   Telescope.
--
-- ]]

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false, -- load during startup if main colorscheme
		priority = 1000, -- load before all other startup plugins

		config = function()
			require("rose-pine").setup({
				disable_background = true,
				disable_italics = true,
			})
			--
			vim.cmd.colorscheme("rose-pine")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				no_italic = true,
			})

			-- vim.cmd.colorscheme("catppuccin")
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},

	{
		"folke/tokyonight.nvim",
		config = function()
			-- Load the colorscheme here
			--vim.cmd.colorscheme("tokyonight-night")

			-- You can configure highlights by doing something like
			--vim.cmd.hi("Comment gui=none")
		end,
	},
}
