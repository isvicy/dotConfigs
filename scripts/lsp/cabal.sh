#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

PATH=${HOME}/.cabal/bin:${PATH}

install() {
	machine_out="$(uname -s)"
	case "${machine_out}" in
	Linux*) machine=Linux ;;
	Darwin*) machine=Mac ;;
	CYGWIN*) machine=Cygwin ;;
	MINGW*) machine=MinGw ;;
	*) machine="UNKNOWN:${machine_out}" ;;
	esac
	echo ${machine}
	if [[ ${machine} = "Linux" ]]; then
		sudo apt update && sudo apt install -y cabal-install
	fi
	if [[ ${machine} = "Mac" ]]; then
		brew install cabal-install
	fi
}

cabal update
cabal install ShellCheck
