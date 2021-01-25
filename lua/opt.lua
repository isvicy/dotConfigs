-- Neovim Options
local cmd = vim.cmd
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local set = vim.api.nvim_set_option

-- Helper Functions
local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

-- Settings
local indent = 4

opt('b', 'expandtab', true)
opt('b', 'shiftwidth', indent)
opt('b', 'smartindent', true)
opt('b', 'tabstop', indent)
opt('o', 'termguicolors', true)
opt('w', 'relativenumber', true)
opt('w', 'number', true)
opt('o', 'hidden', true)
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'wildmode', 'longest:full,full')
opt('w', 'wrap', false)
opt('o', 'completeopt', 'menuone,noinsert,noselect')

-- Cmd
cmd 'set nocompatible'
cmd 'set noswapfile'
cmd 'set nobackup'
cmd 'set nowritebackup'
cmd 'colorscheme spaceodyssey'
cmd 'set noshowmode'
cmd 'set list listchars=tab:\\|\\ ,trail:▫ '

-- Set
set('mouse', '')
set('cmdheight', 2)
set('foldmethod', 'expr')
set('foldlevel', 5)
set('foldlevelstart', 5)
set('foldnestmax', 5)
set('updatetime', 100)
