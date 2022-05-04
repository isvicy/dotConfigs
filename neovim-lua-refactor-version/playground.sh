#!/usr/bin/sh

NVIM_PLAYGROUND=~/.config/nvim-playground
export NVIM_PLAYGROUND

rm -rf $NVIM_PLAYGROUND

mkdir -p $NVIM_PLAYGROUND/share
mkdir -p $NVIM_PLAYGROUND/nvim

stow --restow --target=$NVIM_PLAYGROUND/nvim .

alias nvp='XDG_DATA_HOME=$NVIM_PLAYGROUND/share XDG_CACHE_HOME=$NVIM_PLAYGROUND XDG_CONFIG_HOME=$NVIM_PLAYGROUND nvim'
