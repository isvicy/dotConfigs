-- Package manager
local cmd = vim.cmd

-- Package Manager
cmd([[packadd packer.nvim]])

local packer = require("packer")

packer.init({ git = { clone_timeout = 360 } })

-- PLugins
return packer.startup(function(use)
  -- Packer can manage itself as an optional plugin
  use({ "wbthomason/packer.nvim", opt = true })

  -- nvim specified stuff
  use("neovim/nvim-lspconfig")
  use("nvim-lua/lsp-status.nvim")
  use("ray-x/lsp_signature.nvim")
  use("folke/lua-dev.nvim")
  use({
    "ray-x/navigator.lua", -- https://github.com/ray-x/navigator.lua
    requires = {
      "ray-x/guihua.lua", -- https://github.com/ray-x/guihua.lua
      run = "cd lua/fzy && make",
    },
  })
  use({
    "folke/trouble.nvim", -- https://github.com/folke/trouble.nvim
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  })
  use({
    "jose-elias-alvarez/null-ls.nvim", -- https://github.com/jose-elias-alvarez/null-ls.nvim
    requires = { "nvim-lua/plenary.nvim" }, -- https://github.com/nvim-lua/plenary.nvim
  })
  -- Telescope family
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim", -- https://github.com/nvim-lua/popup.nvim
      "nvim-lua/plenary.nvim", -- https://github.com/nvim-lua/plenary.nvim
    },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope-media-files.nvim" })
  use({
    "nvim-treesitter/nvim-treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter
    run = ":TSUpdate",
  })
  use("romgrk/nvim-treesitter-context")
  use("nvim-treesitter/nvim-treesitter-textobjects")

  -- auto completion
  use({
    "hrsh7th/nvim-cmp", -- https://github.com/hrsh7th/nvim-cmp
    requires = {
      "hrsh7th/cmp-buffer", -- https://github.com/hrsh7th/cmp-buffer
      "hrsh7th/cmp-path", -- https://github.com/hrsh7th/cmp-path
      "hrsh7th/cmp-nvim-lsp", -- https://github.com/hrsh7th/cmp-nvim-lsp
      "hrsh7th/cmp-nvim-lua", -- https://github.com/hrsh7th/cmp-nvim-lua

      "octaltree/cmp-look", -- https://github.com/octaltree/cmp-look
      "saadparwaiz1/cmp_luasnip", -- https://github.com/saadparwaiz1/cmp_luasnip
      -- ui enhance
      "onsails/lspkind-nvim", -- https://github.com/onsails/lspkind-nvim
    },
  })
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- Enhance
  use("szw/vim-maximizer")
  use({
    "kyazdani42/nvim-tree.lua", -- https://github.com/kyazdani42/nvim-tree.lua
    requires = { "kyazdani42/nvim-web-devicons", opt = true }, -- https://github.com/kyazdani42/nvim-web-devicons
  })
  use("akinsho/nvim-bufferline.lua")
  use("ellisonleao/glow.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  -- Auto pair
  use({
    "windwp/nvim-autopairs", -- https://github.com/windwp/nvim-autopairs
    config = function()
      require("nvim-autopairs").setup({ disable_filetype = { "TelescopePrompt", "vim" } })
    end,
  })
  -- Term
  use("akinsho/nvim-toggleterm.lua")
  -- Surround
  use("machakann/vim-sandwich")
  -- Corlors
  use({
    "norcalli/nvim-colorizer.lua", -- https://github.com/norcalli/nvim-colorizer.lua
    config = function()
      require("colorizer").setup({})
    end,
  })
  -- Notes
  use("vimwiki/vimwiki")
  use("michal-h21/vimwiki-sync")
  -- CocSearch alternative
  use("dyng/ctrlsf.vim")

  -- Programming related
  use("b3nj5m1n/kommentary")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("liuchengxu/vista.vim")
  use({
    "folke/todo-comments.nvim", -- https://github.com/folke/todo-comments.nvim
    requires = "nvim-lua/plenary.nvim", -- https://github.com/nvim-lua/plenary.nvim
    config = function()
      require("todo-comments").setup({})
    end,
  })
  use("github/copilot.vim")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  -- Git
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("sindrets/diffview.nvim")

  -- Theme && status line
  use("Dualspc/spaceodyssey.nvim")
  use("kdav5758/TrueZen.nvim")
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    --[[ config = function()
            -- Options (see available options below)
            vim.g.rose_pine_variant = 'dawn'

            -- Load colorscheme after options
            vim.cmd('colorscheme rose-pine')
        end ]]
  })
  use({
    "mcchrish/zenbones.nvim", -- https://github.com/mcchrish/zenbones.nvim
    requires = "rktjmp/lush.nvim", -- https://github.com/rktjmp/lush.nvim
  })
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
  use("ojroques/vim-oscyank")
end)
