-- Never delete or comment this line.
require "jasvim.core"

-- Automatic installation of plugins on startup
jvim.auto_install_plugins = true

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

-- Default configuration that applies for all languages unless overridden
jvim.language_defaults = {
  autoformat = false,
  lsp = true,
  treesitter = true,
}

-- Which languages you want to support and what features ?
-- See list of available features for each language in docs.
jvim.languages = {
  go = {
    autoformat = true,
  },
  lua = {
    autoformat = true,
  },
  cc = {},
  elixir = {},
  haskell = {},
  json = {},
  org = {},
  php = {},
  purescript = {},
  python = {},
  rust = {},
  yaml = {},
  zig = {},
}

-- Adding a custom keymap
-- jvim.bind {
--   n = {
--     ["<leader>abc"] = function()
--       print "some custom keymap"
--     end,
--   },
-- }
-- or
-- You can use normal vim way of keymaps
-- ofcourse they are limited to only vimscript
-- nnoremap lhs rhs
-- inoremap lhs rhs
-- vnoremap lhs rhs
-- ...
-- or
-- new neovim keymap api
-- :help vim.keymap.set
-- vim.keymap.set(mode, lhs, rhs, opts)
-- vim.keymap.set('i', lhs, rhs, opts)
-- vim.keymap.set('n', lhs, rhs, opts)
-- vim.keymap.set('v', lhs, rhs, opts)
--

-- Installing a plugin
-- for documentation of syntax check https://github.com/wbthomason/packer.nvim
-- jvim.plugin {
--   "catppuccin/nvim",
--   as = "catppuccin",
-- }

-- Start Jasvim
jvim.start()
