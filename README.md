# dotConfigs

Collection of dot configs for nvim, tmux, and other linux tools for self-use.

This repo use stow to manage dotfiles. see: [Managing Dotfiles with GNU stow](https://news.ycombinator.com/item?id=27137172)

## deps

* ripgrep
* fzf
* ctags
* stow

## 配置 vim 注： 请使用 vim 8.0 以后的版本；
1. `stow vim -t ~ -v // 自动建立软链`
2. `vim  // 开启 vim, 此时 vim 会自动安装插件`

## 配置 nvim 注：配置需要使用 0.5 版本的 nvim, 需要手动下载 nvim repo, 然后编译。 详细参见 nvim repo 里的 build nvim 模块
1. `stow nvim-lua -t ~ -v // 自动建立软链`
2. 安装包管理器： ```
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim ```
3. 启动 nvim，然后执行 `:PackerCompile`和`:PackerInstall`（安装插件）
4. 3 安装插件完毕之后，退出 nvim, 重开就好；
![Screenshot](/screenshots/nvim.png?raw=true "Example Screenshot")
![Screenshot](/screenshots/nvim1.png?raw=true "Example Screenshot")
