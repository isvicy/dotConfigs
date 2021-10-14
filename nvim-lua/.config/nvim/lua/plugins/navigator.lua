local lspinstall_dir = vim.fn.stdpath('data') .. '/lsp_servers'

local luadev = {}
local ok, l = pcall(require, "lua-dev")
if ok and l then
    local sumneko_dir = lspinstall_dir .. '/sumneko_lua/extension/server'
    luadev = l.setup({library = {vimruntime = true, types = true, plugins = true}})
    luadev.sumneko_root_path = sumneko_dir
    luadev.sumneko_binary = sumneko_dir .. '/bin/Linux/lua-language-server'
end

require('navigator').setup({
    default_mapping = true, -- set to false if you will remap every key
    keymaps = {{key = "gd", func = "definition()"}}, -- a list of key maps
    lsp = {
        sumneko_lua = luadev,
        gopls = {cmd = {lspinstall_dir .. "/go/gopls", "--remote=auto"}},
        efm = {cmd = {lspinstall_dir .. "/efm/efm-langserver"}, filetypes = {"python", "lua"}},
        pyright = {cmd = {lspinstall_dir .. "/python/node_modules/.bin/pyright-langserver", "--stdio"}},
        tsserver = {cmd = {lspinstall_dir .. "/tsserver/node_modules/.bin/typescript-language-server", "--stdio"}}
    }
})
