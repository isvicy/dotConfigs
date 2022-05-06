#!/usr/bin/sh

NVIM_PLAYGROUND=~/.config/nvim-playground
export NVIM_PLAYGROUND

alias nvp='XDG_DATA_HOME=$NVIM_PLAYGROUND/share XDG_CACHE_HOME=$NVIM_PLAYGROUND XDG_CONFIG_HOME=$NVIM_PLAYGROUND nvim'

nvp