-- nvim-treesitter

local set = vim.api.nvim_set_option

local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = {'bash', 'rust', 'lua', 'c', 'cpp', 'css', 'go', 'html', 'javascript', 'json', 'python', 'ruby', 'typescript'},
    highlight = {enable = true}
}

set('foldexpr', 'nvim_treesitter#foldexpr()')
