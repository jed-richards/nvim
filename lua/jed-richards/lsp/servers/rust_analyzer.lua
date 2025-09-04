-- For more settings see:
-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/book/src/configuration_generated.md

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
	-- cmd = { "ra-multiplex" },
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			check = {
				-- command = "clippy",
				command = "check",
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
			-- lens = {
			-- 	enable = false,
			-- },
			-- procMacro = {
			-- 	ignored = {
			-- 		mockall_derive = {
			-- 			"automock",
			-- 		},
			-- 		mockall_double = {
			-- 			"double",
			-- 		},
			-- 	},
			-- },
			-- cargo = {
			-- 	features = "all",
			-- },
			-- cachePriming = {
			-- 	enable = false,
			-- },
		},
	},
}
