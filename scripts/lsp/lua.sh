#!/bin/bash
# rember to put ${HOME}/.local/bin to path
set -o errexit
set -o nounset
set -o pipefail
set -x

base_dir="${HOME}/github"
if [ -d "${base_dir}" ]; then
    echo "${base_dir} existed"
else
    mkdir ${base_dir}
fi
target_dir="${HOME}/.local/bin"
if [ -d "${target_dir}" ]; then
    echo "${target_dir} existed"
else
    mkdir -p ${target_dir}
fi

dir="${base_dir}/lua-language-server"
if [ -d "${dir}" ]; then
    echo "cloned"
else
    git clone https://github.com/sumneko/lua-language-server ${base_dir}
fi

cd ${dir}
git submodule update --init --recursive
git pull
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
target_file="${HOME}/.local/bin/lua-language-server"
if [ -L "${target_file}" ]; then
    rm --force --recursive ${target_file}
fi
ln -s ${dir}/bin/lua-language-server ${HOME}/.local/bin

