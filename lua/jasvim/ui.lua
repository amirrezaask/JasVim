local ui = {}

function ui.plugins()
  return jasvim.append(
    {
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
        "j-hui/fidget.nvim",
      },
    },
    require("jasvim.ui.telescope").plugins(),
    require("jasvim.ui.splits").plugins(),
    require("jasvim.ui.statusline").plugins(),
    require("jasvim.ui.dressing").plugins,
    require("jasvim.ui.dashboard").plugins(),
    require("jasvim.ui.noice").plugins
  )
end

function ui.configs()
  vim.cmd([[ colorscheme  ]] .. jasvim.colorscheme or "nightfly")

  require("jasvim.ui.telescope").configs()
  require("jasvim.ui.statusline").configs()
  require("jasvim.ui.dashboard").configs()
  require("jasvim.ui.splits").configs()
  require("jasvim.ui.dressing").configs()
  require("jasvim.ui.noice").configs()

  require("nvim-tree").setup()
  jasvim.bind {
    n = {
      ["<leader>1"] = "<cmd>NvimTreeToggle<CR>",
    },
  }
end

return ui
