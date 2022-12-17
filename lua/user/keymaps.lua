vim.g.mapleader = " "

local function nnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true })
  vim.keymap.set("n", lhs, rhs, opts)
end

local function inoremap(lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true })
  vim.keymap.set("i", lhs, rhs, opts)
end

local function vnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true })
  vim.keymap.set("v", lhs, rhs, opts)
end

local function tnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true })
  vim.keymap.set("t", lhs, rhs, opts)
end

local set = vim.keymap.set

vim.keymap.nnoremap = nnoremap
vim.keymap.inoremap = inoremap
vim.keymap.tnoremap = tnoremap
vim.keymap.vnoremap = vnoremap

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("Q", "<NOP>")

nnoremap("{", ":cnext<CR>")
nnoremap("}", ":cprev<CR>")

nnoremap("Y", "y$")

nnoremap("n", "nzz")
nnoremap("N", "Nzz")

nnoremap("j", "gj")
nnoremap("k", "gk")

nnoremap("<CR>", [[ {-> v:hlsearch ? ':nohl<CR>' : '<CR>'}() ]], { expr = true })

tnoremap("<Esc>", "<C-\\><C-n>")
tnoremap("jk", "<C-\\><C-n>")
tnoremap("kj", "<C-\\><C-n>")

inoremap("jk", "<esc>")
inoremap("kj", "<esc>")

set({ "n", "t" }, "<C-,>", "<cmd>tabprev<CR>")
set({ "n", "t" }, "<C-.>", "<cmd>tabnext<CR>")
set({ "n", "t" }, "<C-t>", "<cmd>tabnew<CR>")

nnoremap("<leader>.", "<cmd>Explore<CR>")

-- Easier split navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

tnoremap("<C-h>", "<C-\\><C-n><C-w>h")
tnoremap("<C-j>", "<C-\\><C-n><C-w>j")
tnoremap("<C-k>", "<C-\\><C-n><C-w>k")
tnoremap("<C-l>", "<C-\\><C-n><C-w>l")

-- Easier split resizing
nnoremap("<A-l>", "<C-w><")
nnoremap("<A-h>", "<C-w>>")
nnoremap("<A-j>", "<C-w>-")
nnoremap("<A-k>", "<C-w>+")

tnoremap("<A-l>", "<C-\\><C-n><C-w><")
tnoremap("<A-h>", "<C-\\><C-n><C-w>>")
tnoremap("<A-j>", "<C-\\><C-n><C-w>-")
tnoremap("<A-k>", "<C-\\><C-n><C-w>+")
