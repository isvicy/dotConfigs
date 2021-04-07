-- Configs for Plugins
--
local g = vim.g
local o = vim.o

-- Colorizer
require'colorizer'.setup()

-- Vista
g['vista_default_executive'] = 'nvim_lsp'

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
        nvim_lua = true,
        ultisnips = true
    }
}

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
    code_action_prompt = {
        enable = false,
        sign = false,
        sign_priority = 20,
        virtual_text = false
    }
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

-- Nvim-tree
g['nvim_tree_ignore'] = {'.git', 'node_modules', '.cache'}
g['nvim_tree_auto_close'] = 1
g['nvim_tree_follow'] = 1
