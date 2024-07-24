return {
	filetypes = { "json", "jsonc" },
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
