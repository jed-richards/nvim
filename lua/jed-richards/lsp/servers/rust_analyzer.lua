return {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
			-- inlayHints = {
			-- 	lifetimeElisionHints = {
			-- 		enable = true,
			-- 		useParameterNames = true,
			-- 	},
			-- },
		},
	},
}
