-- LSP Setup

local fn = vim.fn
local cmd = vim.cmd

local lsp = require 'lspconfig'
local nlua = require 'nlua.lsp.nvim'

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
local custom_nvim_lspconfig_attach = function(...) end
require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_attach = custom_nvim_lspconfig_attach
})


-- Typescript Language Server
lsp.tsserver.setup{}

-- Pyls
lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}

-- Design
cmd 'sign define LspDiagnosticsSignError text='
cmd 'sign define LspDiagnosticsSignWarning text=ﰣ'
cmd 'sign define LspDiagnosticsSignInformation text='
cmd 'sign define LspDiagnosticsSignHint text='


