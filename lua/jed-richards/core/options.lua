-- Search and replace stuff
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!

-- Tab and Indent
vim.opt.tabstop = 4 -- tabs are 4 spaces
vim.opt.softtabstop = 4 -- tabs are 4 spaces
vim.opt.shiftwidth = 4 -- number of spaces to use on indent
vim.opt.expandtab = true -- turns tabs to spaces
vim.opt.smartindent = true -- This sets smartindent

-- Backup and Swap Files
vim.opt.backup = false -- creates a backup file
vim.opt.swapfile = false -- creates a swapfile
vim.opt.undofile = true -- enable persistent undo
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Looks and Scrolling
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.colorcolumn = "80" -- column at 80 to keep files "clean"
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.signcolumn = "yes" -- signcolumn to the left of numbers
vim.opt.guicursor = "" -- This makes the cursor fat (Me likey...)
vim.opt.wrap = false -- display lines as one long line
vim.opt.showmode = false -- to see things like -- INSERT --

-- allows h and l to move to next line if at last character
vim.cmd([[set whichwrap+=h,l]])

-- allows word-with-dashes to be seen as one word
vim.cmd([[set iskeyword+=-]])

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Mouse and Clipboard
vim.cmd([[ set clipboard+=unnamedplus ]])

-- allows neovim access to system clipboard through WSL
--vim.cmd [[
--    set clipboard+=unnamedplus
--    let g:clipboard = {
--        \   'name': 'WslClipboard',
--        \   'copy': {
--        \      '+': 'clip.exe',
--        \      '*': 'clip.exe',
--        \    },
--        \   'paste': {
--        \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--        \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--        \   },
--        \   'cache_enabled': 0,
--        \ }
--]]
--vim.opt.mouse = "a"          -- allow the mouse to be used in neovim

-- Random
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)

-- Decrease update time
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
