-- Package manager

local cmd = vim.cmd
local fn = vim.fn

-- Package Manager
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself



-- PLugins
paq {'tpope/vim-commentary'}        -- https://github.com/tpope/vim-commentary
paq {'machakann/vim-sandwich'}      -- https://github.com/machakann/vim-sandwich
paq {'shougo/deoplete-lsp'}         -- https://github.com/Shougo/deoplete-lsp
paq {'shougo/deoplete.nvim', hook = fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'} -- https://github.com/nvim-treesitter/nvim-treesitter
paq {'tjdevries/nlua.nvim'}       -- https://github.com/neovim/nvim-lspconfig
paq {'neovim/nvim-lspconfig'}       -- https://github.com/neovim/nvim-lspconfig
paq {'Dualspc/spaceodyssey'}        -- https://github.com/Dualspc/spaceodyssey
paq {'glepnir/galaxyline.nvim'}     -- https://github.com/glepnir/galaxyline.nvim
paq {'kyazdani42/nvim-web-devicons'}-- https://github.com/kyazdani42/nvim-web-devicons
paq {'rhysd/vim-clang-format'}      -- https://github.com/rhysd/vim-clang-format
paq {'Yggdroot/indentLine'}         -- https://github.com/Yggdroot/indentLine
paq {'psf/black'}                   -- https://github.com/psf/black
paq {'ludovicchabant/vim-gutentags'}-- https://github.com/ludovicchabant/vim-gutentags
paq {'liuchengxu/vista.vim'}        -- https://github.com/liuchengxu/vista.vim
paq {'kyazdani42/nvim-tree.lua'}    -- https://github.com/kyazdani42/nvim-tree.lua
paq {'norcalli/nvim-colorizer.lua'} -- https://github.com/norcalli/nvim-colorizer.lua
paq {'jiangmiao/auto-pairs'}        -- https://github.com/jiangmiao/auto-pairs
paq {'nvim-lua/popup.nvim'}         -- https://github.com/nvim-lua/popup.nvim
paq {'nvim-lua/plenary.nvim'}       -- https://github.com/nvim-lua/plenary.nvim
paq {'nvim-telescope/telescope.nvim'} -- https://github.com/nvim-telescope/telescope.nvim
paq {'mbbill/undotree'}             -- https://github.com/mbbill/undotree
paq {'rafcamlet/nvim-luapad'}       -- https://github.com/rafcamlet/nvim-luapad
paq {'lewis6991/gitsigns.nvim'}     -- https://github.com/lewis6991/gitsigns.nvim
paq {'SirVer/ultisnips'}
paq {'honza/vim-snippets'}


