# dotConfigs

Collection of dot configs for nvim, tmux, and other linux tools.

This repo use stow to manage dotfiles. see: [Managing Dotfiles with GNU stow](https://news.ycombinator.com/item?id=27137172)

## deps
### basic
    * stow

### for nvim
    * ripgrep

### for vim
    * fzf
    * ctags
    * [stylua](https://github.com/JohnnyMorganz/StyLua): `cargo install stylua`, for lua formatting.

## config vim
Note: need vim 8.0+
1. `stow vim -t ~ -v`
2. `vim`

## config nvim
Note: need nvim 0.5+
1. `stow nvim-lua -t ~ -v`
2. install packer： ```
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim ```
3. start nvim，run`:PackerCompile`和`:PackerInstall`
4. restart nvim

## screenshot
![Screenshot](/screenshots/nvim.png?raw=true "Example Screenshot")
![Screenshot](/screenshots/nvim1.png?raw=true "Example Screenshot")
