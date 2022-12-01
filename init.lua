-- Core functionalities and utilities
require "core"

-- Now we set values we want.
plugins.fuzzy_finder = "telescope"

-- Colorscheme, check :Theme command for available options
plugins.colorscheme = "catppuccin"
plugins.transparent = false

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
