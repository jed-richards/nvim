-- [[
--
-- Autoformat
--
-- ]]
return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },

			-- Conform can also run multiple formatters sequentially
			-- python = function(bufnr)
			-- 	if require("conform").get_formatter_info("ruff_format", bufnr).available then
			-- 		return { "ruff_format" }
			-- 	else
			-- 		return { "isort", "black" }
			-- 	end
			-- end,
			python = {
				-- To fix auto-fixable lint errors.
				-- "ruff_fix",
				-- To run the Ruff formatter.
				"ruff_format",
				-- To organize the imports.
				"ruff_organize_imports",
			},
			--

			yaml = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			markdown = { "prettier" },
			typescript = { "prettier" },

			swift = { "swift_format" }, -- /usr/bin/swift-format

			nix = { "alejandra" },
		},
	},
}
