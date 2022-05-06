local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      })
      vim.cmd([[packadd packer.nvim]])
    end
    vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")
  end

  -- Plugins
  local function plugins(use)
    use({ "wbthomason/packer.nvim" })

    -- Performance
    use({ "lewis6991/impatient.nvim" })

    -- Load only when require
    use({ "nvim-lua/plenary.nvim", module = "plenary" })

    -- Notification
    use({
      "rcarriga/nvim-notify",
      event = "VimEnter",
      config = function()
        vim.notify = require("notify")
      end,
    })

    -- Colorscheme
    use({
      "folke/tokyonight.nvim",
      config = function()
        vim.cmd("colorscheme tokyonight")
      end,
      disable = true,
    })
    use({
      "mcchrish/zenbones.nvim",
      requires = "rktjmp/lush.nvim", -- https://github.com/rktjmp/lush.nvim
      config = function()
        vim.cmd("colorscheme neobones")
      end,
    })
    use({
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
        require("colorizer").setup()
      end,
    })

    -- Enhance
    use({
      "szw/vim-maximizer",
      cmd = "MaximizerToggle",
      keys = { [[<leader>z]] },
      config = function()
        require("config.maximizer").setup()
      end,
    })
    use({
      "dyng/ctrlsf.vim",
      cmd = { "CtrlSF" },
      keys = { [[<leader>rw]] },
      config = function()
        require("config.ctrlsf").setup()
      end,
    })
    -- yank through ssh
    use({
      "ojroques/vim-oscyank",
      cmd = "OSCYank",
      keys = { [[<leader>c]] },
      config = function()
        require("config.oscyank").setup()
      end,
    })

    use({
      "ellisonleao/glow.nvim",
      cmd = { "Glow", "GlowInstall" },
    })

    use({
      "liuchengxu/vista.vim",
      cmd = "Vista",
      keys = { [[<c-l>]] },
      config = function()
        require("config.vista").setup()
      end,
    })

    -- Startup screen
    use({
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    })

    -- Git
    use({
      "TimUntersberger/neogit",
      cmd = "Neogit",
      config = function()
        require("config.neogit").setup()
      end,
    })
    use({
      "lewis6991/gitsigns.nvim",
      event = "BufReadPre",
      wants = "plenary.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("config.gitsigns").setup()
      end,
    })
    use({
      "tpope/vim-fugitive",
      cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
      requires = { "tpope/vim-rhubarb" },
    })
    use({
      "ruifm/gitlinker.nvim",
      requires = "nvim-lua/plenary.nvim",
      module = "gitlinker",
      config = function()
        require("gitlinker").setup({ mappings = nil })
      end,
    })
    use({
      "pwntester/octo.nvim",
      cmd = "Octo",
      wants = { "telescope.nvim", "plenary.nvim", "nvim-web-devicons" },
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        require("octo").setup()
      end,
      disable = true,
    })

    -- IndentLine
    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.indentblankline").setup()
      end,
    })

    -- Better icons
    use({
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup({ default = true })
      end,
    })

    -- Better Comment
    use({
      "numToStr/Comment.nvim",
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("config.comment").setup()
      end,
    })

    -- Better surround
    use({ "tpope/vim-surround", event = "InsertEnter" })

    -- Motions
    use({ "andymass/vim-matchup", event = "CursorMoved" })
    use({ "wellle/targets.vim", event = "CursorMoved" })
    use({ "unblevable/quick-scope", event = "CursorMoved", disable = false })
    use({ "chaoren/vim-wordmotion", opt = true, fn = { "<Plug>WordMotion_w" } })

    -- Buffer
    use({ "kazhala/close-buffers.nvim", cmd = { "BDelete", "BWipeout" } })

    -- IDE
    use({
      "antoinemadec/FixCursorHold.nvim",
      event = "BufReadPre",
      config = function()
        vim.g.cursorhold_updatetime = 100
      end,
    })
    use({
      "karb94/neoscroll.nvim",
      event = "BufReadPre",
      config = function()
        require("config.neoscroll").setup()
      end,
      disable = true,
    })
    use({ "google/vim-searchindex", event = "BufReadPre" })

    -- Code documentation
    use({
      "danymat/neogen",
      config = function()
        require("neogen").setup({})
      end,
      cmd = { "Neogen" },
    })

    -- Status line
    use({
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      after = "nvim-treesitter",
      config = function()
        require("config.lualine").setup()
      end,
      wants = "nvim-web-devicons",
    })
    use({
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter",
      module = "nvim-gps",
      wants = "nvim-treesitter",
      config = function()
        require("nvim-gps").setup()
      end,
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufRead",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        "windwp/nvim-ts-autotag",
        "JoosepAlviste/nvim-ts-context-commentstring",
      },
    })

    if PLUGINS.fzf_lua.enabled then
      -- FZF
      use({ "junegunn/fzf", run = "./install --all", event = "VimEnter", disable = true }) -- You don't need to install this if you already have fzf installed
      use({ "junegunn/fzf.vim", event = "BufEnter", disable = true })

      -- FZF Lua
      use({
        "ibhagwan/fzf-lua",
        event = "BufEnter",
        wants = "nvim-web-devicons",
        requires = { "junegunn/fzf", run = "./install --all" },
      })
    end

    if PLUGINS.telescope.enabled then
      use({
        "nvim-telescope/telescope.nvim",
        opt = true,
        config = function()
          require("config.telescope").setup()
        end,
        cmd = { "Telescope" },
        module = { "telescope", "telescope.builtin" },
        keys = { [[<c-p>]] },
        wants = {
          "plenary.nvim",
          "popup.nvim",
          "telescope-fzf-native.nvim",
          "telescope-project.nvim",
          "telescope-repo.nvim",
          "telescope-file-browser.nvim",
          "project.nvim",
          "trouble.nvim",
          "telescope-dap.nvim",
          "telescope-frecency.nvim",
        },
        requires = {
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim",
          { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
          "nvim-telescope/telescope-project.nvim",
          "cljoly/telescope-repo.nvim",
          "nvim-telescope/telescope-file-browser.nvim",
          { "nvim-telescope/telescope-frecency.nvim", requires = "tami5/sqlite.lua" },
          {
            "ahmedkhalf/project.nvim",
            config = function()
              require("config.project").setup()
            end,
          },
          "nvim-telescope/telescope-dap.nvim",
        },
      })
    end

    -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      opt = true,
      wants = "nvim-web-devicons",
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      module = "nvim-tree",
      config = function()
        require("config.nvimtree").setup()
      end,
    })

    -- Buffer line
    use({
      "akinsho/nvim-bufferline.lua",
      event = "BufReadPre",
      wants = "nvim-web-devicons",
      config = function()
        require("config.bufferline").setup()
      end,
    })

    -- User interface
    use({
      "stevearc/dressing.nvim",
      event = "BufReadPre",
      config = function()
        require("dressing").setup({
          input = { relative = "editor" },
          select = {
            backend = { "telescope", "fzf", "builtin" },
          },
        })
      end,
      disable = false,
    })

    use({
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      config = function()
        require("config.cmp").setup()
      end,
      wants = { "LuaSnip" },
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-cmdline",
        "octaltree/cmp-look", -- https://github.com/octaltree/cmp-look
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        {
          "L3MON4D3/LuaSnip",
          wants = { "friendly-snippets" },
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
        "rafamadriz/friendly-snippets",
      },
      disable = not PLUGINS.nvim_cmp.enabled,
    })

    -- Auto pairs
    use({
      "windwp/nvim-autopairs",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("config.autopairs").setup()
      end,
    })

    -- Auto tag
    use({
      "windwp/nvim-ts-autotag",
      wants = "nvim-treesitter",
      event = "InsertEnter",
      config = function()
        require("nvim-ts-autotag").setup({ enable = true })
      end,
    })

    -- End wise
    use({
      "RRethy/nvim-treesitter-endwise",
      wants = "nvim-treesitter",
      event = "InsertEnter",
      disable = false,
    })

    -- LSP
    if PLUGINS.nvim_cmp.enabled then
      use({
        "neovim/nvim-lspconfig",
        opt = true,
        event = "VimEnter",
        wants = {
          "nvim-lsp-installer",
          "cmp-nvim-lsp",
          "lua-dev.nvim",
          "vim-illuminate",
          "null-ls.nvim",
          "schemastore.nvim",
          "typescript.nvim",
          "goto-preview", -- https://github.com/rmagatti/goto-preview
          "nvim-code-action-menu", -- https://github.com/weilbith/nvim-code-action-menu
        },
        config = function()
          require("config.lsp").setup()
        end,
        requires = {
          "williamboman/nvim-lsp-installer",
          "folke/lua-dev.nvim",
          "RRethy/vim-illuminate",
          "jose-elias-alvarez/null-ls.nvim",
          {
            "j-hui/fidget.nvim",
            config = function()
              require("fidget").setup({})
            end,
          },
          "b0o/schemastore.nvim",
          "jose-elias-alvarez/typescript.nvim",
          {
            "rmagatti/goto-preview",
            config = function()
              require("config.goto-preview").setup()
            end,
          }, -- https://github.com/rmagatti/goto-preview
          {
            "weilbith/nvim-code-action-menu",
            cmd = "CodeActionMenu",
            config = function()
              require("config.code-action-menu").setup()
            end,
          }, -- https://github.com/weilbith/nvim-code-action-menu
        },
      })
    end

    -- trouble.nvim
    use({
      "folke/trouble.nvim",
      wants = "nvim-web-devicons",
      cmd = { "TroubleToggle", "Trouble" },
      config = function()
        require("trouble").setup({
          use_diagnostic_signs = true,
        })
      end,
    })

    -- Rust
    use({
      "simrat39/rust-tools.nvim",
      requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
      opt = true,
      module = "rust-tools",
      ft = { "rust" },
      config = function()
        require("config.rust").setup()
      end,
    })

    -- Go
    use({
      "ray-x/go.nvim",
      ft = { "go" },
      config = function()
        require("go").setup()
      end,
    })

    -- Terminal
    use({
      "akinsho/toggleterm.nvim",
      keys = { [[<C-\>]] },
      cmd = { "ToggleTerm", "TermExec" },
      config = function()
        require("config.toggleterm").setup()
      end,
    })

    -- Debugging
    use({
      "mfussenegger/nvim-dap",
      opt = true,
      -- event = "BufReadPre",
      keys = { [[<leader>d]] },
      module = { "dap" },
      wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python" },
      requires = {
        "alpha2phi/DAPInstall.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        "nvim-telescope/telescope-dap.nvim",
        { "leoluz/nvim-dap-go", module = "dap-go" },
        { "jbyuki/one-small-step-for-vimkind", module = "osv" },
      },
      config = function()
        require("config.dap").setup()
      end,
      disable = not PLUGINS.nvim_dap.enabled,
    })

    -- vimspector
    use({
      "puremourning/vimspector",
      cmd = { "VimspectorInstall", "VimspectorUpdate" },
      fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
      config = function()
        require("config.vimspector").setup()
      end,
      disable = not PLUGINS.vimspector.enabled,
    })

    -- AI completion
    use({ "github/copilot.vim", event = "InsertEnter" })

    -- Legendary
    use({
      "mrjones2014/legendary.nvim",
      opt = true,
      keys = { [[<C-k>]] },
      wants = { "dressing.nvim" },
      config = function()
        require("config.legendary").setup()
      end,
      requires = { "stevearc/dressing.nvim" },
    })

    -- Harpoon
    use({
      "ThePrimeagen/harpoon",
      keys = { [[<leader>j]] },
      module = { "harpoon", "harpoon.cmd-ui", "harpoon.mark", "harpoon.ui", "harpoon.term" },
      wants = { "telescope.nvim" },
      config = function()
        require("config.harpoon").setup()
      end,
    })

    -- Refactoring
    use({
      "ThePrimeagen/refactoring.nvim",
      module = { "refactoring", "telescope" },
      keys = { [[<leader>r]] },
      wants = { "telescope.nvim" },
      config = function()
        require("config.refactoring").setup()
      end,
    })
    use({ "python-rope/ropevim", run = "pip install ropevim", disable = true })
    use({
      "kevinhwang91/nvim-bqf",
      ft = "qf",
      disable = true,
      config = function()
        require("bqf").setup()
      end,
    })
    use({ "kevinhwang91/nvim-hlslens", event = "BufReadPre", disable = true })
    use({ "nvim-pack/nvim-spectre", module = "spectre", keys = { "<leader>s" } })

    -- Performance
    use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
    use({ "nathom/filetype.nvim" })

    -- Web
    use({
      "vuki656/package-info.nvim",
      opt = true,
      requires = {
        "MunifTanjim/nui.nvim",
      },
      wants = { "nui.nvim" },
      module = { "package-info" },
      ft = { "json" },
      config = function()
        require("config.package").setup()
      end,
      disable = false,
    })
    use({
      "meain/vim-package-info",
      ft = { "json" },
      run = "npm install",
      disable = true,
    })

    -- Session
    use({
      "rmagatti/auto-session",
      opt = true,
      cmd = { "SaveSession", "RestoreSession" },
      requires = { "rmagatti/session-lens" },
      wants = { "telescope.nvim", "session-lens" },
      config = function()
        require("config.autosession").setup()
      end,
      disable = false,
    })
    use({
      "jedrzejboczar/possession.nvim",
      config = function()
        require("config.possession").setup()
      end,
      cmd = { "PossessionSave", "PosessionLoad", "PosessionShow", "PossessionList" },
      disable = true,
    })
    use({
      "tpope/vim-obsession",
      cmd = { "Obsess" },
      config = function()
        require("config.obsession").setup()
      end,
      disable = true,
    })

    -- Bootstrap Neovim
    if packer_bootstrap then
      print("Restart Neovim required after installation!")
      require("packer").sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require("packer")

  -- Performance
  pcall(require, "impatient")
  -- pcall(require, "packer_compiled")

  packer.init(conf)
  packer.startup(plugins)
end

return M