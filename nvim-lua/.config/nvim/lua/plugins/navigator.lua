local api = vim.api

-- Lua
local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.expand("$HOME") .. "/github/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

require'navigator'.setup({
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({bind = true, hint_enable = true, handler_opts = {border = "shadow"}})
    end,
    lsp = {
        gopls = {
            usePlaceholders = false,
        },
        sumneko_lua = {
            sumneko_root_path = sumneko_root_path,
            sumneko_binary = sumneko_binary,
        },
    }
})

api.nvim_command(
    "hi default LspReferenceRead cterm=bold gui=Bold ctermbg=yellow guifg=none guibg=Black")
api.nvim_command(
    "hi default LspReferenceText cterm=bold gui=Bold ctermbg=yellow guifg=none guibg=Black")
api.nvim_command(
    "hi default LspReferenceWrite cterm=bold gui=Bold ctermbg=yellow guifg=none guibg=Black")
api.nvim_command(
    "hi default GHListHl guifg=#eceff4 ctermfg=189 guibg=#2d3439 ctermbg=238 gui=bold,italic cterm=bold,italic")
