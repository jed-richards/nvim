-- Ruff language server configuration
return {
	cmd = { "ruff", "server", "--preview" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"ruff.toml",
		".ruff.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		".git",
	},
	on_attach = function(client)
		-- disable hover in favor of Pyright
		client.server_capabilities.hoverProvider = false
	end,
}

