-- [[
--
-- Collection of various small independent plugins/modules
--
-- ]]

return {
	"echasnovski/mini.nvim",
	config = function()
		-- [[
		--
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		--
		--  ]]
		require("mini.ai").setup({ n_lines = 500 })

		-- [[
		--
		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		-- ]]
		require("mini.surround").setup()

		-- [[
		--
		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		--
		-- ]]
		local statusline = require("mini.statusline")
		statusline.setup()

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we disable the section for
		-- cursor information because line numbers are already enabled
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return ""
		end

		require("mini.icons").setup()

		-- require("mini.snippets").setup()
		local gen_loader = require("mini.snippets").gen_loader
		require("mini.snippets").setup({
			snippets = {
				-- -- Load custom file with global snippets first (adjust for Windows)
				-- gen_loader.from_file('~/.config/nvim/snippets/global.json'),

				-- Load snippets based on current language by reading files from
				-- "snippets/" subdirectories from 'runtimepath' directories.
				gen_loader.from_lang(),
			},
		})

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
