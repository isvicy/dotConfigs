-- Configs for Plugins
local g = vim.g

-- Vista
g["vista_default_executive"] = "nvim_lsp"

-- Toggleterm
require("toggleterm").setup({
    size = 20,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    persist_size = true,
    direction = "horizontal"
})

-- Vim-wiki
g["vimwiki_list"] = {{path = "~/vimwiki/", syntax = "markdown", ext = ".md"}}

-- BufferLine
require("bufferline").setup({
    options = {
        numbers = "buffer_id",
        diagnostic = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
        show_buffer_close_icons = false
    }
})

-- CtrlSF
g["ctrlsf_auto_focus"] = {at = "start"}
g["ctrlsf_position"] = "right"

-- Nvim-tree
require('nvim-tree').setup {
    auto_close = false,
    hijack_netrw = true,
    update_focused_file = {enable = true},
    view = {width = 30, height = 30, side = 'left', auto_resize = true},
    filters = {custom = {".git", "node_modules", ".cache"}}
}

-- Diffview
local cb = require("diffview.config").diffview_callback

require("diffview").setup({
    diff_binaries = false, -- Show diffs for binaries
    file_panel = {width = 35},
    key_bindings = {
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
        view = {
            ["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
            ["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
            ["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
            ["<leader>b"] = cb("toggle_files") -- Toggle the files panel.
        },
        file_panel = {
            ["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
            ["<down>"] = cb("next_entry"),
            ["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
            ["<up>"] = cb("prev_entry"),
            ["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
            ["o"] = cb("select_entry"),
            ["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
            ["<tab>"] = cb("select_next_entry"),
            ["<s-tab>"] = cb("select_prev_entry"),
            ["<leader>e"] = cb("focus_files"),
            ["<leader>b"] = cb("toggle_files")
        }
    }
})

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#0f191f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#080e11 gui=nocombine]]
require("indent_blankline").setup {
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = false,
}

-- LSP status
local lsp_status = require("lsp-status")
lsp_status.config({
    diagnostics = false,
    indicator_errors = "E",
    indicator_warnings = "W",
    indicator_info = "i",
    indicator_hint = "?",
    indicator_ok = "Ok",
    status_symbol = ""
})
lsp_status.register_progress()

-- Copilot
vim.g["copilot_no_tab_map"] = true
vim.g["copilot_assume_mapped"] = true
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = false,
  ["rust"] = true,
  ["c"] = true,
  ["c#"] = true,
  ["c++"] = true,
  ["go"] = true,
  ["python"] = true,
}


-- Theme
-- g["zenbones_darken_noncurrent_window"] = true
-- g["zenbones_lightness"] = "dim"
--[[ vim.api.nvim_command("hi GHListDark guifg=#333333")
vim.api.nvim_command("hi GHTextViewDark guifg=#333333") ]]

-- vim.cmd [[set background=dark]]
-- vim.cmd [[colorscheme forestbones]]
-- g["zenflesh"] = "warm"
-- g["zenflesh_lighten_noncurrent_window"] = true
-- vim.cmd[[colorscheme zenflesh]]
