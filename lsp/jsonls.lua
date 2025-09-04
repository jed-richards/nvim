-- JSON language server configuration
return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { "package.json", ".git" },
	init_options = {
		-- disable formatting for JSON; we'll use prettier
		providerFormatter = false,
	},
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
}

