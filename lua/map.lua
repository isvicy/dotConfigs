-- Mappings

local g = vim.g

-- Helper Function
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader
g['mapleader'] = ' '

-- Nvim
map('n', '<leader>h', '<C-W><C-H>')
map('n', '<leader>l', '<C-W><C-L>')
map('n', '<leader>k', '<C-W><C-K>')
map('n', '<leader>j', '<C-W><C-J>')
map('n', '<S-k>', '<C-u>')
map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'J', '<C-d>')
map('v', 'K', '<C-u>')
map('v', 'H', '^')
map('v', 'L', '$')
map('n', '<esc>', '<cmd>noh<CR>')
map('t', '<esc>', '<C-\\><C-n>')
map('n', 'ö', '<C-]>')
map('n', 'é', '<C-O>')
map('n', 'ü', ']s')
map('n', 'è', '[s')
map('n', '<leader>1', '<cmd>b1<CR>')
map('n', '<leader>2', '<cmd>b2<CR>')
map('n', '<leader>3', '<cmd>b3<CR>')
map('n', '<leader>4', '<cmd>b4<CR>')
map('n', '<leader>5', '<cmd>b5<CR>')
map('n', '<leader>6', '<cmd>b6<CR>')
map('n', 'ev', '<cmd>vsplit ~/.config/nvim/init.lua<CR>')
map('n', 'ss', '<cmd>w<CR>')
map('n', '£', '%')

-- lsp
map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('i', '<tab>', '<C-o><Plug>(completion_smart_tab)')

-- Telescope
map('n', '<C-p>', "<cmd>lua require'telescope'.extensions.fzf_writer.files()<CR>")
map('n', 'gr', "<cmd>lua require'telescope.builtin'.lsp_references()<CR>")
map('n', '<Leader>gw', "<cmd>lua require'telescope'.extensions.fzf_writer.staged_grep()<CR>")
map('n', '<leader>t', '<cmd>Telescope tags<CR>')
map('n', '<leader>b', '<cmd>Telescope buffers<CR>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
map('n', '<leader>ch', '<cmd>Telescope command_history<CR>')
map('n', '<leader>c', '<cmd>Telescope commands<CR>')
map('n', '<leader>g', '<cmd>Telescope git_commits<CR>')
map('n', '<leader>gs', '<cmd>Telescope git_status<CR>')
map('n', '<leader>gb', '<cmd>Telescope git_branches<CR>')
map('n', '<leader>rl', '<cmd>Telescope reloader<CR>')
map('n', '<leader>cc', "<cmd>lua require('personal.nvim_func').compile_run_cpp('sp', '20')<CR>")

-- Nvim-Tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- Undotree
map('n', '<leader>u', '<cmd>UndotreeToggle<CR>')

-- fugitive
map('n', '<leader>gs', '<cmd>G<CR>')
map('n', '<leader>gj', '<cmd>diffget //3<CR>')
map('n', '<leader>gf', '<cmd>diffget //2<CR>')


-- floatTerm
map('n', '<leader>nt', ':FloatermNew --width=0.9<CR>')

-- fzf
map('n', '<leader>p', '<cmd>Files<CR>')
map('n', '<leader>fw', ':Rg <C-R><C-W><CR>')

-- maximizer
map('n', '<leader>z', ':MaximizerToggle!<CR>')
