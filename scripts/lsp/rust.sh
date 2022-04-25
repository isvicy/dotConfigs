#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

if ! command -v rustup &> /dev/null
then
    curl https://sh.rustup.rs -sSf | sh
fi

source $HOME/.cargo/env

rustup component add rust-src
