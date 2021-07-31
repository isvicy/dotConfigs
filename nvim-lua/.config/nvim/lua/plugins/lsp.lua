-- LSP Setup
local fn = vim.fn
local cmd = vim.cmd
local lsp = require("lspconfig")
local lsp_status = require("lsp-status")
local null_ls = require("null-ls")
lsp_status.register_progress()

local on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        hint_enable = true,
        handler_opts = { border = "shadow" },
    })
    lsp_status.on_attach(client, bufnr)
end

-- Bash-Language-Server
lsp.bashls.setup({
    filetypes = { "sh", "zsh", "bash" },
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
})

-- Python pyright
lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
})

-- efm
lsp.efm.setup({
    filetypes = { "python" },
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
})

-- Json
lsp.jsonls.setup({ on_attach = on_attach, capabilities = lsp_status.capabilities })

-- Lua
local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

lsp.sumneko_lua.setup({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
})

-- Typescript
lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
})

-- Vue
lsp.vuels.setup({ on_attach = on_attach, capabilities = lsp_status.capabilities })

-- Rust
lsp.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
})

-- Golang
lsp.gopls.setup({
    cmd = { "gopls", "serve" },
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    settings = {
        gopls = {
            analyses = { unusedparams = true, nonewvars = true },
            staticcheck = true,
            usePlaceholders = false,
            completeUnimported = true,
        },
    },
})

-- ccls
lsp.ccls.setup({ on_attach = on_attach, capabilities = lsp_status.capabilities })

-- json
lsp.jsonls.setup({
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
            end,
        },
    },
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
})

-- ruby
lsp.solargraph.setup({
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    root_dir = lsp.util.root_pattern("Gemfile", ".git"),
    settings = { solargraph = { diagnostics = true } },
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
})

-- Null ls
null_ls.config({
    sources = {
        null_ls.builtins.formatting.stylua.with({
            args = {
                "--indent-type",
                "Spaces",
                "-",
            },
        }),
        null_ls.builtins.formatting.prettierd,
    },
})
lsp["null-ls"].setup({
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
})

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable underline, it's very annoying
    underline = false,
    virtual_text = false,
    -- Enable virtual text, override spacing to 4
    -- virtual_text = {spacing = 4},
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = true,
    update_in_insert = false,
})

-- Design
cmd("sign define LspDiagnosticsSignError text=")
cmd("sign define LspDiagnosticsSignWarning text=ﰣ")
cmd("sign define LspDiagnosticsSignInformation text=")
cmd("sign define LspDiagnosticsSignHint text=")

-- show line diagnostic
vim.api.nvim_command("autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })")
