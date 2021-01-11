-- nvim-treesitter

local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = {'bash', 'rust', 'lua', 'c', 'cpp', 'css', 'go', 'html', 'javascript', 'json', 'python', 'ruby', 'typescript'},
    highlight = {enable = true}
}


