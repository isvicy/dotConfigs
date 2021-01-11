-- LSP Setup

local fn = vim.fn
local cmd = vim.cmd

local lsp = require 'lspconfig'
local completion = require 'completion'

-- Bash-Language-Server
lsp.bashls.setup {filetypes = {"sh", "zsh", "bash"}}

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

lsp.sumneko_lua.setup {
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
  on_attach=completion.on_attach,
}

-- wait for solution by nlua

-- local custom_nvim_lspconfig_attach = function(...) end
-- require('nlua.lsp.nvim').setup(require('lspconfig'), {
--     on_attach = custom_nvim_lspconfig_attach
-- })


-- Typescript
lsp.tsserver.setup{
  on_attach=completion.on_attach,
}

-- Python
lsp.pyls.setup({
    enable = true,
    root_dir = lsp.util.root_pattern('.git', fn.getcwd()),
    plugins = {
    pyls_mypy = {
        enabled = true,
        live_mode = false
        }
    },
    on_attach=completion.on_attach,
})

-- Rust
lsp.rust_analyzer.setup{
    on_attach=completion.on_attach,
}

-- Golang
lsp.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                nonewvars = true,
            },
            staticcheck = true,
            usePlaceholders = false,
            completeUnimported= true
        },
    },
    on_attach=completion.on_attach,
}

--ccls
lsp.ccls.setup{
  on_attach=completion.on_attach,
}

-- texlab
lsp.texlab.setup{
  on_attach=completion.on_attach,
}

-- json
lsp.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

-- Design
cmd 'sign define LspDiagnosticsSignError text='
cmd 'sign define LspDiagnosticsSignWarning text=ﰣ'
cmd 'sign define LspDiagnosticsSignInformation text='
cmd 'sign define LspDiagnosticsSignHint text='


