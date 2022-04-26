-- nvim-treesitter
local set = vim.api.nvim_set_option

local ts = require("nvim-treesitter.configs")

ts.setup({
    ensure_installed = {
        "bash", "rust", "lua", "c", "cpp", "css", "go", "html", "javascript", "json", "python", "typescript", "ruby"
    },
    highlight = { enable = true },
    -- nvim-ts-context-commentstring
    context_commentstring = { enable = true },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
            goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
            goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
            goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" }
        }
    }

})

set("foldexpr", "nvim_treesitter#foldexpr()")
