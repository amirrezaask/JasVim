local M = {}

M.plugins = {
  { "junegunn/fzf", run = ":call fzf#install()" },
  { "junegunn/fzf.vim" },
}

function M.configs()
  jvim.bind {
    n = {
      ["<leader><leader>"] = { ":Files<cr>", desc = "Find Files" },
      ["<leader>ff"] = { "<cmd>Files<cr>", desc = "Find Files" },
      ["<leader>fn"] = { "<cmd>Files ~/.config/nvim<CR>", desc = "Neovim Config" },
      ["<leader>fg"] = { "<cmd>GFiles<cr>", desc = "Git Files" },
      ["<leader>fr"] = { "<cmd>History<cr>", desc = "Recent Files" },
      ["<leader>fh"] = { "<cmd>Helptags<CR>", desc = "Help" },
      ["<leader>p"] = { "<cmd>Commands<cr>", desc = "Command palete" },
      ["<leader>fc"] = { "<cmd>Commands<cr>", desc = "Command palete" },
      ["??"] = { "<cmd>Rg<cr>", desc = "live grep" },
    },
  }
end

return M
