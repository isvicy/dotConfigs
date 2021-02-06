-- Plugins Mappings
local utils = require("personal.utils")

-- Personal
utils.map('n', '<leader>cc',
          "<cmd>lua require('personal.nvim_func').compile_run_cpp('sp', '20')<CR>")

-- Programming related map related with lsp or telescope
-- lsp
utils.map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
utils.map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
utils.map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
-- Telescope
utils.map('n', '<C-p>',
          "<cmd>lua require'telescope.builtin'.find_files({hidden=true})<CR>")
utils.map('n', 'gtr', "<cmd>lua require'telescope.builtin'.lsp_references()<CR>")
utils.map('n', '<Leader>gw',
          "<cmd>lua require'telescope.builtin'.live_grep()<CR>")
-- lsp saga
utils.map('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")
utils.map('n', 'gd',
          "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>")
utils.map('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>")
utils.map('n', 'gs',
          "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
utils.map('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
utils.map('n', '<C-b>',
          "<cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>")
utils.map('n', '<C-f>',
          "<cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>")
utils.map('n', 'ga', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
utils.map('v', 'ga',
          "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>")

-- Telescope
utils.map('n', '<leader>t', '<cmd>Telescope tags<CR>')
utils.map('n', '<leader>b', '<cmd>Telescope buffers<CR>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
utils.map('n', '<leader>ch', '<cmd>Telescope command_history<CR>')
utils.map('n', '<leader>c', '<cmd>Telescope commands<CR>')
utils.map('n', '<leader>g', '<cmd>Telescope git_commits<CR>')
utils.map('n', '<leader>ts', '<cmd>Telescope git_status<CR>')
utils.map('n', '<leader>gb', '<cmd>Telescope git_branches<CR>')
utils.map('n', '<leader>rl', '<cmd>Telescope reloader<CR>')

-- CHAD-Tree
utils.map('n', '<leader>e', '<cmd>CHADopen<CR>')

-- fugitive
utils.map('n', '<leader>gs', '<cmd>G<CR>')
utils.map('n', '<leader>gj', '<cmd>diffget //3<CR>')
utils.map('n', '<leader>gf', '<cmd>diffget //2<CR>')

-- floatTerm
utils.map('n', '<leader>nt', ':FloatermNew --width=0.9<CR>')

-- maximizer
utils.map('n', '<leader>z', ':MaximizerToggle!<CR>')

-- Nvim-compe
utils.map('i', '<CR>', "compe#confirm(lexima#expand('<LT>CR>', 'i'))",
          {expr = true})
