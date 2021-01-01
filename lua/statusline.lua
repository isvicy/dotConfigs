local gl = require('galaxyline')
package.path = "/Users/dennys/.config/nvim/nightly/utils.lua"
local utils = require('utils')

local gls = gl.section
gl.short_line_list = { 'defx', 'packager', 'vista' }

-- Colors
local colors = {
  bg = '#1c2023',
  fg = '#eaebed',
  section_bg = '#1c2023',
  yellow = '#ebcb8b',
  cyan = '#96b5b4',
  green = '#a3be8c',
  orange = '#ebcb8b',
  magenta = '#b48ead',
  blue = '#96b5b4',
  red = '#bf616a'
}

-- Local helper functions
local buffer_not_empty = function()
  return not utils.is_buffer_empty()
end

local checkwidth = function()
  return utils.has_width_gt(40) and buffer_not_empty()
end

local function file_readonly()
  if vim.bo.filetype == 'help' then
    return ''
  end
  if vim.bo.readonly == true then
    return " "
  end
  return ''
end

function string:split(delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end

local get_current_file_path = function()

  local file = vim.fn.expand('%:t')
  local path = vim.fn.expand('%:p:h')
  local git_dir = require('galaxyline.provider_vcs').get_git_dir(path)
  local home = os.getenv( "HOME" )

  if git_dir == nil and string.match(path, home) then path = "~" .. string.gsub(path, home, "") end
  if git_dir ~= nil then
      local del_table = string.split(git_dir, "/")
      local len = table.maxn(del_table)
      del_table[len] = nil
      del_table[len - 1] = nil
      local del_str = table.concat(del_table, "/") .. "/"
      path = string.gsub(path, del_str, "")
  end

  if vim.fn.empty(file) == 1 then return '' end
  if string.len(file_readonly()) ~= 0 then
    return path .. "/" .. file .. file_readonly()
  end
  if vim.bo.modifiable then
    if vim.bo.modified then
      return path .. "/" .. file .. '  '
    end
    end
  return path .. "/" .. file .. ' '
  end

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.red,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
    t = colors.yellow,
    no = colors.cyan,
    s = colors.green,
    S = colors.green,
    ic = colors.yellow,
    r = colors.yellow,
    Rv = colors.yellow,
    rm = colors.yellow,
    ['r?'] = colors.yellow,
    ['!'] = colors.yellow
  }

  return mode_colors[vim.fn.mode()]
end

-- -- Left side
gls.left[1] = {
  FirstElement = {
    provider = function() return '  ' end,
    highlight = { colors.cyan, colors.section_bg }
  },
}
gls.left[2] = {
  ViMode = {
      provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v ='VISUAL',
        ic  = 'COMMAND-LINE',
        ['r?'] = ':CONFIRM',
        rm = '--MORE',
        R  = 'REPLACE',
        Rv = 'VIRTUAL',
        s  = 'SELECT',
        S  = 'SELECT',
        ['r']  = 'HIT-ENTER',
        [''] = 'SELECT',
        t  = 'TERMINAL',
        ['!']  = 'SHELL',
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color())
    return alias[vim.fn.mode()]..' '
    end,
    highlight = { colors.bg, colors.bg },
    separator = " ",
    separator_highlight = {colors.bg, colors.section_bg},
  },
}
gls.left[3] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.red,colors.bg},
  }
}
gls.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = " ",
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.fg,colors.bg},
  }
}
gls.left[5] = {
  FileName = {
    provider = get_current_file_path,
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg},
  }
}


gls.left[6] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.green, colors.bg },
  }
}
gls.left[7] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.orange, colors.bg },
  }
}
gls.left[8] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.red,colors.bg },
  }
}

-- Right side
gls.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ',
    highlight = {colors.red,colors.section_bg}
  }
}
gls.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = 'ﰣ ',
    separator = ' ',
    highlight = {colors.orange,colors.section_bg},
  }
}
gls.right[3] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = ' ',
    highlight = {colors.blue,colors.section_bg},
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}

gls.right[4]= {
  FileFormat = {
    provider = function() return vim.bo.filetype end,
    highlight = { colors.fg,colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg,colors.bg },
  }
}
gls.right[5] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
    separator = ' ',
  },
}

gls.right[6] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.section_bg },
  },
}

gls.right[7] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.section_bg },
  },
}

-- Short status line

gls.short_line_left[1] = {
  BufferIcon = {
    provider= 'FileName',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}
gls.short_line_right[1] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}

gls.short_line_right[2] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
    separator = ' ',
  },
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()




