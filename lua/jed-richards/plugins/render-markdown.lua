return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },

	enabled = false,

	config = function()
		---@module 'render-markdown.nvim'
		---@type render.md.UserConfig
		local opts = {
			heading = {
				enabled = false,
			},
			bullet = {
				icons = { "-" },
				highlight = "ObsidianBullet",
			},
			checkbox = {
				bullet = true,
				unchecked = { icon = "[ ]", highlight = "ObsidianTodo" },
				checked = { icon = "[x]", highlight = "ObsidianDone" },
				custom = {
					important = {
						raw = "[!]",
						rendered = "[!]",
						highlight = "ObsidianTilde",
						-- scope_highlight = "ObsidianTilde",
						scope_highlight = nil,
					},
					cancelled = {
						raw = "[~]",
						rendered = "[~]",
						highlight = "RenderMarkdownTodo",
						scope_highlight = nil,
					},
				},
			},
		}

		require("render-markdown").setup(opts)
	end,
}
