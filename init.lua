-- Jasvim
-- Core libraries and helpers are in $HOME/.config/nvim/lua/core/*.lua
-- Configurations for all plugins reside in $HOME/.config/nvim/lua/plugins/<plugin name>.lua
-- Language configurations are in $HOME/.config/nvim/lua/langs/<language name>.lua
-- All configurations will load automatically and there is no need to source your stuff in your init.lua
-- Also some plugins are grouped under one group name forexample all git related plugins are in git.lua

require "core.keymaps"
require "core.options"
require "core.packer"
require "core.mason"
require "core.lsp"
require "core.treesitter"

local loader = require "core.loader"

_G.fuzzy_finder = "fzf"

_G.langs = {
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
loader()

-- PackerInstall
-- PackerCompile
vim.cmd.JvimReload()
