-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗   ██╗     ██╗   ██╗ █████╗
-- ████╗  ██║██║   ██║██║████╗ ████║   ██║     ██║   ██║██╔══██╗
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║   ██║     ██║   ██║███████║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║   ██║     ██║   ██║██╔══██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██╗███████╗╚██████╔╝██║  ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
-- Plugin Manager
require("ky.plugins")

-- General
require("ky.disable_builtin")
require("ky.opt")
require("ky.map")

-- Plugins Settings
require("ky.plugins.map")
require("ky.plugins.lspinstaller")
require("ky.plugins.navigator")
require("ky.plugins.telescope")
require("ky.plugins.gitsigns")
require("ky.plugins.treesitter")
require("ky.plugins.cmp")
require("ky.plugins.configs")
require("ky.plugins.lualine")
