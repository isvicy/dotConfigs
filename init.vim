"----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------

" {{{ plug
call plug#begin('~/.vim/plugged')
" {{{ coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = [
        \ 'coc-explorer',
        \ 'coc-git',
        \ 'coc-go',
        \ 'coc-highlight',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-lists',
        \ 'coc-python',
        \ 'coc-rls',
        \ 'coc-rust-analyzer',
        \ 'coc-snippets',
        \ 'coc-swagger',
        \ 'coc-tsserver',
        \ 'coc-yaml',
        \ 'coc-yank'
        \]
" }}}

" {{{ Tools
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vista.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-obsession'
Plug 'sheerun/vim-polyglot'
Plug 'jceb/vim-orgmode'
" clean mess :)
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
    set nocompatible
    filetype plugin on
Plug 'itchyny/calendar.vim'
" just work like a charm
Plug 'itchyny/vim-cursorword'
Plug 'lervag/vimtex'
    let g:tex_flavor = 'latex'
    let g:vimtex_compiler_latexmk_engines = {'_':'-xelatex'}
    let g:vimtex_compiler_latexrun_engines ={'_':'xelatex'}
    let g:vimtex_compiler_progname = 'nvr'
Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1
" }}}

" Reading
Plug 'dansomething/vim-hackernews'

" {{{ Theme && status line
Plug 'sainnhe/gruvbox-material'
Plug 'franbach/miramare'
Plug 'vimoxide/vim-cinnabar'
Plug 'vim-airline/vim-airline'
    let g:airline#extensions#coc#enabled = 1
" stausline comes with cinnabar theme, but not working as expected.
" Plug 'vimoxide/vim-spaceline'
" }}}
call plug#end()
" }}}

" {{{ General settings
" Allow vim to set a custom font or color for a word
syntax enable
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set fdm=marker
set autoread                      " reload file if the file changes on the disk
set clipboard=unnamed
set colorcolumn=81                " highlight the 80th column as an indicator
set maxmempattern=500000
set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set relativenumber
set ruler
set splitbelow
set splitright
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title
set ignorecase
set ffs=unix,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Set the leader button
let mapleader = ' '

" Enable mouse if possible, but disable auto visual mode when using mouse.
if has('mouse')
    set mouse-=a
endif
" }}}

"{{{ neovim specific settings && true color config
if has('nvim')
    set clipboard=unnamedplus
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'

    " Credit joshdick
    " Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
    " If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
    " (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
    " if (empty($TMUX))
    " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if has("termguicolors")
    " fix bug for vim,  Note: ^[ are Ctrl-v ESC, but plain text.
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set termguicolors
endif

" enable italic support for vim when use xterm-256color in zsh when use tmux
if !has('nvim')
  " Note: ^[ are Ctrl-v ESC, but plain text.
  set t_ZH=[3m
  set t_ZR=[23m
endif
" }}}

" {{{ Airline theme
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" }}}

" {{{ Color schemes
set background=dark

" gruvbox-material theme {{{
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_palette = 'mix'
" let g:gruvbox_material_enable_italic = 1
"let g:gruvbox_material_disable_italic_comment = 1
"let g:airline_theme = 'gruvbox_material'
"    colorscheme gruvbox-material
"}}}

" miramare theme {{{
"let g:miramare_enable_italic = 1
"let g:miramare_disable_italic_comment = 1
"let g:airline_theme = 'miramare'
"    colorscheme miramare
"}}}

let g:airline_theme = 'miramare'
" elite border between splits window
set fillchars=vert:\
colorscheme cinnabar
" }}}

" {{{ custom hot-key
nnoremap <C-p> :Files<cr>
nnoremap <C-l> :Vista!!<cr>
" move between window easier
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>D :BufOnly<cr>
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <leader>fw :Rg <C-R><C-W><CR>
nnoremap <leader>rw :CocSearch <C-R><C-W><CR>
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>gt :GCheckoutTag<CR>
nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>

" {{{ fix typo
abbr rg Rg
abbr Wg wg
abbr QA qa
abbr format Format
abbr cc CocCommand
" }}}

" Position the (global) quickfix window at the very bottom of the window
" (useful for making sure that it appears underneath splits)
"
" NOTE: Using a check here to make sure that window-specific location-lists
" aren't effected, as they use the same `FileType` as quickfix-lists.
autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif
" }}}

" {{{ easymotion configuration
" <Leader>f{char} to move to {char}
map  <Leader>t <Plug>(easymotion-bd-f)
nmap <Leader>t <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}

" {{{ vimwiki configuration
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end
" }}}

" {{{ fzf configuration
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   "rg --column --line-number --no-heading --smart-case --no-ignore-vcs ".shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

" set float window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo' }  }
" }}}

" {{{ highlight configuration for golang with enhancement from polyglot
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
" }}}

" {{{ coc.nvim configuration
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" for lightline buffer plugin
set showtabline=2

hi CocErrorVirtualText ctermfg=Red guifg=#ff0000

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Use `:Prettier` to format current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Using CocList
nnoremap <silent>  <leader>lm  :CocList mru -A<CR>
nnoremap <silent>  <leader>lf  :CocList files<CR>
nnoremap <silent>  <leader>ls  :CocList grep<CR>
nnoremap <silent>  <leader>lt  :CocList symbols<CR>
nnoremap <silent>  <leader>lo  :CocList outline<CR>
nnoremap <silent>  <leader>ll  :CocList lines<CR>
nnoremap <silent>  <leader>ld  :CocList diagnostics<CR>
nnoremap <silent>  <leader>lw  :CocList --number-select windows<CR>
nnoremap <silent>  <leader>lb  :CocList --number-select buffers<CR>
nnoremap <silent>  <leader>ly  :CocList --number-select yank<CR>
nnoremap <silent>  <leader>lg  :CocList --number-select gstatus<CR>
nnoremap <silent>  <leader>lr  :CocList --number-select tasks<CR>
nnoremap <silent>  <leader>lp  :CocListResume<CR>
" }}}

" {{{ coc-go configuration
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
" }}}

" {{{ coc-explorer configuration
nnoremap <space>e :CocCommand explorer<CR>

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
nmap <space>ed :CocCommand explorer --preset .vim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>

" List all presets
nmap <space>el :CocList explPresets
" change default scheme, it quicker than <leader>x, don't know why.
nmap <C-e> :CocCommand explorer<CR>
" }}}

" {{{ indent settings for different file type
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
