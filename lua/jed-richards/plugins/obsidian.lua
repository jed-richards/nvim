return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,

	-- enabled = false,

	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"

		--"BufReadPre "
		--	.. vim.fn.expand("~")
		--	.. "/vault/My-Second-Brain/**.md",

		--"BufNewFile " .. vim.fn.expand("~") .. "/vault/My-Second-Brain/**.md",
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/vault/**.md",

		"BufNewFile " .. vim.fn.expand("~") .. "/vault/**.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "test",
				path = "~/vault/My-Second-Brain",
			},
			{
				name = "life",
				path = "~/vault/life",
			},
			{
				name = "work",
				path = "~/vault/work",
			},
			{
				name = "personal",
				path = "~/vault/personal",
			},
		},

		-- see below for full list of options 👇
		ui = {
			enable = true,
			-- char must be a single character...
			checkboxes = {
				-- [" "] = { char = "[ ]", hl_group = "ObsidianTodo" },
				-- ["x"] = { char = "[x]", hl_group = "ObsidianDone" },
				-- [">"] = { char = "[>]", hl_group = "ObsidianRightArrow" },
				-- ["~"] = { char = "[~]", hl_group = "ObsidianTilde" },
				-- ["!"] = { char = "[!]", hl_group = "ObsidianImportant" },
				[" "] = { order = 1, hl_group = "ObsidianTodo" },
				["x"] = { order = 2, hl_group = "ObsidianDone" },
				["!"] = { order = 3, hl_group = "ObsidianImportant" },
				["~"] = { order = 4, hl_group = "ObsidianTilde" },
				[">"] = { order = 5, hl_group = "ObsidianRightArrow" },
			},
			bullets = { char = "-", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianImportant = { bold = true, fg = "#d73128" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},
	},
}
