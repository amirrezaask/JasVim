local ui = {}

function ui.plugins()
  local plugins = jasvim.append(
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
    {
      "glepnir/zephyr-nvim",
      requires = { "nvim-treesitter/nvim-treesitter", opt = true },
    },
    require("jasvim.ui.splits").plugins(),
    require("jasvim.ui.statusline").plugins(),
    require("jasvim.ui.dressing").plugins,
    require("jasvim.ui.dashboard").plugins(),
    require("jasvim.ui.noice").plugins
  )
  jasvim.fuzzy_finder = jasvim.fuzzy_finder or 'telescope'
  if jasvim.fuzzy_finder == "fzf" then
    plugins = jasvim.append(plugins, require("jasvim.ui.fzf").plugins)
  elseif jasvim.fuzzy_finder == "telescope" then
    plugins = jasvim.append(plugins, require("jasvim.ui.telescope").plugins())
  end
  return plugins
end

function jasvim.make_transparent()
  vim.cmd [[ hi Normal guibg=none ]]
end

function ui.configs()
  vim.cmd([[ colorscheme  ]] .. jasvim.colorscheme or "nightfly")

  if jasvim.transparent then
    jasvim.make_transparent()
  end

  require("jasvim.ui.statusline").configs()
  require("jasvim.ui.dashboard").configs()
  require("jasvim.ui.splits").configs()
  require("jasvim.ui.dressing").configs()
  require("jasvim.ui.noice").configs()
  jasvim.fuzzy_finder = jasvim.fuzzy_finder or 'telescope'
  if jasvim.fuzzy_finder == "fzf" then
    require("jasvim.ui.fzf").configs()
  elseif jasvim.fuzzy_finder == "telescope" then
    require("jasvim.ui.telescope").configs()
  end

  require("nvim-tree").setup()
  jasvim.bind {
    n = {
      ["<leader>1"] = "<cmd>NvimTreeToggle<CR>",
    },
  }
end

return ui
