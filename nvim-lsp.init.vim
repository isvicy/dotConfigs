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

" Extentions to built-in LSP, for example, providing type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Theme
Plug 'sainnhe/gruvbox-material'

Plug 'nvim-lua/lsp-status.nvim'

call plug#end()

let mapleader = ' '

syntax enable
filetype plugin indent on


" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c


" Configure lsp
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local lsp_status = require('lsp-status')

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
}


nvim_lsp.pyls.setup({
    enable = true,
    plugins = {
    pyls_mypy = {
        enabled = true,
        live_mode = false
        }
    },
    on_attach = on_attach
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
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
EOF

" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gtD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" rust-analyzer does not yet support goto declaration
" re-mapped `gd` to definition
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>


"" Visualize diagnostics
"let g:diagnostic_enable_virtual_text = 1
"let g:diagnostic_trimmed_virtual_text = '40'
"" Don't show diagnostics while in insert mode
"let g:diagnostic_insert_delay = 1

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }


" Important!!
if has('termguicolors')
	set termguicolors
endif

let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction


set statusline=%{StatuslineGit()}
set statusline+=%{expand('%:~:.')}\ (line:\ %l/%L\ col:\ %c)\ FileType:\ %y
set statusline+=%=
set statusline+=\ %{LspStatus()}
