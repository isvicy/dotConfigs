" {{{ custom hot-key
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" vscode style file searcher
nnoremap <C-p> :Files<cr>
nnoremap <C-l> :Vista!!<cr>

" move between window easier
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" close all buffer but current focus one
nnoremap <leader>D :BufOnly<cr>

" search symbol
nnoremap <leader>fw :Rg <C-R><C-W><CR>
nnoremap <leader>rw :CocSearch <C-R><C-W><CR>

" git related
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>gt :GCheckoutTag<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>

" yank list
nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>
" new term
nnoremap <silent> <leader>nt :CocCommand floaterm.new<cr>
" }}}

" {{{ abbr
abbr rg Rg
abbr Wg wg
abbr QA qa
abbr format Format
abbr cc CocCommand
" }}}

" {{{ custom highlight
""" Customize colors
hi CocErrorVirtualText ctermfg=Red guifg=#ff0000
hi CocWarningVirtualText ctermfg=Yellow guifg=#ffff00
" }}}
