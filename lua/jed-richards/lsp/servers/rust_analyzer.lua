-- For more settings see:
-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc

return {
	-- https://github.com/pr2502/ra-multiplex/blob/main/README.md
	--
	-- cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
	-- init_options = {
	-- 	lspMux = {
	-- 		version = "1",
	-- 		method = "connect",
	-- 		server = "rust-analyzer",
	-- 	},
	-- },
	cmd = { "ra-multiplex" },
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
			inlayHints = {
				typeHints = {
					enable = true,
				},
				chainingHints = {
					enable = true,
				},
				lifetimeElisionHints = {
					enable = true,
					useParameterNames = true,
				},
			},
			-- cargo = {
			-- 	features = "all",
			-- },
			-- cachePriming = {
			-- 	enable = false,
			-- },
		},
	},
}
