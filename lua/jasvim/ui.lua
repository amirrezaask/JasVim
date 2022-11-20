local ui = {}

function ui.plugins()
  return jasvim.append(
    {
      "stevearc/dressing.nvim",
      "sainnhe/sonokai",
      "folke/tokyonight.nvim",
      "ellisonleao/gruvbox.nvim",
      "bluz71/vim-nightfly-colors",
      {
        "nvim-tree/nvim-tree.lua",
        requires = {
          "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
      },
      {
        "folke/which-key.nvim",
      },
      {
        "j-hui/fidget.nvim",
      },
    },
    require("jasvim.ui.telescope").plugins(),
    require("jasvim.ui.splits").plugins(),
    require("jasvim.ui.statusline").plugins(),
    require("jasvim.ui.dashboard").plugins()
  )
end

function ui.configs()
  vim.cmd [[ colorscheme nightfly ]]

  require("jasvim.ui.telescope").configs()
  require("jasvim.ui.statusline").configs()
  require("jasvim.ui.dashboard").configs()
  require("jasvim.ui.splits").configs()

  require("dressing").setup {}
  require("nvim-tree").setup()
  bind {
    n = {
      ["<leader>l"] = "<cmd>NvimTreeToggle<CR>",
    },
  }
end

return ui
