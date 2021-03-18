-- Package manager
local cmd = vim.cmd

-- Package Manager
cmd [[packadd packer.nvim]] -- load the package manager

-- PLugins
return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- nvim specified stuff
    use 'neovim/nvim-lspconfig' -- https://github.com/neovim/nvim-lspconfig
    use 'glepnir/lspsaga.nvim' -- https://github.com/glepnir/lspsaga.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim', -- https://github.com/nvim-lua/popup.nvim
            'nvim-lua/plenary.nvim'
        } -- https://github.com/nvim-lua/plenary.nvim
    } -- https://github.com/nvim-telescope/telescope.nvim
    use 'nvim-treesitter/nvim-treesitter' -- https://github.com/nvim-treesitter/nvim-treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects' -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    -- auto completion
    use 'hrsh7th/nvim-compe' -- https://github.com/hrsh7th/nvim-compe

    -- Enhance
    use 'szw/vim-maximizer' -- https://github.com/szw/vim-maximizer
    -- Auto pair
    use 'cohama/lexima.vim' -- https://github.com/cohama/lexima.vim
    -- Term
    use 'voldikss/vim-floaterm' -- https://github.com/voldikss/vim-floaterm
    use 'akinsho/nvim-toggleterm.lua' -- https://github.com/akinsho/nvim-toggleterm.lua
    -- Surround
    use 'machakann/vim-sandwich' -- https://github.com/machakann/vim-sandwich
    use 'norcalli/nvim-colorizer.lua' -- https://github.com/norcalli/nvim-colorizer.lua
    use {
        'ms-jpq/chadtree', -- https://github.com/ms-jpq/chadtree
        branch = 'chad',
        run = 'python3 -m chadtree deps'
    }
    use {
        'iamcco/markdown-preview.nvim', -- https://github.com/iamcco/markdown-preview.nvim
        run = 'cd app && yarn install'
    }
    use 'vimwiki/vimwiki' -- https://github.com/vimwiki/vimwiki
    use 'akinsho/nvim-bufferline.lua' -- https://github.com/akinsho/nvim-bufferline.lua
    -- CocSearch alternative
    use 'dyng/ctrlsf.vim' -- https://github.com/dyng/ctrlsf.vim
    -- Snippets
    use 'SirVer/ultisnips' -- https://github.com/SirVer/ultisnips
    use 'honza/vim-snippets' -- https://github.com/honza/vim-snippets
    use 'epilande/vim-react-snippets' -- https://github.com/epilande/vim-react-snippets

    -- Programming related
    use 'b3nj5m1n/kommentary' -- https://github.com/b3nj5m1n/kommentary
    use 'liuchengxu/vista.vim' -- https://github.com/liuchengxu/vista.vim
    use 'ludovicchabant/vim-gutentags' -- https://github.com/ludovicchabant/vim-gutentags
    -- Git
    use 'tpope/vim-fugitive' -- https://github.com/tpope/vim-fugitive
    use 'lewis6991/gitsigns.nvim' -- https://github.com/lewis6991/gitsigns.nvim

    -- Theme && status line
    use 'bryceyang/spaceodyssey' -- https://github.com/bryceyang/spaceodyssey
    use 'sainnhe/gruvbox-material' -- https://github.com/sainnhe/gruvbox-material
    use {
        'glepnir/galaxyline.nvim', -- https://github.com/glepnir/galaxyline.nvim
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons', opt = true} -- https://github.com/kyazdani42/nvim-web-devicons
    }
    use 'skywind3000/asyncrun.vim' -- https://github.com/skywind3000/asyncrun.vim
    use 'hotoo/pangu.vim' -- https://github.com/hotoo/pangu.vim
end)
