return {
	-- See `:help gitsigns`
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},

			on_attach = function(bufnr)
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Next hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Prev hunk" })

				-- TODO: try using this instead of lazygit
				--
				-- Actions
				-- map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
				-- map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
				-- map("v", "<leader>hs", function()
				-- 	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				-- end, { desc = "Stage hunk (range)" })
				-- map("v", "<leader>hr", function()
				-- 	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				-- end, { desc = "Reset hunk (range)" })

				-- Blame
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame line" })

				-- Diff
				map("n", "<leader>hd", gitsigns.diffthis, { desc = "Open diff against HEAD" })
			end,
		})
	end,
}
