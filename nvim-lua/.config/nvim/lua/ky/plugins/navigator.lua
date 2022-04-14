local path = require'nvim-lsp-installer.path'
local install_root_dir = path.concat {vim.fn.stdpath 'data', 'lsp_servers'}

local luadev = {}
local ok, l = pcall(require, "lua-dev")
if ok and l then
    local sumneko_dir = install_root_dir .. '/sumneko_lua/extension/server'
    luadev = l.setup({library = {vimruntime = true, types = true, plugins = true}})
    luadev.sumneko_root_path = sumneko_dir
    luadev.sumneko_binary = sumneko_dir .. '/bin/lua-language-server'
end

require('navigator').setup({
    default_mapping = true,
    lsp_installer = true,
    keymaps = {
        {key = "gd", func = "definition()"}, {key = "gr", func = "references()"},
        {key = "gh", func = "require('navigator.dochighlight').hi_symbol()"},
        {key = "<Leader>ra", mode = "n", func = "require('navigator.codelens').run_action()"},
        {key = "ga", mode = "n", func = "code_action()"}, {key = "ga", mode = "v", func = "range_code_action()"}
    },
    on_attach = function(_, bufnr)
        require("lsp_signature").on_attach({
            bind = true,
            hint_enable = true,
            handler_opts = {border = "shadow"},
            floating_window = false
        })

        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = {noremap = true, silent = true}

        buf_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        buf_set_keymap("v", "<Leader>rf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end,
    --[[ lsp = {
        format_on_save = false,
        sumneko_lua = luadev,
        gopls = {cmd = {install_root_dir .. "/go/gopls", "--remote=auto"}, usePlaceholders = false},
        efm = {cmd = {install_root_dir .. "/efm/efm-langserver"}, filetypes = {"python", "lua"}},
        pyright = {cmd = {install_root_dir .. "/python/node_modules/.bin/pyright-langserver", "--stdio"}},
        tsserver = {cmd = {install_root_dir .. "/tsserver/node_modules/.bin/typescript-language-server", "--stdio"}},
        rust_analyzer = {cmd = {install_root_dir .. "/rust/rust-analyzer"}}
    } ]]
})

