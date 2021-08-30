local utils = require("personal.utils")

local api = vim.api

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
        }
    }
})

-- highlight
api.nvim_command(
    "hi default LspReferenceRead cterm=bold gui=underline ctermbg=black guifg=none guibg=none")
api.nvim_command(
    "hi default LspReferenceText cterm=bold gui=underline ctermbg=black guifg=none guibg=none")
api.nvim_command(
    "hi default LspReferenceWrite cterm=bold gui=underline ctermbg=black guifg=none guibg=none")
