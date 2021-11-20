-- Plugins Mappings
local utils = require("personal.utils")

-- Personal
utils.map("n", "<leader>cc", "<cmd>lua require('personal.nvim_func').compile_run_cpp('sp', '20')<CR>")

-- Lsp
utils.map("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")

-- Telescope
utils.map("n", "<C-l>", "<cmd>lua require'telescope.builtin'.find_files({hidden=true})<CR>")

-- Nvim-tree
utils.map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- fugitive
utils.map("n", "<leader>gs", "<cmd>G<CR>")
utils.map("n", "<leader>gj", "<cmd>diffget //3<CR>")
utils.map("n", "<leader>gf", "<cmd>diffget //2<CR>")

-- maximizer
utils.map("n", "<leader>z", ":MaximizerToggle!<CR>")

-- CtrlSF
utils.map("n", "<leader>rw", ":CtrlSF <C-R><C-W><CR>")

-- Vista
utils.map("n", "<leader>t", ":Vista!!<CR>")

-- goto-preview
utils.map("n", "gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
utils.map("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
utils.map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>")

-- action-menu
utils.map("n", "ga", "<cmd>CodeActionMenu<CR>")

