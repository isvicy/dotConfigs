local keymap = require("utils").set_keymap

keymap("n", "<leader>h", "<C-W><C-H>")
keymap("n", "<leader>l", "<C-W><C-L>")
keymap("n", "<leader>k", "<C-W><C-K>")
keymap("n", "<leader>j", "<C-W><C-J>")
keymap("n", "H", "^")
keymap("n", "L", "$")
keymap("v", "J", "<C-d>")
keymap("v", "K", "<C-u>")
keymap("v", "H", "^")
keymap("v", "L", "$")
keymap("n", "<esc>", "<cmd>noh<CR>")
keymap("t", "<esc>", "<C-\\><C-n>")
keymap("i", "<C-a>", "<C-o>0")
keymap("i", "<C-e>", "<C-o>$")
keymap("n", "Y", "y$")
-- center search
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "J", "mzJ`z")
-- breaking undo
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
-- moving text
keymap("n", "<leader>sj", ":m .+1<CR>==")
keymap("n", "<leader>sk", ":m .-2<CR>==")
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("i", "<c-j>", "<esc>:m .+1<CR>==i")
keymap("i", "<c-k>", "<esc>:m .-2<CR>==i")
-- paste last ting yanked, not deleted
keymap("n", "<leader>P", '"0P')
keymap("n", "<leader>p", '"0p')
-- write only if something is changed
keymap("n", "<leader>u", "<cmd>up<CR>")
-- make *  highlight current work
keymap("n", "*", ':execute "normal! *N"<cr>')
-- better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>")
keymap("n", "<Right>", ":vertical resize -1<CR>")
keymap("n", "<Up>", ":resize -1<CR>")
keymap("n", "<Down>", ":resize +1<CR>")
