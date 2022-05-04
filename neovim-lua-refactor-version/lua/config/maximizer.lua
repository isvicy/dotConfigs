local M = {}

function M.setup()
  require("utils").set_keymap("n", "<leader>z", ":MaximizerToggle!<CR>")
end

return M
