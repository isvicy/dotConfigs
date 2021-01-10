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
map('n', 'ev', '<cmd>vsplit ~/.config/nvim/init.lua<cr>')
map('n', 'ss', '<cmd>w<cr>')
map('n', '£', '%')

-- lsp
map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- Deoplete
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- Telescope
map('n', '<C-p>', '<cmd>Telescope fd<cr>')
map('n', '<leader>t', '<cmd>Telescope tags<cr>')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>ch', '<cmd>Telescope command_history<cr>')
map('n', '<leader>c', '<cmd>Telescope commands<cr>')
map('n', '<leader>g', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>rl', '<cmd>Telescope reloader<cr>')
map('n', '<leader>cc', "<cmd>lua require('personal.nvim_func').compile_run_cpp('sp', '20')<cr>")

-- Nvim-Tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

-- Undotree
map('n', '<leader>u', '<cmd>UndotreeToggle<cr>')

