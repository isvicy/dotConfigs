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
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

-- wait for solution by nlua

-- local custom_nvim_lspconfig_attach = function(...) end
-- require('nlua.lsp.nvim').setup(require('lspconfig'), {
--     on_attach = custom_nvim_lspconfig_attach
-- })


-- Typescript Language Server
lsp.tsserver.setup{}

-- Pyls
lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}

-- Design
cmd 'sign define LspDiagnosticsSignError text='
cmd 'sign define LspDiagnosticsSignWarning text=ﰣ'
cmd 'sign define LspDiagnosticsSignInformation text='
cmd 'sign define LspDiagnosticsSignHint text='


