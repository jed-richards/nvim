-- Leader
vim.g.mapleader = " "

-- Aliases
local map = vim.keymap.set

-- File Explorer (NetRW)
map("n", "<leader>pv", vim.cmd.Ex)

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

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
