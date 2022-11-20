-- Keymap helper
-- Set leader to <Space>
vim.g.mapleader = " "

function bind(spec)
  for mode, keys in pairs(spec) do
    for key, binding in pairs(keys) do
      if type(binding) == "string" or type(binding) == "function" then
        vim.keymap.set(mode, key, binding)
      else
        if type(binding) == "table" then
          -- { function or string, doc }
          local handler = binding[1]
          table.remove(binding, 1)
          vim.keymap.set(mode, key, handler, binding)
        end
      end
    end
  end
end

-- [[ Basic keymaps
bind {
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
    ["<leader>c"] = ":e ~/.config/nvim/init.lua<CR>",
    ["<CR>"] = { [[ {-> v:hlsearch ? ':nohl<CR>' : '<CR>'}() ]], expr = true },
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
