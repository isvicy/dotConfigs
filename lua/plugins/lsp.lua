-- LSP Setup

local fn = vim.fn
local cmd = vim.cmd

local lsp = require 'lspconfig'

-- Bash-Language-Server
lsp.bashls.setup {filetypes = {"sh", "zsh", "bash"}}

-- Clangd
lsp.clangd.setup {cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },}

-- Json
lsp.jsonls.setup {}

-- Lua
lsp.sumneko_lua.setup {
    cmd = { "/Users/dennys/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/macOS/lua-language-server", "-E", "/Users/dennys/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua" },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- Pyls
lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}

-- Typescript
lsp.tsserver.setup{}

-- Design
cmd 'sign define LspDiagnosticsSignError text='
cmd 'sign define LspDiagnosticsSignWarning text=ﰣ'
cmd 'sign define LspDiagnosticsSignInformation text='
cmd 'sign define LspDiagnosticsSignHint text='


