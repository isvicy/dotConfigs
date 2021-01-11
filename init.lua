-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗   ██╗     ██╗   ██╗ █████╗
-- ████╗  ██║██║   ██║██║████╗ ████║   ██║     ██║   ██║██╔══██╗
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║   ██║     ██║   ██║███████║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║   ██║     ██║   ██║██╔══██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██╗███████╗╚██████╔╝██║  ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝


-- Plugin Manager
require('plugins')

-- General
require('opt')
require('map')

-- Plugins Settings
-- require('plugins.deoplete')
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.colorizer')
require('plugins.indentline')
require('plugins.telescope')
require('plugins.vista')
require('plugins.galaxyline')
require('plugins.gitsigns')
require('plugins.ultisnips')
require('plugins.nvim-tree')
require('plugins.fzf_lsp')

require('fzf_lsp').setup()

-- Personal/Testing
require('personal.nvim_func')

