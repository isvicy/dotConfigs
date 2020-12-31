-- Lua Aliases
require('statusline')
require('nvim_func')


local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--Package manager

cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
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
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
paq {'Shougo/neosnippet.vim'}
paq {'jiangmiao/auto-pairs'}
paq {'Shougo/neosnippet-snippets'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'mbbill/undotree'}
paq {'rafcamlet/nvim-luapad'}
paq {'lewis6991/gitsigns.nvim'}



--ToDO
local indent = 4

opt('b', 'expandtab', true)                -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)             -- Size of an indent
opt('b', 'smartindent', true)              -- Insert indents automatically
opt('b', 'tabstop', indent)                -- Number of spaces tabs count for
opt('o', 'termguicolors', true)            -- True color support
opt('w', 'relativenumber', true)           -- Relative line numbers
opt('w', 'number', true)                   -- Relative line numbers
opt('o', 'hidden', true)                   -- Enable background buffers
opt('o', 'ignorecase', true)               -- Ignore case
opt('o', 'smartcase', true)                -- Don't ignore case with capitals
opt('o', 'splitbelow', true)               -- Put new windows below current
opt('o', 'splitright', true)               -- Put new windows right of current
opt('o', 'wildmode', 'longest:full,full')  -- Command-line completion mode
opt('w', 'wrap', false)                    -- Disable line wrap

cmd 'set noswapfile'
cmd 'colorscheme spaceodyssey'
cmd 'set noshowmode'
vim.api.nvim_set_option('mouse', 'niv')
vim.api.nvim_set_option('cmdheight', 2)

local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

local lsp = require 'lspconfig'
lsp.bashls.setup {filetypes = {"sh", "zsh", "bash"}}
lsp.clangd.setup {cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },}
lsp.jsonls.setup {}
lsp.sumneko_lua.setup {
    cmd = { "/Users/dennys/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/macOS/lua-language-server", "-E", "/Users/dennys/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua" },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}
lsp.tsserver.setup{}


local color = require 'colorizer'
color.setup()

g['mapleader'] = ' '

map('n', '<leader>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<leader>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>ho', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('n', '<leader>h', '<C-W><C-H>')
map('n', '<leader>l', '<C-W><C-L>')
map('n', '<leader>k', '<C-W><C-K>')
map('n', '<leader>j', '<C-W><C-J>')
map('n', 'J', '<C-d>')
map('n', 'K', '<C-u>')
map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'J', '<C-d>')
map('v', 'K', '<C-u>')
map('v', 'H', '^')
map('v', 'L', '$')
map('n', '<esc>', '<cmd>noh<CR>')
map('t', '<esc>', '<C-\\><C-n>')
map('n', 'ö', '<C-]>')
map('n', 'é', '<C-O>')
map('n', 'ü', ']s')
map('n', 'è', '[s')
map('n', '<leader>1', '<cmd>b1<CR>')
map('n', '<leader>2', '<cmd>b2<CR>')
map('n', '<leader>3', '<cmd>b3<CR>')
map('n', '<leader>4', '<cmd>b4<CR>')
map('n', '<leader>5', '<cmd>b5<CR>')
map('n', '<leader>6', '<cmd>b6<CR>')
map('n', 'ev', '<cmd>vsplit ~/.config/nvim/init.lua<cr>')
map('n', 'ss', '<cmd>w<cr>')
map('n', '£', '%')




g['indentLine_char'] = '|'
g['indentLine_fileTypeExclude'] = {'text', 'help', 'terminal'}
g['vista_default_executive'] = 'ctags'


map('n', '<leader>e', '<cmd>:LuaTreeToggle<CR>')
-- g['lua_tree_show_icons'] = { ['git'] = 1, ['folders'] = 0, ['files'] = 0} "Example for Dictionary"

cmd 'sign define LspDiagnosticsSignError text='
cmd 'sign define LspDiagnosticsSignWarning text=ﰣ'
cmd 'sign define LspDiagnosticsSignInformation text='
cmd 'sign define LspDiagnosticsSignHint text='

vim.api.nvim_set_keymap('i', '<S-CR>', '<Plug>(neosnippet_expand_or_jump)', {silent = true})
vim.api.nvim_set_keymap('s', '<S-CR>', '<Plug>(neosnippet_expand_or_jump)', {silent = true})
vim.api.nvim_set_keymap('x', '<S-CR>', '<Plug>(neosnippet_expand_target)', {silent = true})


local telescope = require('telescope')
telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = ">",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      -- TODO add builtin options.
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    file_previewer = require'telescope.previewers'.cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
  }
}

map('n', '<leader>f', '<cmd>Telescope fd<cr>')
map('n', '<leader>t', '<cmd>Telescope tags<cr>')
map('n', '<leader>0', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>ch', '<cmd>Telescope command_history<cr>')
map('n', '<leader>c', '<cmd>Telescope commands<cr>')
map('n', '<leader>g', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>r', '<cmd>Telescope reloader<cr>')

map('n', '<leader>cc', "<cmd>lua require('nvim_func').compile_run_cpp('sp', '20')<cr>")

-- Unfortunately Neovim doesn’t have an interface to create commands and autocommands yet.
-- Work is in progress to implement such an interface, see PR#11613 for commands and PR#12378 for autocommands.
-- (Status: 27.12.20)
cmd"autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)"

local gs = require('gitsigns')
gs.setup {
  signs = {
    add          = {hl = 'DiffAdd'   , text = '│', numhl='GitSignsAddNr'},
    change       = {hl = 'DiffChange', text = '│', numhl='GitSignsChangeNr'},
    delete       = {hl = 'DiffDelete', text = '_', numhl='GitSignsDeleteNr'},
    topdelete    = {hl = 'DiffDelete', text = '‾', numhl='GitSignsDeleteNr'},
    changedelete = {hl = 'DiffChange', text = '~', numhl='GitSignsChangeNr'},
  },
  numhl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
  },
  watch_index = {
    interval = 1000
  },
  sign_priority = 6,
  status_formatter = nil, -- Use default
}
