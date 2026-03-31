-- Bootstrap plugins using vim.pack (builtin plugin manager, requires Neovim 0.12+)
local gh = function(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  -- Colorscheme
  { src = gh("scottmckendry/cyberdream.nvim") },
  { src = gh("f-person/auto-dark-mode.nvim") },

  -- UI / notifications / git
  { src = gh("folke/snacks.nvim") },
  { src = gh("folke/which-key.nvim") },
  { src = gh("folke/todo-comments.nvim") },
  { src = gh("lewis6991/gitsigns.nvim") },

  -- Mini ecosystem (mini.ai, mini.surround, mini.statusline, mini.icons, mini.snippets)
  { src = gh("echasnovski/mini.nvim") },

  -- Completion
  -- NOTE: telescope-fzf-native requires a manual `make` in its plugin directory
  --       after install: vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1.0") },
  { src = gh("rafamadriz/friendly-snippets") },

  -- Treesitter (parsers are installed via require("nvim-treesitter").install() at startup)
  { src = gh("nvim-treesitter/nvim-treesitter") },

  -- Telescope
  { src = gh("nvim-lua/plenary.nvim") },
  { src = gh("nvim-telescope/telescope.nvim") },
  { src = gh("nvim-telescope/telescope-fzf-native.nvim") },
  { src = gh("nvim-telescope/telescope-ui-select.nvim") },

  -- File navigation
  { src = gh("stevearc/oil.nvim") },
  { src = gh("theprimeagen/harpoon"), version = "harpoon2" },

  -- LSP / Mason
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("mason-org/mason.nvim") },
  { src = gh("mason-org/mason-lspconfig.nvim") },
  { src = gh("WhoIsSethDaniel/mason-tool-installer.nvim") },
  { src = gh("b0o/schemastore.nvim") },

  -- Formatting and linting
  { src = gh("stevearc/conform.nvim") },
  { src = gh("mfussenegger/nvim-lint") },

  -- Database
  { src = gh("tpope/vim-dadbod") },
  { src = gh("kristijanhusak/vim-dadbod-ui") },
  { src = gh("kristijanhusak/vim-dadbod-completion") },

  -- Documentation / misc
  { src = gh("danymat/neogen") },
})

-- Setup plugins in dependency order
require("plugins.snacks")       -- early: replaces vim.notify
require("plugins.mini")         -- mini.snippets needed before blink
require("plugins.colorscheme")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.oil")
require("plugins.harpoon")
require("plugins.todo-comments")
require("plugins.which-key")
require("plugins.blink")        -- depends on mini.snippets
require("plugins.lsp")          -- mason / mason-lspconfig setup
require("plugins.treesitter")
require("plugins.conform")
require("plugins.lint")
require("plugins.dadbod")
require("plugins.neogen")
