-- Package manager
local cmd = vim.cmd

-- Package Manager
cmd([[packadd packer.nvim]]) -- load the package manager

local packer = require("packer")

packer.init({git = {clone_timeout = 360}})

-- PLugins
return packer.startup(function(use)
    -- Packer can manage itself as an optional plugin
    use({"wbthomason/packer.nvim", opt = true})

    -- nvim specified stuff
    use("neovim/nvim-lspconfig") -- https://github.com/neovim/nvim-lspconfig
    use("nvim-lua/lsp-status.nvim") -- https://github.com/nvim-lua/lsp-status.nvim
    use("ray-x/lsp_signature.nvim") -- https://github.com/ray-x/lsp_signature.nvim
    use("williamboman/nvim-lsp-installer") -- https://github.com/williamboman/nvim-lsp-installer
    use("folke/lua-dev.nvim") -- https://github.com/folke/lua-dev.nvim
    use({
        'ray-x/navigator.lua',
        requires = {
            'ray-x/guihua.lua',
            run = 'cd lua/fzy && make'
        }
    })
    -- Telescope family
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim", -- https://github.com/nvim-lua/popup.nvim
            "nvim-lua/plenary.nvim" -- https://github.com/nvim-lua/plenary.nvim
        }
    }) -- https://github.com/nvim-telescope/telescope.nvim
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"}) -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    use({"nvim-telescope/telescope-media-files.nvim"}) -- https://github.com/nvim-telescope/telescope-media-files.nvim
    use({
        "nvim-treesitter/nvim-treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter
        run = ":TSUpdate"
    })
    use("romgrk/nvim-treesitter-context") -- https://github.com/romgrk/nvim-treesitter-context
    use('nvim-treesitter/nvim-treesitter-textobjects') -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

    -- auto completion
    use({
        "hrsh7th/nvim-cmp", -- https://github.com/hrsh7th/nvim-cmp
        requires = {
            "hrsh7th/cmp-buffer", -- https://github.com/hrsh7th/cmp-buffer
            "hrsh7th/cmp-nvim-lsp", -- https://github.com/hrsh7th/cmp-nvim-lsp
            "hrsh7th/cmp-nvim-lua", -- https://github.com/hrsh7th/cmp-nvim-lua
            "hrsh7th/cmp-calc", -- https://github.com/hrsh7th/cmp-calc
            "hrsh7th/cmp-path", -- https://github.com/hrsh7th/cmp-path
            "octaltree/cmp-look", -- https://github.com/octaltree/cmp-look
            "saadparwaiz1/cmp_luasnip", -- https://github.com/saadparwaiz1/cmp_luasnip
            -- ui enhance
            "onsails/lspkind-nvim" -- https://github.com/onsails/lspkind-nvim
        }
    })
    use("L3MON4D3/LuaSnip") -- https://github.com/L3MON4D3/LuaSnip
    use("rafamadriz/friendly-snippets") -- https://github.com/rafamadriz/friendly-snippets

    -- Enhance
    use("szw/vim-maximizer") -- https://github.com/szw/vim-maximizer
    use({
        "kyazdani42/nvim-tree.lua", -- https://github.com/kyazdani42/nvim-tree.lua
        requires = {"kyazdani42/nvim-web-devicons", opt = true} -- https://github.com/kyazdani42/nvim-web-devicons
    })
    use("akinsho/nvim-bufferline.lua") -- https://github.com/akinsho/nvim-bufferline.lua
    use("ellisonleao/glow.nvim") -- https://github.com/ellisonleao/glow.nvim
    use("lukas-reineke/indent-blankline.nvim")
    -- Auto pair
    use({
        "windwp/nvim-autopairs", -- https://github.com/windwp/nvim-autopairs
        config = function() require("nvim-autopairs").setup({disable_filetype = {"TelescopePrompt", "vim"}}) end
    })
    -- Term
    use("akinsho/nvim-toggleterm.lua") -- https://github.com/akinsho/nvim-toggleterm.lua
    -- Surround
    use("machakann/vim-sandwich") -- https://github.com/machakann/vim-sandwich
    -- Corlors
    use({
        "norcalli/nvim-colorizer.lua", -- https://github.com/norcalli/nvim-colorizer.lua
        config = function() require("colorizer").setup({}) end
    })
    -- Notes
    use("vimwiki/vimwiki") -- https://github.com/vimwiki/vimwiki
    use("michal-h21/vimwiki-sync") -- https://github.com/michal-h21/vimwiki-sync
    -- CocSearch alternative
    use("dyng/ctrlsf.vim") -- https://github.com/dyng/ctrlsf.vim

    -- Programming related
    use("b3nj5m1n/kommentary") -- https://github.com/b3nj5m1n/kommentary
    use("JoosepAlviste/nvim-ts-context-commentstring") -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    use("liuchengxu/vista.vim") -- https://github.com/liuchengxu/vista.vim
    use({
        "folke/todo-comments.nvim", -- https://github.com/folke/todo-comments.nvim
        requires = "nvim-lua/plenary.nvim", -- https://github.com/nvim-lua/plenary.nvim
        config = function() require("todo-comments").setup({}) end
    })
    use("github/copilot.vim") -- https://github.com/github/copilot.vim
    -- Git
    use("tpope/vim-fugitive") -- https://github.com/tpope/vim-fugitive
    use("lewis6991/gitsigns.nvim") -- https://github.com/lewis6991/gitsigns.nvim
    use("sindrets/diffview.nvim") -- https://github.com/sindrets/diffview.nvim

    -- Theme && status line
    use("Dualspc/spaceodyssey.nvim") -- https://github.com/Dualspc/spaceodyssey.nvim
    use("kdav5758/TrueZen.nvim") -- https://github.com/kdav5758/TrueZen.nvim
    use({
        'rose-pine/neovim',
        as = 'rose-pine'
        --[[ config = function()
            -- Options (see available options below)
            vim.g.rose_pine_variant = 'dawn'

            -- Load colorscheme after options
            vim.cmd('colorscheme rose-pine')
        end ]]
    })
    use({
        "mcchrish/zenbones.nvim", -- https://github.com/mcchrish/zenbones.nvim
        requires = "rktjmp/lush.nvim" -- https://github.com/rktjmp/lush.nvim
    })
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use("ojroques/vim-oscyank")

end)
