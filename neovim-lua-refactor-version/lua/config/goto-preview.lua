local M = {}

local function keymaps()
  local keymap = require("utils").set_keymap
  keymap("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
  keymap("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
  keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>")
  --  Only set if you have telescope installed
  keymap("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>")
end

function M.setup()
  require("goto-preview").setup({})
  keymaps()
end

return M
