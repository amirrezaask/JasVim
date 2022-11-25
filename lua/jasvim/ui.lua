local ui = {}

function ui.plugins()
  local plugins = jasvim.append(
    {
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
    require("jasvim.ui.colorschemes").plugins(),
    require("jasvim.ui.noice").plugins
  )
  jvim.fuzzy_finder = jvim.fuzzy_finder or "telescope"
  if jvim.fuzzy_finder == "fzf" then
    plugins = jasvim.append(plugins, require("jasvim.ui.fzf").plugins)
  elseif jvim.fuzzy_finder == "telescope" then
    plugins = jasvim.append(plugins, require("jasvim.ui.telescope").plugins())
  end
  return plugins
end

function ui.configs()
  if jvim.transparent then
    vim.cmd [[ hi Normal guibg=none ]]
  end

  require("jasvim.ui.statusline").configs()
  require("jasvim.ui.dashboard").configs()
  require("jasvim.ui.splits").configs()
  require("jasvim.ui.dressing").configs()
  require("jasvim.ui.noice").configs()
  require("jasvim.ui.colorschemes").configs()
  jasvim.fuzzy_finder = jasvim.fuzzy_finder or "telescope"
  if jasvim.fuzzy_finder == "fzf" then
    require("jasvim.ui.fzf").configs()
  elseif jasvim.fuzzy_finder == "telescope" then
    require("jasvim.ui.telescope").configs()
  end

  jasvim.with("nvim-tree", function(nvim_tree)
    nvim_tree.setup()
    jasvim.bind {
      n = {
        ["<leader>1"] = "<cmd>NvimTreeToggle<CR>",
      },
    }
  end)
end

return ui
