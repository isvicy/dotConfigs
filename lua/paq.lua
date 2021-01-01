--Package manager

local cmd = vim.cmd
local fn = vim.fn

--Package Manager
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself


--PLugins
paq {'tpope/vim-commentary'}
paq {'machakann/vim-sandwich'}
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', hook = fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'Dualspc/spaceodyssey'}
paq {'glepnir/galaxyline.nvim'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'rhysd/vim-clang-format'}
paq {'Yggdroot/indentLine'}
paq {'psf/black'}
paq {'ludovicchabant/vim-gutentags'}
paq {'liuchengxu/vista.vim'}
paq {'kyazdani42/nvim-tree.lua'}
paq {'norcalli/nvim-colorizer.lua'}
paq {'Shougo/neosnippet.vim'}
paq {'jiangmiao/auto-pairs'}
paq {'Shougo/neosnippet-snippets'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'mbbill/undotree'}
paq {'rafcamlet/nvim-luapad'}
paq {'lewis6991/gitsigns.nvim'}


