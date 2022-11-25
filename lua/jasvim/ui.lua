local ui = {}

function ui.plugins()
  local plugins = jvim.append(
    {
      "sainnhe/sonokai",
      "folke/tokyonight.nvim",
      "martinsione/darkplus.nvim",
      "Mofiqul/dracula.nvim",
      "ellisonleao/gruvbox.nvim",
      "tanvirtin/monokai.nvim",
      "bluz71/vim-nightfly-colors",
      { "catppuccin/nvim", as = "catppuccin" },
      "eemed/sitruuna.vim",
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
  jvim.fuzzy_finder = jvim.fuzzy_finder or "telescope"
  if jvim.fuzzy_finder == "fzf" then
    plugins = jvim.append(plugins, require("jasvim.ui.fzf").plugins)
  elseif jvim.fuzzy_finder == "telescope" then
    plugins = jvim.append(plugins, require("jasvim.ui.telescope").plugins())
  end
  return plugins
end

function jvim.make_transparent()
  vim.cmd [[ hi Normal guibg=none ]]
end

function ui.configs()
  local set_colorscheme = [[ colorscheme  ]] .. jvim.colorscheme or "nightfly"
  pcall(vim.cmd, set_colorscheme)

  if jvim.transparent then
    jvim.make_transparent()
  end

  require("jasvim.ui.statusline").configs()
  require("jasvim.ui.dashboard").configs()
  require("jasvim.ui.splits").configs()
  require("jasvim.ui.dressing").configs()
  require("jasvim.ui.noice").configs()
  jvim.fuzzy_finder = jvim.fuzzy_finder or "telescope"
  if jvim.fuzzy_finder == "fzf" then
    require("jasvim.ui.fzf").configs()
  elseif jvim.fuzzy_finder == "telescope" then
    require("jasvim.ui.telescope").configs()
  end

  jvim.with("nvim-tree", function(nvim_tree)
    nvim_tree.setup()
    jvim.bind {
      n = {
        ["<leader>1"] = "<cmd>NvimTreeToggle<CR>",
      },
    }
  end)
end

return ui
