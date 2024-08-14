-- For more settings see:
-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc

return {
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
			cargo = {
				features = "all",
			},
		},
	},
}
