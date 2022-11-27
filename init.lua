-- Jasvim
-- Core libraries and helpers are in $HOME/.config/nvim/lua/core/*.lua
-- Configurations for all plugins reside in $HOME/.config/nvim/lua/plugins/<plugin name>.lua
-- Language configurations are in $HOME/.config/nvim/lua/langs/<language name>.lua
-- All configurations will load automatically and there is no need to source your stuff in your init.lua
-- Also some plugins are grouped under one group name forexample all git related plugins are in git.lua
-- _G in lua is global namespace, we use it for less linter errors but in lua anything without `local` keyword is global.

require "core.keymaps"
require "core.options"
require "core.packer"
require "core.mason"
require "core.lsp"
require "core.treesitter"

_G.fuzzy_finder = "telescope"

_G.langs = {
  -- Global autoformat configuration, langauge specific ones will override this
  autoformat = true,

  lua = {
    autoformat = true,
  },
  go = {
    autoformat = true,
  },
  rust = {
    autoformat = true,
  },
}

-- Loader will load all your /lua/plugins/*.lua and /lua/langs/*.lua
require "core.loader"

-- PackerInstall
-- PackerCompile
vim.cmd.JvimReload()
