use {
  "nvim-tree/nvim-tree.lua",
  requires = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  tag = "nightly", -- optional, updated every week. (see issue #1193)
}

function configs.nvim_tree()
  require("nvim-tree").setup()
  bind {
    n = {
      ["<leader>1"] = "<cmd>NvimTreeToggle<CR>",
    },
  }
end
