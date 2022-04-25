local luadev = {}
local ok, l = pcall(require, "lua-dev")
if ok and l then
    luadev = l.setup({ library = { vimruntime = true, types = true, plugins = true } })
end

require('navigator').setup({
    default_mapping = true,
    lsp_installer = false,
    keymaps = {
        { key = "gd", func = "definition()" }, { key = "gr", func = "references()" },
        { key = "gh", func = "require('navigator.dochighlight').hi_symbol()" },
        { key = "<Leader>ra", mode = "n", func = "require('navigator.codelens').run_action()" },
        { key = "ga", mode = "n", func = "code_action()" }, { key = "ga", mode = "v", func = "range_code_action()" }
    },
    treesitter_analysis = true,
    transparency = 50,
    icons = {
        -- Code action
        code_action_icon = "🏏",
        -- Diagnostics
        diagnostic_head = '🐛',
        diagnostic_head_severity_1 = "🈲",
    },
    lsp = {
        disable_lsp = { "jedi_language_server", "pylsp" },
        format_on_save = true,
        sumneko_lua = luadev,
    }
})

local signature_cfg = {
    bind = true,
    hint_enable = true,
    handler_opts = { border = "shadow" },
    floating_window = false
}
require("lsp_signature").setup(signature_cfg)
