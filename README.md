# dotConfigs

Collection of dot configs for nvim, tmux, and other linux tools for self-use.

This repo use stow to manage dotfiles. see: [Managing Dotfiles with GNU stow](https://news.ycombinator.com/item?id=27137172)

## deps

* ripgrep
* fzf
* ctags
* stow

## 配置vim 注： 请使用vim 8.0以后的版本；
1. stow vim -t ~ -v // 自动建立软链
2. vim ./ // 开启vim, 此时vim会自动安装插件；

## 配置nvim 注：配置需要使用0.5版本的nvim,需要手动下载nvim repo,然后编译。 详细参见nvim repo里的build nvim模块
1. stow nvim-lua -t ~ -v // 自动建立软链
2. 安装包管理器： ```
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim ```
3. 启动nvim，然后执行 `:PackerCompile`和`:PackerInstall`(安装插件)
4. 3安装插件完毕之后，退出nvim, 重开就好；
![Screenshot](/screenshots/nvim.png?raw=true "Example Screenshot")
![Screenshot](/screenshots/nvim1.png?raw=true "Example Screenshot")
