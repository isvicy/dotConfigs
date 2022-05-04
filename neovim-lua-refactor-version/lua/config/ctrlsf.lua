local M = {}

local function keymaps()
  local keymap = require("utils").set_keymap
  keymap("n", "<leader>rw", ":CtrlSF -hidden <C-R><C-W><CR>")
end

function M.setup()
  local g = vim.g
  g["ctrlsf_auto_focus"] = { at = "start" }
  g["ctrlsf_position"] = "right"

  keymaps()
end

return M
