-- nvim-treesitter
local set = vim.api.nvim_set_option

-- neorg parser config, see https://github.com/nvim-neorg/neorg
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = {"src/parser.c", "src/scanner.cc"},
        branch = "main"
    }
}

local ts = require("nvim-treesitter.configs")

ts.setup({
    ensure_installed = {
        "bash", "rust", "lua", "c", "cpp", "css", "go", "html", "javascript", "json", "python", "typescript", "ruby",
        "norg" -- https://github.com/nvim-neorg/neorg
    },
    highlight = {enable = true},
    -- nvim-ts-context-commentstring
    context_commentstring = {enable = true}
})

set("foldexpr", "nvim_treesitter#foldexpr()")
