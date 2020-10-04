call plug#begin('~/.vim/plugged')
" {{{ DEV
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sebdah/vim-delve'
Plug 'liuchengxu/vista.vim'
" }}}

" {{{ Tools
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm'

" move or ui enhancements
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'itchyny/vim-cursorword'
Plug 'easymotion/vim-easymotion'

" note taking
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'
Plug 'lervag/vimtex'

" clean mess :)
Plug 'vim-scripts/BufOnly.vim'

" save vim session
Plug 'tpope/vim-obsession'
" }}}

" {{{ Theme && status line
" highlight enhancements
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/gruvbox-material'
Plug 'franbach/miramare'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}
call plug#end()

