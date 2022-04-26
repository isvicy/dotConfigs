#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

base_dir=${HOME}/github/binarys
lua_dir=${base_dir}/lua-language-server
temp_path=/tmp/lua.tar.gz
target_dir=${HOME}/.local/bin
lua_bin_path=${lua_dir}/bin/lua-language-server

download(){
    machine_out="$(uname -s)"
    case "${machine_out}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=Mac;;
        CYGWIN*)    machine=Cygwin;;
        MINGW*)     machine=MinGw;;
        *)          machine="UNKNOWN:${machine_out}"
    esac
    echo ${machine}
    arch_out="$(uname -i)"
    case "${arch_out}" in 
        x86_64*)     arch=x86_64;;
        i*86)        arch=x32;;
        arm*)        arch=arm;;
        aarch64*)    arch=arm
    esac
    echo ${arch}
    
    if [[ ${machine} = "Linux" ]]; then
        case "${arch}" in
            x86_64) download_link="https://github.com/sumneko/lua-language-server/releases/download/3.2.1/lua-language-server-3.2.1-linux-x64.tar.gz";;
            arm) download_link="https://github.com/sumneko/lua-language-server/releases/download/3.2.1/lua-language-server-3.2.1-linux-arm64.tar.gz";;
        esac
    fi
    if [[ ${machine} = "Mac" ]]; then
        case "${arch}" in
            x86_64) download_link="https://github.com/sumneko/lua-language-server/releases/download/3.2.1/lua-language-server-3.2.1-darwin-x64.tar.gz";;
            arm) download_link="https://github.com/sumneko/lua-language-server/releases/download/3.2.1/lua-language-server-3.2.1-darwin-arm64.tar.gz";;
        esac
    fi
    if [[ -z "${download_link}" ]]; then
        echo "no match download link"
        exit 1
    fi
    wget ${download_link} -O ${temp_path}
}

ensureTargetDir(){
    dir=${1}
    if [[ ! -d "${dir}" ]]; then
        mkdir -p ${dir}
    fi
}

ensureTargetDir "${base_dir}"
ensureTargetDir "${target_dir}"
ensureTargetDir "${lua_dir}"
download
tar -xvzf ${temp_path} -C ${lua_dir}
ln -s ${lua_bin_path} ${target_dir}
rm --force --recursive ${temp_path}
