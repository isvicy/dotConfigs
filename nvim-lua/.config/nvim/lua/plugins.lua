-- Package manager
local cmd = vim.cmd

-- Package Manager
cmd([[packadd packer.nvim]]) -- load the package manager

-- PLugins
return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use({"wbthomason/packer.nvim", opt = true})

    -- nvim specified stuff
    use("neovim/nvim-lspconfig") -- https://github.com/neovim/nvim-lspconfig
    -- use("glepnir/lspsaga.nvim") -- https://github.com/glepnir/lspsaga.nvim
    use({"jasonrhansen/lspsaga.nvim", branch = "finder-preview-fixes"})
    use("nvim-lua/lsp-status.nvim") -- https://github.com/nvim-lua/lsp-status.nvim
    use("ray-x/lsp_signature.nvim") -- https://github.com/ray-x/lsp_signature.nvim
    use("kabouzeid/nvim-lspinstall") -- https://github.com/kabouzeid/nvim-lspinstall
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
        branch = "0.5-compat",
        run = ":TSUpdate"
    })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects", -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        branch = "0.5-compat"
    })
    use("romgrk/nvim-treesitter-context") -- https://github.com/romgrk/nvim-treesitter-context
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- https://github.com/nvim-lua/plenary.nvim
            "neovim/nvim-lspconfig" -- https://github.com/neovim/nvim-lspconfig
        }
    })

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
    use({
        "folke/trouble.nvim", -- https://github.com/folke/trouble.nvim
        requires = "kyazdani42/nvim-web-devicons", -- https://github.com/kyazdani42/nvim-web-devicons
        config = function() require("trouble").setup({}) end
    })

    -- Enhance
    use("szw/vim-maximizer") -- https://github.com/szw/vim-maximizer
    use({
        "kyazdani42/nvim-tree.lua", -- https://github.com/kyazdani42/nvim-tree.lua
        requires = {"kyazdani42/nvim-web-devicons", opt = true} -- https://github.com/kyazdani42/nvim-web-devicons
    })
    use("akinsho/nvim-bufferline.lua") -- https://github.com/akinsho/nvim-bufferline.lua
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
    -- Git
    use("tpope/vim-fugitive") -- https://github.com/tpope/vim-fugitive
    use("lewis6991/gitsigns.nvim") -- https://github.com/lewis6991/gitsigns.nvim
    use("sindrets/diffview.nvim") -- https://github.com/sindrets/diffview.nvim

    -- Theme && status line
    use("Dualspc/spaceodyssey.nvim") -- https://github.com/Dualspc/spaceodyssey.nvim
    use("kdav5758/TrueZen.nvim") -- https://github.com/kdav5758/TrueZen.nvim
    use({
        "mcchrish/zenbones.nvim", -- https://github.com/mcchrish/zenbones.nvim
        requires = "rktjmp/lush.nvim" -- https://github.com/rktjmp/lush.nvim
    })
    use {'shadmansaleh/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

end)
