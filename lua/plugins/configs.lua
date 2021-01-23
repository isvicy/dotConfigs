-- Configs for Plugins
--
local g = vim.g

-- Colorizer
require'colorizer'.setup()

-- Vista
g['vista_default_executive'] = 'nvim-lsp'

-- Fzf_lsp
require('fzf_lsp').setup()
g['fzf_lsp_layout'] = {window = {width = 0.9, height = 0.6, highlight = 'Todo'}}
g['fzf_preview_window'] = {'up:62%', 'ctrl-/'}

-- Autopair
require('nvim-autopairs').setup()
