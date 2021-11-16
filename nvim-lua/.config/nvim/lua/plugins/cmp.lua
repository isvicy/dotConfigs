local cmp = require("cmp")
local compare = require("cmp.config.compare")
local types = require("cmp.types")
local luasnip = require("luasnip")

local WIDE_HEIGHT = 40

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    completion = {
        autocomplete = {types.cmp.TriggerEvent.TextChanged},
        completeopt = "menu,menuone,noselect",
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1,
        get_trigger_characters = function(trigger_characters) return trigger_characters end
    },

    snippet = {expand = function(args) require("luasnip").lsp_expand(args.body) end},

    preselect = types.cmp.PreselectMode.Item,

    documentation = {
        border = {"", "", "", " ", "", "", "", " "},
        winhighlight = "NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
        maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
        maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines))
    },

    confirmation = {
        default_behavior = types.cmp.ConfirmBehavior.Insert,
        get_commit_characters = function(commit_characters) return commit_characters end
    },

    sorting = {
        priority_weight = 2,
        comparators = {
            compare.offset, compare.exact, compare.score, compare.kind, compare.sort_text, compare.length, compare.order
        }
    },

    event = {},

    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    },

    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu =
                ({buffer = "[Buffer]", nvim_lsp = "[LSP]", luasnip = "[LuaSnip]", nvim_lua = "[Lua]"})[entry.source.name]
            return vim_item
        end
    },

    experimental = {ghost_text = false},

    sources = {
        {name = "buffer", keyword_length = 4, max_item_count = 4}, {name = "nvim_lsp"}, {name = "nvim_lua"},
        {name = "calc"}, {name = "path"}, {name = "luasnip", max_item_count = 4},
        {name = 'look', keyword_length = 4, max_item_count = 4}
    }
})

-- snippet
require("luasnip/loaders/from_vscode").lazy_load()
vim.api.nvim_set_keymap('i', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>', {})
vim.api.nvim_set_keymap('i', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>', {})
vim.api.nvim_set_keymap('s', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>', {})
vim.api.nvim_set_keymap('s', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>', {})
