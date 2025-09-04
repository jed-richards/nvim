vim.lsp.set_log_level("WARN")

local servers = {
	"lua_ls",
	"rust_analyzer",
	"ts_ls",
	"pyright",
	"ruff",
	"eslint",
	"jsonls",
	"yamlls",
	"nil_ls",
	"sourcekit",
	"tinymist",
	"astro",
}

local M = {}

-- Simple setup function
function M.setup()
	-- Basic diagnostic configuration
	vim.diagnostic.config({
		virtual_lines = {
			current_line = true,
		},
	})

	-- Add blink.cmp capabilities to all servers
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok, blink = pcall(require, "blink.cmp")
	if ok then
		capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities())
	end

	-- Set capabilities for all servers that don't specify their own
	vim.lsp.config("*", { capabilities = capabilities })

	-- Setup additional keymaps that aren't in defaults
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local builtin = require("telescope.builtin")

			-- Set some keymaps. Using some defaults just with telescope.
			-- - gd  (go to definition)
			-- - grr (references)
			-- - grt (type definition)
			-- - gri (go to implementation)
			-- - gO  (symbols)
			--
			-- Default
			-- - grn (rename)
			-- - gra (code action)

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { buffer = bufnr, desc = "LSP: Go to definition" })

			vim.keymap.set("n", "grr", function()
				builtin.lsp_references()
			end, { buffer = bufnr, desc = "LSP: Get references" })

			vim.keymap.set("n", "grt", function()
				builtin.lsp_type_definitions()
			end, { buffer = bufnr, desc = "LSP: Go to type definition" })

			if client and client:supports_method("textDocument/implementation") then
				vim.keymap.set("n", "gri", function()
					builtin.lsp_implementations()
				end, { buffer = bufnr, desc = "LSP: Go to implementation" })
			end

			vim.keymap.set("n", "gO", function()
				builtin.lsp_document_symbols()
			end, { buffer = bufnr, desc = "LSP: Get document symbols" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover Documentation" })

			-- Document highlighting
			if client and client:supports_method("textDocument/documentHighlight") then
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = bufnr,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = bufnr,
					callback = vim.lsp.buf.clear_references,
				})
			end
		end,
	})

	-- Enable all servers (configs loaded automatically from lsp/ directory)
	vim.lsp.enable(servers)
end

return M
