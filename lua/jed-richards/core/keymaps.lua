-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Aliases
local map = vim.keymap.set

-- File Explorer (NetRW)
map("n", "<leader>pv", vim.cmd.Ex)

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Splits resizing (from Teej)
-- <M-,> is Alt+,
map("n", "<M-,>", "<C-w>5<")
map("n", "<M-.>", "<C-w>5>")
map("n", "<M-t>", "<C-w>+")
map("n", "<M-s>", "<C-w>-")

-- Text manipulation
map("v", ">", ">gv") -- indents
map("v", "<", "<gv") -- indents
map("v", "J", ":m '>+1<CR>gv=gv") -- move text down
map("v", "K", ":m '<-2<CR>gv=gv") -- move text up

-- Text Navigation
map("n", "<C-d>", "<C-d>zz") -- scroll down and center
map("n", "<C-u>", "<C-u>zz") -- scroll up and center

-- Next and Prev will now center the screen to where the word is
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clear highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Tmux Sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
