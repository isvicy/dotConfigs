#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x


# python
if ! command -v pyright-langserver &> /dev/null
then
    npm install -g pyright
else
    npm update -g pyright
fi

# bashls
if ! command -v bash-language-server &> /dev/null
then
    npm install -g bash-language-server
else
    npm update -g bash-language-server
fi

# tsserver
if ! command -v typescript-language-server &> /dev/null
then
    npm install -g typescript typescript-language-server
else
    npm update -g typescript typescript-language-server
fi

# json
if ! command -v vscode-json-language-server &> /dev/null
then
    npm install -g vscode-langservers-extracted
else
    npm update -g vscode-langservers-extracted
fi
