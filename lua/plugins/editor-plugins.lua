plugin "pbrisbin/vim-mkdir"

plugin "sheerun/vim-polyglot"

plugin "szw/vim-maximizer"

plugin "fladson/vim-kitty"

plugin "towolf/vim-helm"

plugin "tpope/vim-surround"

plugin "junegunn/vim-easy-align"

plugin "kevinhwang91/nvim-bqf"

plugin "tpope/vim-eunuch"

plugin "tpope/vim-sleuth"

plugin {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {}
  end,
}
