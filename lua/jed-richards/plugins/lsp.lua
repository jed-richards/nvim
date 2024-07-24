return {
	-- native LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("jed-richards.lsp").config()
		end,
	},

	-- LSP settings manager; must be setup **before** any language servers are
	-- configured
	{
		"folke/neoconf.nvim",
		config = true,
		priority = 100,
	},

	-- language server installer; must be setup before null-ls to ensure
	-- mason-managed tools are available in the path
	{
		"williamboman/mason.nvim",
		priority = 100,
		build = ":MasonUpdate",
		opts = {
			ui = {
				border = "rounded",
			},
		},
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},

	-- language server manager
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
			require("jed-richards.lsp").config()

			-- use mason's automatic server startup functionality
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("jed-richards.lsp").setup(server_name)
				end,
			})
		end,
	},

	-- Pretty UI for useful status updates for LSP
	{
		"j-hui/fidget.nvim",
		opts = {},
	},

	{
		"folke/trouble.nvim",
		opts = {},
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = "Trouble",
		keys = {
			{
				"<leader>td",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Toggle [T]rouble [d]iagnostics",
			},
			{
				"<leader>tD",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Toggle [T]rouble [D]iagnostics (buffer)",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Toggle [T]rouble [s]ymbols",
			},
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "Toggle [T]rouble [l]sp definitions / references / ...",
			},
			{
				"<leader>tL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Toggle [T]rouble [L]ocation list",
			},
			{
				"<leader>tq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Toggle [T]rouble [q]uickfix",
			},
		},
	},

	-- Pretty UI stuff
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup({
				create_autocmd = false, -- prevent barbecue from updating itself automatically
			})

			vim.api.nvim_create_autocmd({
				"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})

			-- hide barbecue by default
			require("barbecue.ui").toggle(false)

			vim.keymap.set("n", "<leader>bt", function()
				require("barbecue.ui").toggle()
			end, { desc = "[B]arebecue [T]oggle" })
		end,
	},
}
