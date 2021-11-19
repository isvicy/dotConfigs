--- In lsp attach function
local utils = require("personal/utils")

utils.map("n", "gr", "<cmd>Lspsaga lsp_finder<cr>")
utils.map("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>")
utils.map("n", "<leader>rn", "<cmd>Lspsaga rename<cr>")
utils.map("n", "ga", "<cmd>Lspsaga code_action<cr>")
utils.map("x", "<leader>ga", ":<c-u>Lspsaga range_code_action<cr>")
utils.map("n", "K",  "<cmd>Lspsaga hover_doc<cr>")
utils.map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>")
utils.map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
utils.map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")

