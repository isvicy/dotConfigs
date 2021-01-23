-- Mappings

local g = vim.g
local utils = require("personal.utils")


-- Leader
g['mapleader'] = ' '

-- Nvim
utils.map('n', '<leader>h', '<C-W><C-H>')
utils.map('n', '<leader>l', '<C-W><C-L>')
utils.map('n', '<leader>k', '<C-W><C-K>')
utils.map('n', '<leader>j', '<C-W><C-J>')
utils.map('n', '<S-k>', '<C-u>')
utils.map('n', 'H', '^')
utils.map('n', 'L', '$')
utils.map('v', 'J', '<C-d>')
utils.map('v', 'K', '<C-u>')
utils.map('v', 'H', '^')
utils.map('v', 'L', '$')
utils.map('n', '<esc>', '<cmd>noh<CR>')
utils.map('t', '<esc>', '<C-\\><C-n>')
utils.map('n', 'ö', '<C-]>')
utils.map('n', 'é', '<C-O>')
utils.map('n', 'ü', ']s')
utils.map('n', 'è', '[s')
utils.map('n', '<leader>1', '<cmd>b1<CR>')
utils.map('n', '<leader>2', '<cmd>b2<CR>')
utils.map('n', '<leader>3', '<cmd>b3<CR>')
utils.map('n', '<leader>4', '<cmd>b4<CR>')
utils.map('n', '<leader>5', '<cmd>b5<CR>')
utils.map('n', '<leader>6', '<cmd>b6<CR>')
utils.map('n', 'ev', '<cmd>vsplit ~/.config/nvim/init.lua<CR>')
utils.map('n', 'ss', '<cmd>w<CR>')
utils.map('n', '£', '%')
