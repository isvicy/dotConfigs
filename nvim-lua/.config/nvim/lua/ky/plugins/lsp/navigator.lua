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
    on_attach = function(client, bufnr)
        if not pcall(require, "lsp-status") then
            return
        end
        local lsp_status = require("lsp-status")
        lsp_status.on_attach(client)
    end,
    lsp = {
        disable_lsp = { "jedi_language_server", "pylsp", "graphql-lsp", "deno", "ngserver" },
        format_on_save = false,
        tsserver = {
            init_options = require("nvim-lsp-ts-utils").init_options,
            on_attach = function(client, bufnr) -- on_attach for gopls
                -- use null-ls for file format
                client.resolved_capabilities.document_formatting = false

                local ts_utils = require("nvim-lsp-ts-utils")
                ts_utils.setup({})
                ts_utils.setup_client(client)
                local opts = { silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>gs", ":TSLspOrganize<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>gr", ":TSLspRenameFile<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>gi", ":TSLspImportAll<CR>", opts)
            end,

        },
    }
})

local signature_cfg = {
    bind = true,
    hint_enable = true,
    handler_opts = { border = "shadow" },
    floating_window = false
}
require("lsp_signature").setup(signature_cfg)
