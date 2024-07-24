-- [[
--
-- All other plugins with minimal config
--
-- ]]

return {
	-- "gc" to comment visual selected regions
	{ "numToStr/Comment.nvim", opts = {} },

	-- See `:help gitsigns` to understand what the configuration keys do
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- JSON Schemas
	"b0o/schemastore.nvim",
}
