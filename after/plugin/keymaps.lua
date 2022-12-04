require("amirrezaask.keymaps").bind {
  n = {
    ["Q"] = "<NOP>",
    [";,"] = ":",
    ["q;"] = "q:",
    ["{"] = ":cprev<CR>",
    ["}"] = ":cnext<CR>",
    ["Y"] = "y$",
    ["n"] = "nzz",
    ["N"] = "Nzz",

    ["<M-j>"] = ":m .+1<CR>==",
    ["<M-k>"] = ":m .-2<CR>==",

    ["j"] = "gj",
    ["k"] = "gk",
    ["<leader>ce"] = ":e ~/.config/nvim/init.lua<CR>",
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
