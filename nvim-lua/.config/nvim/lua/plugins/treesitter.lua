-- nvim-treesitter
local set = vim.api.nvim_set_option

local ts = require("nvim-treesitter.configs")

ts.setup({
    ensure_installed = {
        "bash", "rust", "lua", "c", "cpp", "css", "go", "html", "javascript", "json", "python", "typescript", "ruby",
    },
    highlight = {enable = true},
    -- nvim-ts-context-commentstring
    context_commentstring = {enable = true}
})

set("foldexpr", "nvim_treesitter#foldexpr()")
