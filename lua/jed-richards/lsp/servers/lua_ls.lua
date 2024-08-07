return {
	settings = {
		Lua = {
			-- diagnostics = { disable = { 'missing-fields' } },
			-- format = {
			-- 	-- disable formatting in favor of stylua
			-- 	enable = vim.fn.executable("stylua") == 0,
			-- },
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				-- Tells lua_ls where to find all the Lua files that you have loaded
				-- for your neovim configuration.
				library = {
					"${3rd}/luv/library",
					unpack(vim.api.nvim_get_runtime_file("", true)),
				},
				-- If lua_ls is really slow on your computer, you can try this instead:
				-- library = { vim.env.VIMRUNTIME },
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
}
