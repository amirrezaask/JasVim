vim.g.catppuccin_flavour = "mocha"
vim.g.gruvbox_contrast_dark = "hard"

local tokyonight_style = "storm"

local colorscheme = "rose-pine"

local transparent = false

local ok, gruvbox = pcall(require, "gruvbox")
if ok then
  gruvbox.setup {
    transparent_mode = transparent,
    contrast = "hard",
  }
end

ok, _ = pcall(require, "onedark")
if ok then
  require("onedark").setup {
    style = "darker",
    transparent = transparent,
  }
end

ok, _ = pcall(require, "tokyonight")
if ok then
  require("tokyonight").setup {
    style = tokyonight_style,
    transparent = transparent,
  }
end

pcall(function()
  vim.cmd("colorscheme " .. colorscheme)
end)

local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end

if transparent then
  hl("Normal", {
    bg = "none",
  })
end

if colorscheme == "gruvbox" then
  hl("ColorColumn", {
    ctermbg = 0,
    bg = "#2B79A0",
  })

  hl("LineNr", {
    fg = "#5eacd3",
  })

  hl("netrwDir", {
    fg = "#5eacd3",
  })
end

local themes = {
  "rose-pine",

  "cappuccin",
  "cappuccin-mocha",
  "catppuccin-macchiato",
  "catppuccin-frappe",
  "catppuccin-latte",

  "sonokai",
  "tokyonight",
  "tokyonight-night",
  "tokyonight-moon",
  "tokyonight-storm",
  "tokyonight-day",

  "dracula",
  "gruvbox",
  "nightfox",
  "nightfly",
  "onedark",
}

local function select_theme()
  vim.ui.select(themes, {
    prompt = "Choose theme: ",
  }, function(theme)
    vim.cmd.colorscheme(theme)
  end)
end

vim.api.nvim_create_user_command("Theme", select_theme, {})
