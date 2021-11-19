local utils = require("personal/utils")
local lsp_installer = require("nvim-lsp-installer")

local lspinstall_dir = vim.fn.stdpath('data') .. '/lsp_servers'

local luadev = {}
local ok, l = pcall(require, "lua-dev")
if ok and l then
    local sumneko_dir = lspinstall_dir .. '/sumneko_lua/extension/server'
    luadev = l.setup({library = {vimruntime = true, types = true, plugins = true}})
    luadev.sumneko_root_path = sumneko_dir
    luadev.sumneko_binary = sumneko_dir .. '/bin/' .. utils.get_system_name() .. '/lua-language-server'
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == "sumneko_lua" then
        opts = luadev
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
