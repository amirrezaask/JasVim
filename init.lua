-- Never delete or comment this line.
require "jasvim.core"

-- Set your default colorscheme
jvim.colorscheme = "dracula"

-- Do you want your jasvim background to be transparent ?
jvim.transparent = false

jvim.leader = " "

-- it can be fzf | telescope
jvim.fuzzy_finder = "telescope"

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

-- Start Jasvim
jvim.start()
