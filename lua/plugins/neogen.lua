return {
	"danymat/neogen",
	config = function()
		local neogen = require("neogen")

		neogen.setup({
			enabled = true,
			snippet_engine = "mini",
		})

		vim.keymap.set("n", "<leader>ngf", function()
			neogen.generate({ type = "func" })
		end, { desc = "[N]eogen [G]enerate [f]unction" })

		vim.keymap.set("n", "<leader>ngc", function()
			neogen.generate({ type = "class" })
		end, { desc = "[N]eogen [G]enerate [C]lass" })

		vim.keymap.set("n", "<leader>ngt", function()
			neogen.generate({ type = "type" })
		end, { desc = "[N]eogen [G]enerate [T]ype" })

		vim.keymap.set("n", "<leader>ngF", function()
			neogen.generate({ type = "file" })
		end, { desc = "[N]eogen [G]enerate [F]ile" })
	end,
}
