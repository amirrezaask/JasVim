vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "Q", "<NOP>")

vim.keymap.set("n", "{", ":cnext<CR>")
vim.keymap.set("n", "}", ":cprev<CR>")

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<CR>", [[ {-> v:hlsearch ? ':nohl<CR>' : '<CR>'}() ]], { expr = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("t", "kj", "<C-\\><C-n>")

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")

vim.keymap.set({ "n", "t" }, "<C-,>", "<cmd>tabprev<CR>")
vim.keymap.set({ "n", "t" }, "<C-.>", "<cmd>tabnext<CR>")
vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>tabnew<CR>")

vim.keymap.set("n", "<leader>.", "<cmd>Explore<CR>")

-- Easier split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Easier split resizing
vim.keymap.set("n", "<A-l>", "<C-w><")
vim.keymap.set("n", "<A-h>", "<C-w>>")
vim.keymap.set("n", "<A-j>", "<C-w>-")
vim.keymap.set("n", "<A-k>", "<C-w>+")

vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w><")
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>>")
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>-")
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>+")
