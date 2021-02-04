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
utils.map('n', 'H', '^')
utils.map('n', 'L', '$')
utils.map('v', 'J', '<C-d>')
utils.map('v', 'K', '<C-u>')
utils.map('v', 'H', '^')
utils.map('v', 'L', '$')
utils.map('n', '<esc>', '<cmd>noh<CR>')
utils.map('t', '<esc>', '<C-\\><C-n>')
utils.map('n', 'ev', '<cmd>vsplit ~/.config/nvim/init.lua<CR>')
