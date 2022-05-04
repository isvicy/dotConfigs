local M = {}

function M.setup()
  vim.g["vista_default_executive"] = "nvim_lsp"

  require("utils").set_keymap("n", "<C-l>", ":Vista!!<CR>")
end

return M
