-- LSP Setup

local fn = vim.fn
local cmd = vim.cmd

local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

local lsp = require 'lspconfig'
lsp.bashls.setup {filetypes = {"sh", "zsh", "bash"}}
lsp.clangd.setup {cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },}
lsp.jsonls.setup {}
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
lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}
lsp.tsserver.setup{}

cmd 'sign define LspDiagnosticsSignError text='
cmd 'sign define LspDiagnosticsSignWarning text=ﰣ'
cmd 'sign define LspDiagnosticsSignInformation text='
cmd 'sign define LspDiagnosticsSignHint text='


