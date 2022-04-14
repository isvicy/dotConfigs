-- Plugins Mappings
local utils = require("ky.personal.utils")

-- Personal
utils.map("n", "<leader>cc", "<cmd>lua require('personal.nvim_func').compile_run_cpp('sp', '20')<CR>")

-- Lsp
utils.map("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")

-- Telescope
utils.map("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files({hidden=true})<CR>")

-- Nvim-tree
utils.map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- fugitive
utils.map("n", "<leader>gs", "<cmd>G<CR>")
utils.map("n", "<leader>gj", "<cmd>diffget //3<CR>")
utils.map("n", "<leader>gf", "<cmd>diffget //2<CR>")

-- maximizer
utils.map("n", "<leader>z", ":MaximizerToggle!<CR>")

-- CtrlSF
utils.map("n", "<leader>rw", ":CtrlSF -hidden <C-R><C-W><CR>")

-- Vista
utils.map("n", "<C-l>", ":Vista!!<CR>")

-- OSCYank
utils.map("v", "<leader>c", ":OSCYank<CR>")

-- Copilot
vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
