-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗   ██╗     ██╗   ██╗ █████╗ 
-- ████╗  ██║██║   ██║██║████╗ ████║   ██║     ██║   ██║██╔══██╗
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║   ██║     ██║   ██║███████║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║   ██║     ██║   ██║██╔══██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██╗███████╗╚██████╔╝██║  ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝


-- Plugin Manager
require('paq')

-- General
require('opt')
require('map')

-- Plugins Settings
require('plugins.deoplete')
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.colorizer')
require('plugins.gitsigns')
require('plugins.indentline')
require('plugins.telescope')
require('plugins.vista')
require('plugins.galaxyline')

-- Personal/Testing
require('personal.nvim_func')
-- require('spaceodyssey')
