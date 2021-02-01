-- Configs for Plugins
--
local g = vim.g
local o = vim.o

-- Colorizer
require'colorizer'.setup()

-- Vista
g['vista_default_executive'] = 'nvim-lsp'

-- Fzf_lsp
require('fzf_lsp').setup()
g['fzf_lsp_layout'] = {window = {width = 0.9, height = 0.6, highlight = 'Todo'}}
g['fzf_preview_window'] = {'up:62%', 'ctrl-/'}

-- Nvim-compe
o.completeopt = "menu,menuone,noselect"
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    allow_prefix_unmatch = false,

    source = {
        path = true,
        buffer = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true
    }
}
