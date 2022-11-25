-- Never delete or comment this line.
require "jasvim.core"

-- Set your default colorscheme
jvim.colorscheme = "tokyonight-night"

-- Do you want your jasvim background to be transparent ?
jvim.transparent = false

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

-- Start Jasvim
jvim.start()
