plugin "sainnhe/sonokai"
plugin "folke/tokyonight.nvim"
plugin "Mofiqul/dracula.nvim"
plugin "ellisonleao/gruvbox.nvim"
plugin "tanvirtin/monokai.nvim"
plugin "bluz71/vim-nightfly-colors"
plugin "navarasu/onedark.nvim"
plugin "Shatur/neovim-ayu"
plugin "rose-pine/neovim"
plugin "EdenEast/nightfox.nvim"
plugin "bluz71/vim-moonfly-colors"
plugin { "catppuccin/nvim", as = "catppuccin" }
plugin "tiagovla/tokyodark.nvim"
plugin {
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

function transparent()
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

pcall(vim.cmd.colorscheme, _G.plugins.colorscheme or "tokyonight-night")
