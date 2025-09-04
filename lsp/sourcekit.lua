-- SourceKit-LSP language server configuration
return {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift" },
	root_markers = { "Package.swift", ".git" },
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
}

