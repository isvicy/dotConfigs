HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
## History command configuration from ZSH
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

export PATH=$HOME/.cargo/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

alias rc="nvim $HOME/.zshrc"
alias history="history 0"
alias config="nvim $HOME/.config/i3/config"
if type "$kitty" > /dev/null; then
    alias ssh="kitty +kitten ssh"
fi

if [ -f ~/.zshrc_third ]; then
    source ~/.zshrc_third
else
    print "404: ~/.zshrc_third not found"
fi
