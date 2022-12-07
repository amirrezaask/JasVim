local keymaps = require "core.keymaps"
local nnoremap = keymaps.nnoremap

keymaps.bind {
  n = {
    ["<M-j>"] = ":m .+1<CR>==",
    ["<M-k>"] = ":m .-2<CR>==",

    ["<C-d>"] = "<C-d>zz",
    ["<C-u>"] = "<C-u>zz",

    ["j"] = "gj",
    ["k"] = "gk",

    ["X"] = ":w | :so %<CR>",
    ["<CR>"] = { [[ {-> v:hlsearch ? ':nohl<CR>' : '<CR>'}() ]], expr = true },

    ["<leader>ek"] = { ":e ~/.config/kitty/kitty.conf<CR>", desc = "Edit Kitty" },
  },
  t = {
    ["<Esc>"] = "<C-\\><C-n>",
    ["jk"] = "<C-\\><C-n>",
    ["kj"] = "<C-\\><C-n>",
  },

  i = {
    ["jk"] = "<esc>",
    ["kj"] = "<esc>",
  },
}

nnoremap("Q", "<NOP>")
nnoremap("{", ":cnext<CR>")
nnoremap("}", ":cprev<CR>")
nnoremap("Y", "y$")
nnoremap("n", "nzz")
nnoremap("N", "Nzz")
