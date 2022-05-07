local config = {
  options = { section_separators = { "", "" }, component_separators = { "", "" }, theme = "auto" },
  sections = { lualine_c = { { "filename", file_status = true, path = 1 } } },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

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
    local client_name = ""
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        client_name = client_name ~= "" and (client_name .. "," .. client.name) or (client_name .. client.name)
      end
    end
    if client_name ~= "" then
      return client_name
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "#000000", gui = "bold" },
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

require("lualine").setup(config)
