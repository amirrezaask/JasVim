local M = {}

function M.plugins()
  return jasvim.append({
    "pbrisbin/vim-mkdir",
    "sheerun/vim-polyglot",
    "szw/vim-maximizer",
    "fladson/vim-kitty",
    "towolf/vim-helm",
    "tpope/vim-surround",
    "junegunn/vim-easy-align",
    "kevinhwang91/nvim-bqf",
    "windwp/nvim-autopairs",
    { "L3MON4D3/LuaSnip", requires = "rafamadriz/friendly-snippets" },
    "junegunn/goyo.vim",
  }, require("jasvim.editor.treesitter").plugins(), require("jasvim.editor.comment").plugins)
end

function M.configs()
  require("jasvim.editor.treesitter").configs()
  require("jasvim.editor.comment").configs()

  -- ]]

  jasvim.with("luasnip", function(_)
    require("luasnip.loaders.from_vscode").lazy_load()
  end)

  jasvim.with("nvim-autopairs", function(autopairs)
    autopairs.setup {}
  end)
end

-- Integrate Tmux and neovim pane and window switching
return M
