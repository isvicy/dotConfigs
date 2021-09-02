local utils = require("personal.utils")
local lsp_status = require("lsp-status")
lsp_status.register_progress()

-- local api = vim.api

local on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        hint_enable = true,
        handler_opts = {border = "shadow"}
    })
    lsp_status.on_attach(client, bufnr)
end

require'navigator'.setup({
    keymaps = {
        {key = "gd", func = "definition()"},
        {key = "<Leader>ga", func = "code_action()"}
    },
    lsp = {
        sumneko_lua = {
            sumneko_root_path = vim.fn.expand("$HOME") ..
                "/github/lua-language-server",
            sumneko_binary = vim.fn.expand("$HOME") ..
                "/github/lua-language-server/bin/" .. utils.get_os_for_lua_lsp() ..
                "/lua-language-server"
        },
        gopls = {
            on_attach = on_attach,
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                        fieldalignment = true,
                        nilness = true,
                        shadow = true,
                        unusedwrite = true
                    },
                    staticcheck = true,
                    usePlaceholders = false,
                    completeUnimported = true
                }
            }

        }
    }
})

-- highlight
--[[ api.nvim_command(
    "hi default LspReferenceRead cterm=bold gui=underline ctermbg=black guifg=none guibg=none")
api.nvim_command(
    "hi default LspReferenceText cterm=bold gui=underline ctermbg=black guifg=none guibg=none")
api.nvim_command(
    "hi default LspReferenceWrite cterm=bold gui=underline ctermbg=black guifg=none guibg=none") ]]
