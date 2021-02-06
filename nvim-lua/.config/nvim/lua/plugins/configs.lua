-- Configs for Plugins
--
local g = vim.g
local o = vim.o
local cmd = vim.cmd

-- Colorizer
require'colorizer'.setup()

-- Vista
g['vista_default_executive'] = 'nvim-lsp'

-- Fzf_lsp
require('fzf_lsp').setup()
g['fzf_lsp_layout'] = {window = {width = 0.9, height = 0.6, highlight = 'Todo'}}
g['fzf_preview_window'] = {'up:62%', 'ctrl-/'}

-- Nvim-compe
o.completeopt = "menu,menuone,noselect"
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    allow_prefix_unmatch = false,

    source = {
        path = true,
        buffer = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true
    }
}

-- Nvim-lightbulb
cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- Toggleterm
require"toggleterm".setup {
    size = 20,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    persist_size = true,
    direction = 'horizontal'
}

-- Vim-wiki
g['vimwiki_list'] = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}}

-- LSP saga
require'lspsaga'.init_lsp_saga {
    use_saga_diagnostic_sign = false,
    max_diag_msg_width = 80
}

-- BufferLine
require'bufferline'.setup {
    options = {
        numbers = "buffer_id",
        diagnostic = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
        show_buffer_close_icons = false
    }
}

-- CtrlSF
g['ctrlsf_auto_focus'] = {at = "start"}
g['ctrlsf_position'] = 'right'
