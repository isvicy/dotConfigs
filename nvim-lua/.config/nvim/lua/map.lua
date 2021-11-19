-- Mappings
local g = vim.g
local utils = require("personal.utils")

-- Leader
g["mapleader"] = " "

-- Nvim
utils.map("n", "<leader>h", "<C-W><C-H>")
utils.map("n", "<leader>l", "<C-W><C-L>")
utils.map("n", "<leader>k", "<C-W><C-K>")
utils.map("n", "<leader>j", "<C-W><C-J>")
utils.map("n", "H", "^")
utils.map("n", "L", "$")
utils.map("v", "J", "<C-d>")
utils.map("v", "K", "<C-u>")
utils.map("v", "H", "^")
utils.map("v", "L", "$")
utils.map("n", "<esc>", "<cmd>noh<CR>")
utils.map("t", "<esc>", "<C-\\><C-n>")
utils.map("n", "ev", "<cmd>vsplit ~/.config/nvim/init.lua<CR>")
utils.map("i", "<C-a>", "<C-o>0")
utils.map("i", "<C-e>", "<C-o>$")
utils.map("n", "Y", "y$")
-- center search
utils.map("n", "n", "nzzzv")
utils.map("n", "N", "Nzzzv")
utils.map("n", "J", "mzJ`z")
-- breaking undo
utils.map("i", ",", ",<c-g>u")
utils.map("i", ".", ".<c-g>u")
-- moving text
utils.map("n", "<leader>sj", ":m .+1<CR>==")
utils.map("n", "<leader>sk", ":m .-2<CR>==")
utils.map("v", "J", ":m '>+1<CR>gv=gv")
utils.map("v", "K", ":m '<-2<CR>gv=gv")
utils.map("i", "<c-j>", "<esc>:m .+1<CR>==i")
utils.map("i", "<c-k>", "<esc>:m .-2<CR>==i")
-- paste last ting yanked, not deleted
utils.map("n", "<leader>P", '"0P')
utils.map("n", "<leader>p", '"0p')
-- write only if something is changed
utils.map("n", "<leader>u", "<cmd>up<CR>")
-- make *  highlight current work
utils.map("n", "*", ":execute \"normal! *N\"<cr>")
