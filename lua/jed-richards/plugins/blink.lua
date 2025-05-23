return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "echasnovski/mini.snippets" },

	-- enabled = false,

	-- use a release tag to download pre-built binaries
	version = "1.*",

	config = function()
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		local opts = {
			keymap = { preset = "default" },

			completion = {
				-- TODO: play around and see if I like this
				keyword = { range = "full" },
				menu = {
					draw = {
						columns = {
							{ "kind_icon" },
							-- { "label", "label_description", gap = 1 },
							{ "label", gap = 1 },
							{ "kind" },
							-- { "source_name" },
						},
						padding = 0,
					},

					border = "padded",
				},

				list = {
					max_items = 30,
				},

				-- (Default) Only show the documentation popup when manually triggered
				documentation = {
					auto_show = false,
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			signature = { enabled = true },

			snippets = {
				preset = "mini_snippets",
			},

			appearance = {
				nerd_font_variant = "mono",
			},
		}

		require("blink.cmp").setup(opts)
	end,
}
