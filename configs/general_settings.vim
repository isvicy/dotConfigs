let mapleader = ' '

" Enable mouse if possible, but disable auto visual mode when using mouse.
if has('mouse')
    set mouse-=a
endif

" needed by vim-wiki
set nocompatible
filetype plugin on

syntax enable

set autoindent smartindent
set autoread                      " reload file if the file changes on the disk
set clipboard=unnamed
" Give more space for displaying messages.
set cmdheight=2
set expandtab                     " expands tabs to spaces
set encoding=utf-8
set fdm=marker
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
set softtabstop=2
set title                         " let vim set the terminal title
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" disable auto comment when insert new line
autocmd FileType * set formatoptions-=cro

" Position the (global) quickfix window at the very bottom of the window
" (useful for making sure that it appears underneath splits)
"
" NOTE: Using a check here to make sure that window-specific location-lists
" aren't effected, as they use the same `FileType` as quickfix-lists.
autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif

"{{{ neovim specific settings && true color config
if has('nvim')
    set clipboard=unnamedplus
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if has("termguicolors")
    set termguicolors
endif

" enable italic support for vim when use xterm-256color in zsh when use tmux
if !has('nvim')
  " Note: ^[ are Ctrl-v ESC, but plain text.
  set t_ZH=[3m
  set t_ZR=[23m
  " fix bug for vim,  Note: ^[ are Ctrl-v ESC, but plain text.
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
endif
" }}}
