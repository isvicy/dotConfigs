local lsp = require("lspconfig")
local lsp_status = require("lsp-status")
local null_ls = require("null-ls")
local utils = require("personal.utils")

lsp_status.register_progress()

require("navigator").setup({
    keymaps = {
        { key = "gd", func = "definition()" },
        { key = "ga", func = "code_action()" },
    },
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
            bind = true,
            hint_enable = true,
            handler_opts = { border = "shadow" },
        })
        lsp_status.on_attach(client, bufnr)
    end,
    lsp = {
        sumneko_lua = {
            sumneko_root_path = vim.fn.expand("$HOME") .. "/github/lua-language-server",
            sumneko_binary = vim.fn.expand("$HOME")
                .. "/github/lua-language-server/bin/"
                .. utils.get_os_for_lua_lsp()
                .. "/lua-language-server",
        },
        tsserver = {
            on_attach = function(client)
                client.resolved_capabilities.document_formatting = false
            end,
        },
        gopls = {
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                        fieldalignment = true,
                        nilness = true,
                        shadow = true,
                        unusedwrite = true,
                    },
                    staticcheck = true,
                    usePlaceholders = false,
                    completeUnimported = true,
                },
            },
        },
    },
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
        null_ls.builtins.formatting.prettierd.with({
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "css",
                "html",
                "json",
                "yaml",
                "markdown",
                "vimwiki",
            },
        }),
    },
})
lsp["null-ls"].setup({
    capabilities = lsp_status.capabilities,
})
