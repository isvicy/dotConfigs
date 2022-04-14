-- Gitsigns
local gs = require("gitsigns")
gs.setup({
    signs = {
        add = {hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr"},
        change = {hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr"},
        delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
        topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
    },
    numhl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

        ["n ]c"] = {expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
        ["n [c"] = {expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

        ["n <leader>ss"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>su"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>sr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>sp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>sb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
    },
    watch_index = {interval = 1000},
    sign_priority = 6,
    status_formatter = nil -- Use default
})
