-- Package manager
local cmd = vim.cmd
local fn = vim.fn

-- Package Manager
cmd [[packadd packer.nvim]] -- load the package manager

-- PLugins
return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    -- nvim specified stuff
    use 'neovim/nvim-lspconfig' -- https://github.com/neovim/nvim-lspconfig
    use 'nvim-lua/completion-nvim' -- https://github.com/nvim-lua/completion-nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim', -- https://github.com/nvim-lua/popup.nvim
            'nvim-lua/plenary.nvim'
        } -- https://github.com/nvim-lua/plenary.nvim
    } -- https://github.com/nvim-telescope/telescope.nvim
    use 'nvim-telescope/telescope-fzf-writer.nvim' -- https://github.com/nvim-telescope/telescope-fzf-writer.nvim
    use 'nvim-treesitter/nvim-treesitter' -- https://github.com/nvim-treesitter/nvim-treesitter

    -- Enhance
    use 'szw/vim-maximizer' -- https://github.com/szw/vim-maximizer
    use 'windwp/nvim-autopairs' -- https://github.com/windwp/nvim-autopairs
    use 'voldikss/vim-floaterm' -- https://github.com/voldikss/vim-floaterm
    use 'machakann/vim-sandwich' -- https://github.com/machakann/vim-sandwich
    use 'norcalli/nvim-colorizer.lua' -- https://github.com/norcalli/nvim-colorizer.lua
    use {
        'junegunn/fzf.vim', -- https://github.com/junegunn/fzf.vim
        requires = {'junegunn/fzf', run = function() fn['fzf#install']() end}
    }
    use {
        'ms-jpq/chadtree', -- https://github.com/ms-jpq/chadtree
        branch = 'chad',
        run = 'python3 -m chadtree deps'
    }

    -- Programming related
    use 'gfanto/fzf-lsp.nvim' -- https://github.com/gfanto/fzf-lsp.nvim
    use 'tpope/vim-commentary' -- https://github.com/tpope/vim-commentary
    use 'liuchengxu/vista.vim' -- https://github.com/liuchengxu/vista.vim
    use 'ludovicchabant/vim-gutentags' -- https://github.com/ludovicchabant/vim-gutentags
    -- Git
    use 'tpope/vim-fugitive' -- https://github.com/tpope/vim-fugitive
    use 'lewis6991/gitsigns.nvim' -- https://github.com/lewis6991/gitsigns.nvim

    -- theme && status line
    use 'Dualspc/spaceodyssey' -- https://github.com/Dualspc/spaceodyssey
    use {
        'glepnir/galaxyline.nvim', -- https://github.com/glepnir/galaxyline.nvim
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons', opt = true} -- https://github.com/kyazdani42/nvim-web-devicons
    }
end)
