local M = {}

local function keymaps(client, bufnr)
  local keymap = require("utils").set_keymap
  local buf_keymap = require("utils").buf_set_keymap

  buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  buf_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>")
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>")
end

function M.setup(client, bufnr)
  keymaps(client, bufnr)
end

return M
