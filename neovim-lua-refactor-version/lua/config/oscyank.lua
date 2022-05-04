local M = {}

function M.setup()
  require("utils").set_keymap("v", "<leader>c", ":OSCYank<CR>")
end

return M
