#!/bin/bash

find ./ -name "*.lua" | xargs lua-format -i -v

exit 0
