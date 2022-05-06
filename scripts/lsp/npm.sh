#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

command_name=(pyright-langserver bash-language-server typescript-language-server tsc vscode-json-language-server eslint_d prettierd fixjson write-good)
npm_package_name=(pyright bash-language-server typescript-language-server typescript vscode-langservers-extracted eslint_d @fsouza/prettierd fixjson write-good)

for i in "${!command_name[@]}"; do
	if ! command -v "${command_name[$i]}" &>/dev/null; then
		npm install -g ${npm_package_name[$i]}
	else
		npm update -g ${npm_package_name[$i]}
	fi
done
