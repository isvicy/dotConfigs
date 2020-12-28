"
"                            ________ ++ ________
"                           / VVVVVVVV \ ++++ / VVVVVVVV \
"                           \ VVVVVVVV / ++++++ \ VVVVVVVV /
"                            | VVVVVV | ++++++++ / VVVVV /'
"                            | VVVVVV | ++++++ / VVVVV /'
"                           + | VVVVVV | ++++ / VVVVV /'+
"                         +++ | VVVVVV | ++ / VVVVV /'+++++
"                       +++++ | VVVVVV | / VVVVV /'++++++++++
"                         +++ | VVVVVVVVVVV /'++++++++++
"                           + | VVVVVVVVV /'++++ +++++
"                            | VVVVVVV /'+++++++++
"                            | VVVVV /'+++++++++
"                            | VVV /'+++++++++
"                            'V /'++++++
"                                     ++
"
" {{{ Vim-Plug Plugin Manager
if has('nvim')
    if system('uname -s') =~ 'Darwin'
        let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
        let plug_path = stdpath('config') . '/plugged'
    else
        let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
        let plug_path = stdpath('data') . '/plugged'
    endif
else
        let autoload_plug_path = '~/.vim/autoload/plug.vim'
        let plug_path = '~/.vim/plugged'
endif


if !filereadable(expand(autoload_plug_path))
 silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" {{{ Plugs
call plug#begin(plug_path)

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

" LSP tags
Plug 'liuchengxu/vista.vim'

" Status line plugin for lsp status
Plug 'nvim-lua/lsp-status.nvim'

" Better syntax highlight
Plug 'nvim-treesitter/nvim-treesitter'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" FZF_LSP
Plug 'gfanto/fzf-lsp.nvim', { 'branch': 'main' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Foramtting
Plug 'Chiel92/vim-autoformat'

" FloatTerm
Plug 'voldikss/vim-floaterm'

" Usage: gaip=
Plug 'junegunn/vim-easy-align'

" The gruvbox
Plug 'sainnhe/gruvbox-material'

call plug#end()
" }}}

" {{{ General configs
let mapleader = ' '

" Enable mouse if possible, but disable auto visual mode when using mouse.
if has('mouse')
    set mouse-=a
endif

set nocompatible

syntax enable

filetype plugin indent on

set autoindent smartindent
set autoread                      " reload file if the file changes on the disk
set clipboard=unnamed
" Give more space for displaying messages.
set cmdheight=2
set tabstop=2
set softtabstop=2
set expandtab                     " expands tabs to spaces
set encoding=utf-8
set ffs=unix,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set ignorecase
set list listchars=tab:\|\ ,trail:▫
set maxmempattern=500000
set noswapfile                    " disable swapfile usage
set nowrap
set nospell                       " disable spelling
set noerrorbells novisualbell     " I said, no bells!
set number relativenumber
set ruler cursorline colorcolumn=81 
set splitbelow
set splitright
set title                         " let vim set the terminal title
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" disable auto comment when insert new line
autocmd FileType * set formatoptions-=cro

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

if system('uname -r') =~ "Microsoft"
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
endif
" }}}

" {{{ Neovim specific settings
if has('nvim')
    set clipboard=unnamedplus
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

if has('termguicolors')
	set termguicolors
endif
" }}}

" {{{ Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
" }}}

" {{{ Customize
" {{{ custom hot-key
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>fw :Rg <C-R><C-W><CR>

" move between window easier
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>d :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<cr>

" git related
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>gt :GCheckoutTag<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>

nnoremap <leader>nt :FloatermNew --height=0.6 --width=0.95<CR>

" move to end or beggning within insert mode.
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" {{{ abbr
abbr Wg wg
abbr QA qa
abbr au Autoformat
abbr rg Rg
" }}}
" }}}

" {{{ LSP Configure
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local lsp_status = require'lsp-status'

local fzf_lsp = require'fzf_lsp'

lsp_status.config {
  kind_labels = vim.g.completion_customize_lsp_label,
  select_symbol = function(cursor_pos, symbol)
    if symbol.valueRange then
      local value_range = {
        ['start'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[1])},
        ['end'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[2])}
      }

      return require('lsp-status/util').in_range(cursor_pos, value_range)
    end
  end,
  current_function = false
}

lsp_status.register_progress()

lsp_status.config({
  status_symbol = '',
  indicator_errors = 'e',
  indicator_warnings = 'w',
  indicator_info = 'i',
  indicator_hint = 'h',
  indicator_ok = '✔️',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})

