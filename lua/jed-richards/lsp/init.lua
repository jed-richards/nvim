-- Disable log by default
vim.lsp.set_log_level("error")

-- Give LspInfo window a border
require("lspconfig.ui.windows").default_options.border = "rounded"

---@param bufnr integer
---@param method string
local function lsp_method_supported(bufnr, method)
	---@type lsp.Client[]
	local active_clients = vim.lsp.get_active_clients({ bufnr = bufnr })

	for _, active_client in pairs(active_clients) do
		if active_client.supports_method(method) then
			return true
		end
	end
end

---Adapted from M.code_actions() in $VIMRUNTIME/lua/vim/buf.lua
---@param bufnr integer
local function organize_imports(bufnr)
	if not lsp_method_supported(bufnr, "textDocument/codeAction") then
		return
	end

	local params = vim.lsp.util.make_range_params()
	params.context = {
		diagnostics = {},
		only = { "source.organizeImports", "source.removeUnusedImports" },
	}

	local results = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params)
	if results == nil then
		return
	end

	for client_id, result in pairs(results) do
		local client = vim.lsp.get_client_by_id(client_id)

		if client then
			for _, action in pairs(result.result or {}) do
				if action.kind:find("source.organizeImports") or action.kind:find("source.removeUnusedImports") then
					if action.edit then
						vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
					end

					if action.command then
						local command = type(action.command) == "table" and action.command or action
						local fn = client.commands[command.command] or vim.lsp.commands[command.command]

						if fn then
							fn(command, {
								client_id = client.id,
								bufnr = bufnr,
								method = "textDocument/codeAction",
								params = vim.deepcopy(params),
							})
						else
							-- Not using command directly to exclude extra properties,
							-- see https://github.com/python-lsp/python-lsp-server/issues/146
							client.request_sync("workspace/executeCommand", {
								command = command.command,
								arguments = command.arguments,
								workDoneToken = command.workDoneToken,
							}, nil, bufnr)
						end
					end
				end
			end
		end
	end
end

local M = {}

---@alias AttachFunction fun(client: lsp.Client, bufnr: integer): nil

-- configure a client when it's attached to a buffer
---@param server_on_attach AttachFunction?
M.create_on_attach = function(server_on_attach)
	---@param client lsp.Client
	---@param bufnr integer
	return function(client, bufnr)
		if server_on_attach then
			server_on_attach(client, bufnr)
		end

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, {
				buffer = bufnr,
				desc = "LSP: " .. desc,
			})
		end

		-- add a jump to definition keymap
		if client.server_capabilities.definitionProvider then
			-- map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [d]efinition")
			map("gd", function()
				vim.lsp.buf.definition()
			end, "[G]oto [d]efinition")
		end

		-- Find references for the word under your cursor.
		map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

		-- Fuzzy find all the symbols in your current workspace
		--  Similar to document symbols, except searches over your whole project.
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

		-- add a hover info keymap; this overrides the default K keymap when an LSP
		-- is attached to a buffer
		if client.server_capabilities.hoverProvider then
			map("K", vim.lsp.buf.hover, "Hover Documentation")
		end

		-- Rename the variable under your cursor
		if client.server_capabilities.renameProvider then
			map("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
		end

		-- -- add a :Format command and keymap
		-- if client.server_capabilities.documentFormattingProvider then
		-- 	vim.api.nvim_buf_create_user_command(0, "OrganizeImports", function()
		-- 		organize_imports(0)
		-- 	end, {})
		-- end

		-- -- keymap to show error diagnostic popup
		-- vim.keymap.set("n", "<leader>d", function()
		-- 	vim.diagnostic.open_float({
		-- 		border = "rounded",
		-- 	})
		-- end, opts)

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		if client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = bufnr,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = bufnr,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end
end

M.config = function()
	-- configure diagnostic signs
	vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

	-- rounded border for hover popups
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	-- rounded border for signature popups
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

	-- -- when an lsp returns multiple "goto definition" results, only keep the
	-- -- first one
	-- local origTextDocDef = vim.lsp.handlers["textDocument/definition"]
	-- vim.lsp.handlers["textDocument/definition"] = function(err, result, ctx, config)
	-- 	if result ~= nil and #result > 1 then
	-- 		result = { result[1] }
	-- 	end
	-- 	origTextDocDef(err, result, ctx, config)
	-- end
end

-- setup a server
---@param server_name string
M.setup = function(server_name)
	local status, config = pcall(require, modbase .. ".servers." .. server_name)
	if not status or type(config) ~= "table" then
		config = {}
	end

	config.on_attach = M.create_on_attach(config.on_attach)

	-- add cmp capabilities
	local cmp_caps = {}
	local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if ok then
		cmp_caps = cmp_nvim_lsp.default_capabilities()
	end

	if config.capabilities then
		config.capabilities = vim.tbl_deep_extend("keep", config.capabilities, cmp_caps)
	else
		config.capabilities = cmp_caps
	end

	require("lspconfig")[server_name].setup(config)
end

return M
