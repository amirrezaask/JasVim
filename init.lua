-- Jasvim
-- Core libraries and helpers are in $HOME/.config/nvim/lua/core/*.lua
-- Configurations for all plugins reside in $HOME/.config/nvim/lua/plugins/<plugin name>.lua
-- Language configurations are in $HOME/.config/nvim/lua/langs/<language name>.lua
-- All configurations will load automatically and there is no need to source your stuff in your init.lua
-- Also some plugins are grouped under one group name forexample all git related plugins are in git.lua
-- _G in lua is global namespace, we use it for less linter errors but in lua anything without `local` keyword is global.

-- Core functionalities and utilities
require "core"

-- Now we set values we want.
plugins.fuzzy_finder = "telescope"

-- Colorscheme, check :Theme command for available options
plugins.colorscheme = "catppuccin"
-- plugins.colorscheme = "gruvbox"

-- If you want transparent background
-- plugins.transparent = true

-- Wether you want startup alpha dashboard or no.
plugins.alpha = {
  enabled = false,
}

-- Some language specific settings
-- language specific ones will override globals
-- by default I don't want auto format
-- but for specific languages i want them
langs = {
  autoformat = false,

  go = {
    autoformat = true,
  },

  lua = {
    autoformat = true,
  },
}

-- Loader
-- install all missing plugins
-- then load all your /lua/plugins/*.lua and /lua/langs/*.lua
require "core.loader"
