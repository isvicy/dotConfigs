local lualine = require("lualine")

-- Color table for highlights
local colors = {
    bg = "#1c2023",
    fg = "#eaebed",
    section_bg = "#1c2023",
    yellow = "#ebcb8b",
    cyan = "#96b5b4",
    green = "#a3be8c",
    orange = "#ebcb8b",
    violet = "#a9a1e1",
    magenta = "#b48ead",
    blue = "#81a1c1",
    red = "#bf616a",
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_v = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left({
    function()
        return "▊"
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    left_padding = 0, -- We don't need space before this
})

ins_left({
    -- mode component
    function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.blue,
            i = colors.red,
            v = colors.magenta,
            V = colors.magenta,
            [""] = colors.magenta,
            c = colors.orange,
            R = colors.red,
            t = colors.yellow,
            no = colors.cyan,
            s = colors.green,
            S = colors.green,
            ic = colors.yellow,
            r = colors.yellow,
            Rv = colors.yellow,
            rm = colors.yellow,
            ["r?"] = colors.yellow,
            ["!"] = colors.yellow,
            [""] = colors.yellow,
            [""] = colors.orange,
            cv = colors.red,
            ce = colors.red,
        }

        local alias = {
            n = "NORMAL",
            i = "INSERT",
            v = "VISUAL",
            [""] = "V-BLOCK",
            V = "VISUAL",
            c = "COMMAND",
            R = "REPLACE",
            t = "TERMINAL",
            s = "SELECT",
            S = "SELECT",
            ic = "COMMAND-LINE",
            Rv = "VIRTUAL",
            rm = "--MORE",
            r = "HIT-ENTER",
            ["r?"] = ":CONFIRM",
            ["!"] = "SHELL",
            [""] = "EMPTY",
        }
        vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
        return " " .. alias[vim.fn.mode()]
    end,
    color = "LualineMode",
    left_padding = 0,
})

ins_left({
    "filename",
    condition = conditions.buffer_not_empty,
    path = 1,
    color = { fg = colors.magenta, gui = "bold" },
})

ins_left({
    "diff",
    symbols = { added = " ", modified = " ", removed = " " },
    color_added = colors.green,
    color_modified = colors.orange,
    color_removed = colors.red,
    condition = conditions.hide_in_width,
})

ins_left({
    "diagnostics",
    sources = { "nvim_lsp" },
    symbols = { error = " ", warn = " ", info = " " },
    color_error = colors.red,
    color_warn = colors.yellow,
    color_info = colors.cyan,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
    function()
        return "%="
    end,
})

ins_left({
    -- Lsp server name
    function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = " LSP:",
    color = { fg = "#ffffff", gui = "bold" },
})

ins_left({
    function()
        local status = require("lsp-status").status()
        if string.find(status, "Error") and string.len(status) > 40 then
            return status.sub(status, 0, 40)
        end
        return status
    end,
})

ins_right({
    "branch",
    icon = "",
    condition = conditions.check_git_workspace,
    color = { fg = colors.violet, gui = "bold" },
})

ins_right({ "filetype", colored = true })

ins_right({ "location" })

ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

ins_right({
    -- filesize component
    function()
        local function format_file_size(file)
            local size = vim.fn.getfsize(file)
            if size <= 0 then
                return ""
            end
            local sufixes = { "b", "k", "m", "g" }
            local i = 1
            while size > 1024 do
                size = size / 1024
                i = i + 1
            end
            return string.format("%.1f%s", size, sufixes[i])
        end
        local file = vim.fn.expand("%:p")
        if string.len(file) == 0 then
            return ""
        end
        return format_file_size(file)
    end,
    condition = conditions.buffer_not_empty,
})

ins_right({
    function()
        return "▊"
    end,
    color = { fg = colors.blue },
    right_padding = 0,
})

lualine.setup(config)