-- function to attach completion
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
    lsp_status.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ 
    on_attach=on_attach,
    capabilities = lsp_status.capabilities
})

nvim_lsp.gopls.setup {
    cmd = {"gopls", "serve"},
    on_attach=on_attach,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                nonewvars = true,
            },
            staticcheck = true,
            usePlaceholders = false,
            completeUnimported= true
        },
    },
    capabilities = lsp_status.capabilities
}


nvim_lsp.pyls.setup({
    enable = true,
    plugins = {
    pyls_mypy = {
        enabled = true,
        live_mode = false
        }
    },
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    custom_capture = {
      ["TODO"] = "Identifier",
    }
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = '~',
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,
    -- Disable a feature
    update_in_insert = false,
  }
  )

  vim.lsp.handlers["textDocument/codeAction"]     = fzf_lsp.code_action_handler
  vim.lsp.handlers["textDocument/definition"]     = fzf_lsp.definition_handler
  vim.lsp.handlers["textDocument/declaration"]    = fzf_lsp.declaration_handler
  vim.lsp.handlers["textDocument/typeDefinition"] = fzf_lsp.type_definition_handler
  vim.lsp.handlers["textDocument/implementation"] = fzf_lsp.implementation_handler
  vim.lsp.handlers["textDocument/references"]     = fzf_lsp.references_handler
  vim.lsp.handlers["textDocument/documentSymbol"] = fzf_lsp.document_symbol_handler
  vim.lsp.handlers["workspace/symbol"]            = fzf_lsp.workspace_symbol_handler

EOF
" }}}

" {{{ lsp mapping
" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gtd   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gca   <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>fb <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>lb <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>lw <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

set foldmethod=expr
set foldlevel=2
set foldlevelstart=2
set foldnestmax=2
set foldexpr=nvim_treesitter#foldexpr()

let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material

" Find files using Telescope command-line sugar.
" nnoremap <C-p>      <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" }}}

" {{{ fzf configuration
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   "rg --column --line-number --hidden --no-heading --smart-case --no-ignore-vcs ".shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

" set float window
let g:fzf_preview_window = ['up:62%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.6, 'highlight': 'Todo' } }
" }}}

" {{{ Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

" {{{ Simple func for getting git branch
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
" }}}

if system('uname -r') =~ "Microsoft"
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
endif

set statusline=%{FugitiveStatusline()}
set statusline+=\ %{expand('%:~:.')}\ (Ln:\ %l/%L\ Col:\ %c)\ %y
set statusline+=%=
set statusline+=\ %{LspStatus()}
" }}}

" {{{ Indent Settings
"----------------------------------------------
" Language: apiblueprint
"----------------------------------------------
au FileType apiblueprint set expandtab
au FileType apiblueprint set shiftwidth=4
au FileType apiblueprint set softtabstop=4
au FileType apiblueprint set tabstop=4

"----------------------------------------------
" Language: Bash
"----------------------------------------------
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

"----------------------------------------------
" Language: C++
"----------------------------------------------
au FileType cpp set expandtab
au FileType cpp set shiftwidth=4
au FileType cpp set softtabstop=4
au FileType cpp set tabstop=4

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: fish
"----------------------------------------------
au FileType fish set expandtab
au FileType fish set shiftwidth=2
au FileType fish set softtabstop=2
au FileType fish set tabstop=2

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: Make
"----------------------------------------------
au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

"----------------------------------------------
" Language: PlantUML
"----------------------------------------------
au FileType plantuml set expandtab
au FileType plantuml set shiftwidth=2
au FileType plantuml set softtabstop=2
au FileType plantuml set tabstop=2

"----------------------------------------------
" Language: Protobuf
"----------------------------------------------
au FileType proto set expandtab
au FileType proto set shiftwidth=2
au FileType proto set softtabstop=2
au FileType proto set tabstop=2

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: Ruby
"----------------------------------------------
au FileType ruby set expandtab
au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2
au FileType ruby set tabstop=2

" Enable neomake for linting.
"au FileType ruby autocmd BufWritePost * Neomake

"----------------------------------------------
" Language: SQL
"----------------------------------------------
au FileType sql set expandtab
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2

"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
au FileType typescript set expandtab
au FileType typescript set shiftwidth=4
au FileType typescript set softtabstop=4
au FileType typescript set tabstop=4

"----------------------------------------------
" Language: vimscript
"----------------------------------------------
au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
" }}}
