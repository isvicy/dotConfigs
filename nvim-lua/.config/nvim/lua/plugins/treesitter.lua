-- nvim-treesitter
local set = vim.api.nvim_set_option

local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = {
        'bash', 'rust', 'lua', 'c', 'cpp', 'css', 'go', 'html', 'javascript',
        'json', 'python', 'typescript'
    },
    highlight = {enable = true},
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["as"] = "@class.outer",
                ["is"] = "@class.inner",
                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["cm"] = "@comment.outer",
                ["ss"] = "@statement.outer"
            }
        },
        move = {
            enable = true,
            goto_next_start = {
                ["nf"] = "@function.outer",
                ["ns"] = "@class.outer",
                ["nc"] = "@conditional.outer",
                ["nl"] = "@loop.outer",
                ["nb"] = "@block.outer"
            },
            goto_previous_start = {
                ["Nf"] = "@function.outer",
                ["Ns"] = "@class.outer",
                ["Nc"] = "@conditional.outer",
                ["Nl"] = "@loop.outer",
                ["Nb"] = "@block.outer"
            }
        },
        lsp_interop = {
            enable = true,
            peek_definition_code = {
                ["df"] = "@function.outer",
                ["dF"] = "@class.outer"
            }
        }
    }
}

set('foldexpr', 'nvim_treesitter#foldexpr()')
