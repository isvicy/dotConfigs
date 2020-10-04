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
" {{{ Plug Management
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}
"
" This script contains all file plugs used in this config
source ~/.vim/config/plugs.vim
" This script contains configs for plug we use
source ~/.vim/config/plug_configs.vim
" This script contains vim native settings
source ~/.vim/config/general_settings.vim
" This script contains colorscheme we keeped
source ~/.vim/config/colors.vim
" This script contains custom hot-key, abbr and other settings like highlighting
source ~/.vim/config/customize.vim
" This script sepicied indent width for some kinds of file type
source ~/.vim/config/indent.vim
