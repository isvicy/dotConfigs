-- Plugins Mappings
local utils = require("personal.utils")

-- lsp
utils.map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
utils.map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
utils.map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
utils.map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
utils.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
utils.map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
utils.map('n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
utils.map('i', '<tab>', '<C-o><Plug>(completion_smart_tab)')

-- Telescope
utils.map('n', '<C-p>',
          "<cmd>lua require'telescope'.extensions.fzf_writer.files()<CR>")
utils.map('n', 'gr', "<cmd>lua require'telescope.builtin'.lsp_references()<CR>")
utils.map('n', '<Leader>gw',
          "<cmd>lua require'telescope'.extensions.fzf_writer.staged_grep()<CR>")
utils.map('n', '<leader>t', '<cmd>Telescope tags<CR>')
utils.map('n', '<leader>b', '<cmd>Telescope buffers<CR>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
utils.map('n', '<leader>ch', '<cmd>Telescope command_history<CR>')
utils.map('n', '<leader>c', '<cmd>Telescope commands<CR>')
utils.map('n', '<leader>g', '<cmd>Telescope git_commits<CR>')
utils.map('n', '<leader>gs', '<cmd>Telescope git_status<CR>')
utils.map('n', '<leader>gb', '<cmd>Telescope git_branches<CR>')
utils.map('n', '<leader>rl', '<cmd>Telescope reloader<CR>')
utils.map('n', '<leader>cc',
          "<cmd>lua require('personal.nvim_func').compile_run_cpp('sp', '20')<CR>")

-- CHAD-Tree
utils.map('n', '<leader>e', '<cmd>CHADopen<CR>')

-- fugitive
utils.map('n', '<leader>gs', '<cmd>G<CR>')
utils.map('n', '<leader>gj', '<cmd>diffget //3<CR>')
utils.map('n', '<leader>gf', '<cmd>diffget //2<CR>')

-- floatTerm
utils.map('n', '<leader>nt', ':FloatermNew --width=0.9<CR>')

-- fzf
utils.map('n', '<leader>p', '<cmd>Files<CR>')
utils.map('n', '<leader>fw', ':Rg <C-R><C-W><CR>')

-- maximizer
utils.map('n', '<leader>z', ':MaximizerToggle!<CR>')
