local map = vim.keymap.set

map('n', '<Esc>', ':noh<CR>', { desc = 'Clear search highlight', silent = true })
-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate window right" })

-- Resize windows with arrow keys
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window smaller vertically" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window larger vertically" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window smaller horizontally" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window larger horizontally" })

-- Move lines up and down
-- map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
-- map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
