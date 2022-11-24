local M = {}

function M.plugins()
  return jvim.append({
    "pbrisbin/vim-mkdir",
    "sheerun/vim-polyglot",
    "szw/vim-maximizer",
    "fladson/vim-kitty",
    "towolf/vim-helm",
    "tpope/vim-surround",
    "junegunn/vim-easy-align",
    "kevinhwang91/nvim-bqf",
    "windwp/nvim-autopairs",
    { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*", requires = "rafamadriz/friendly-snippets" },
    "junegunn/goyo.vim",
  }, require("jasvim.editor.treesitter").plugins(), require("jasvim.editor.comment").plugins)
end

function M.configs()
  require("jasvim.editor.treesitter").configs()
  require("jasvim.editor.comment").configs()

  -- ]]

  if jvim.plugin_exists "luasnip" then
    require("luasnip.loaders.from_vscode").lazy_load()
  end

  if jvim.plugin_exists "nvim-autopairs" then
    require("nvim-autopairs").setup {}
  end
end

-- Integrate Tmux and neovim pane and window switching
return M
