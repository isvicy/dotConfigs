-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗   ██╗     ██╗   ██╗ █████╗
-- ████╗  ██║██║   ██║██║████╗ ████║   ██║     ██║   ██║██╔══██╗
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║   ██║     ██║   ██║███████║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║   ██║     ██║   ██║██╔══██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██╗███████╗╚██████╔╝██║  ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
-- Plugin Manager
require("plugins")

-- General
require("opt")
require("map")

-- Plugins Settings
require("plugins.map")
-- require("plugins.lsp")
require("plugins.treesitter")
require("plugins.telescope")
-- require('plugins.galaxyline')
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.cmp")
require("plugins.navigator")
require("plugins.configs")
require("plugins.lspinstall")

-- Personal/Testing
require("personal.nvim_func")
