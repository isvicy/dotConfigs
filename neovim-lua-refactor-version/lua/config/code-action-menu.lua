local M = {}

local function keymaps()
  local keymap = require("utils").set_keymap
  keymap("n", "gma", "<cmd>CodeActionMenu<CR>")
  keymap("v", "gma", "<cmd>CodeActionMenu<CR>")
end

function M.setup()
  keymaps()
end

return M
