-- Package manager
local cmd = vim.cmd

-- Package Manager
cmd([[packadd packer.nvim]]) -- load the package manager

-- PLugins
return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use({ "wbthomason/packer.nvim", opt = true })

    -- nvim specified stuff
    use("neovim/nvim-lspconfig") -- https://github.com/neovim/nvim-lspconfig
    use("nvim-lua/lsp-status.nvim") -- https://github.com/nvim-lua/lsp-status.nvim
    use("ray-x/lsp_signature.nvim") -- https://github.com/ray-x/lsp_signature.nvim
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim", -- https://github.com/nvim-lua/popup.nvim
            "nvim-lua/plenary.nvim", -- https://github.com/nvim-lua/plenary.nvim
        },
    }) -- https://github.com/nvim-telescope/telescope.nvim
    use({
        "nvim-treesitter/nvim-treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter
        branch = "0.5-compat",
        run = ":TSUpdate",
    })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects", -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        branch = "0.5-compat",
    })
    use({
        "ray-x/navigator.lua", -- https://github.com/ray-x/navigator.lua
        requires = {
            "ray-x/guihua.lua", -- https://github.com/ray-x/guihua.lua
            run = "cd lua/fzy && make",
        },
    })
    use({ "nvim-treesitter/nvim-treesitter-refactor" }) -- https://github.com/nvim-treesitter/nvim-treesitter-refactor
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- https://github.com/nvim-lua/plenary.nvim
            "neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
        },
    })

    -- auto completion
    use("hrsh7th/nvim-compe") -- https://github.com/hrsh7th/nvim-compe
    use({
        "folke/trouble.nvim", -- https://github.com/folke/trouble.nvim
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({})
        end,
    })

    -- Enhance
    use("szw/vim-maximizer") -- https://github.com/szw/vim-maximizer
    use({
        "kyazdani42/nvim-tree.lua", -- https://github.com/kyazdani42/nvim-tree.lua
        requires = { "kyazdani42/nvim-web-devicons", opt = true }, -- https://github.com/kyazdani42/nvim-web-devicons
    })
    -- Auto pair
    use("cohama/lexima.vim") -- https://github.com/cohama/lexima.vim
    -- Term
    use("voldikss/vim-floaterm") -- https://github.com/voldikss/vim-floaterm
    use("akinsho/nvim-toggleterm.lua") -- https://github.com/akinsho/nvim-toggleterm.lua
    -- Surround
    use("machakann/vim-sandwich") -- https://github.com/machakann/vim-sandwich
    use({
        "norcalli/nvim-colorizer.lua", -- https://github.com/norcalli/nvim-colorizer.lua
        config = function()
            require("colorizer").setup({})
        end,
    })
    use("vimwiki/vimwiki") -- https://github.com/vimwiki/vimwiki
    use("michal-h21/vimwiki-sync") -- https://github.com/michal-h21/vimwiki-sync
    use("akinsho/nvim-bufferline.lua") -- https://github.com/akinsho/nvim-bufferline.lua
    -- CocSearch alternative
    use("dyng/ctrlsf.vim") -- https://github.com/dyng/ctrlsf.vim
    -- Snippets
    use("SirVer/ultisnips") -- https://github.com/SirVer/ultisnips
    use("honza/vim-snippets") -- https://github.com/honza/vim-snippets
    use("mlaursen/vim-react-snippets") -- https://github.com/mlaursen/vim-react-snippets

    -- Programming related
    use("b3nj5m1n/kommentary") -- https://github.com/b3nj5m1n/kommentary
    use("liuchengxu/vista.vim") -- https://github.com/liuchengxu/vista.vim
    use({
        "folke/todo-comments.nvim", -- https://github.com/folke/todo-comments.nvim
        config = function()
            require("todo-comments").setup({})
        end,
    })
    -- Git
    use("tpope/vim-fugitive") -- https://github.com/tpope/vim-fugitive
    use("lewis6991/gitsigns.nvim") -- https://github.com/lewis6991/gitsigns.nvim
    use("sindrets/diffview.nvim") -- https://github.com/sindrets/diffview.nvim

    -- Theme && status line
    use("Dualspc/spaceodyssey.nvim") -- https://github.com/Dualspc/spaceodyssey.nvim
    use("sainnhe/gruvbox-material") -- https://github.com/sainnhe/gruvbox-material
    use("kdav5758/TrueZen.nvim") -- https://github.com/kdav5758/TrueZen.nvim
    use({
        "hoob3rt/lualine.nvim", -- https://github.com/hoob3rt/lualine.nvim
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    --[[ use {
        'glepnir/galaxyline.nvim', -- https://github.com/glepnir/galaxyline.nvim
        requires = {'kyazdani42/nvim-web-devicons', opt = true} -- https://github.com/kyazdani42/nvim-web-devicons
    } ]]
    use("skywind3000/asyncrun.vim") -- https://github.com/skywind3000/asyncrun.vim
    use("hotoo/pangu.vim") -- https://github.com/hotoo/pangu.vim
end)
