use "sainnhe/sonokai"
use "folke/tokyonight.nvim"
use "Mofiqul/dracula.nvim"
use "ellisonleao/gruvbox.nvim"
use "tanvirtin/monokai.nvim"
use "bluz71/vim-nightfly-colors"
use "navarasu/onedark.nvim"
use "Shatur/neovim-ayu"
use "rose-pine/neovim"
use "EdenEast/nightfox.nvim"
use "bluz71/vim-moonfly-colors"
use { "catppuccin/nvim", as = "catppuccin" }
use "tiagovla/tokyodark.nvim"
use {
  "glepnir/zephyr-nvim",
  requires = { "nvim-treesitter/nvim-treesitter", opt = true },
}

local themes = {
  "sonokai",
  "tokyonight",
  "tokyonight-day",
  "tokyonight-moon",
  "tokyonight-night",
  "tokyonight-storm",
  "dracula",
  "gruvbox",
  "monokai",
  "nightfly",
  "ayu-mirage",
  "ayu-dark",
  "ayu-light",
  "onedark",
  "rose-pine",
  "nightfox",
  "moonfly",
  "tokyodark",
  "catppuccin",
  "catppuccin-frappe",
  "catppuccin-latte",
  "catppuccin-macchiato",
  "catppuccin-mocha",
}

local function transparent()
  vim.cmd.highlight "Normal guibg=none"
end

vim.api.nvim_create_user_command("Transparent", transparent, {})

local function select_theme()
  vim.ui.select(themes, {
    prompt = "Choose theme: ",
  }, function(theme)
    vim.cmd.colorscheme(theme)
  end)
end

vim.api.nvim_create_user_command("Theme", select_theme, {})


function configs.colorscheme()
  pcall(vim.cmd.colorscheme, _G.plugins.colorscheme or "tokyonight-night")
  if plugins.transparent == true then
    transparent()
  end
end
