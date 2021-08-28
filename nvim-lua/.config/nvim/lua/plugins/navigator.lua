local api = vim.api

require'navigator'.setup({
    keymaps = {
        {key = "gd", func = "definition()"},
        {key = "<Leader>ga", func = "code_action()"},
    },
    lsp = {
        sumneko_lua = {
            sumneko_root_path = vim.fn.expand("$HOME") .. "/github/lua-language-server",
            sumneko_binary = vim.fn.expand("$HOME") .. "/github/lua-language-server/bin/macOS/lua-language-server",
        },
    }
})

-- highlight
api.nvim_command("hi default LspReferenceRead cterm=bold gui=Bold ctermbg=yellow guifg=DarkGray guibg=Black")
api.nvim_command("hi default LspReferenceText cterm=bold gui=Bold ctermbg=yellow guifg=DarkCyan guibg=Black")
api.nvim_command("hi default LspReferenceWrite cterm=bold gui=Bold ctermbg=yellow guifg=DarkCyan guibg=Black")
