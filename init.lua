-- Never delete or comment this line.
require "jasvim.core"

-- Set your default colorscheme
jvim.colorscheme = "tokyonight-night"

-- Do you want your jasvim background to be transparent ?
jvim.transparent = false

-- Set leader key, by default it's Space
jvim.leader = " "

-- it can be fzf | telescope
jvim.fuzzy_finder = "telescope"

-- if you want a fancy start screen or not
jvim.start_screen = true

-- Which languages you want to support ?
jvim.languages = {
  -- "cc",
  -- "elixir",
  "go",
  -- "haskell",
  "json",
  "lua",
  -- "org",
  "php",
  -- "purescript",
  "python",
  "rust",
  "yaml",
  -- "zig",
}

-- Adding a custom keymap
jvim.bind {
  n = {
    ["<leader>abc"] = function()
      print "some custom keymap"
    end,
  },
}

-- Installing a plugin
-- for documentation of syntax check https://github.com/wbthomason/packer.nvim
jvim.plugin { "catppuccin/nvim", as = "catppuccin" }

-- Start Jasvim
jvim.start()
