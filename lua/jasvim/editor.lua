-- Integrate Tmux and neovim pane and window switching
jasvim.plugin "mrjones2014/smart-splits.nvim"
jasvim.plugin "christoomey/vim-tmux-navigator"
jasvim.plugin "pbrisbin/vim-mkdir"
jasvim.plugin "sheerun/vim-polyglot"
jasvim.plugin "szw/vim-maximizer"
jasvim.plugin "fladson/vim-kitty"
jasvim.plugin "towolf/vim-helm"
jasvim.plugin "jansedivy/jai.vim"
jasvim.plugin {
  "folke/todo-comments.nvim",
  reuqires = "nvim-lua/plenary.nvim",
}
jasvim.plugin "tpope/vim-surround"
jasvim.plugin "junegunn/vim-easy-align"
jasvim.plugin {
  "numToStr/Comment.nvim",
}
jasvim.plugin "windwp/nvim-autopairs"
jasvim.plugin { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*", requires = "rafamadriz/friendly-snippets" }
jasvim.plugin "junegunn/goyo.vim"

jasvim.L "jasvim.editor.treesitter"
jasvim.L("todo-comments").setup()
jasvim.L("Comment").setup {
  ---Add a space b/w comment and the line
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while (un)comment
  ---LHS of toggle mappings in NORMAL mode
  toggler = {
    ---Line-comment toggle keymap
    line = "gcc",
    ---Block-comment toggle keymap
    block = "gbc",
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = "gc",
    ---Block-comment keymap
    block = "gb",
  },
  ---LHS of extra mappings
  extra = {
    ---Add comment on the line above
    above = "gcO",
    ---Add comment on the line below
    below = "gco",
    ---Add comment at the end of line
    eol = "gcA",
  },
  ---Enable keybindings
  mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = true,
  },
}
-- ]]

jasvim.L("luasnip.loaders.from_vscode").lazy_load()

jasvim.L("nvim-autopairs").setup {}
