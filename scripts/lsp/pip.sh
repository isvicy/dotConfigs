#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x

# python formatter
python3 -m pip install black
python3 -m pip install isort
python3 -m pip install flake8
