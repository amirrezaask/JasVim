local M = {}

function M.plugins()
  return jasvim.append({
    "pbrisbin/vim-mkdir",
    "sheerun/vim-polyglot",
    "szw/vim-maximizer",
    "fladson/vim-kitty",
    "towolf/vim-helm",
    "jansedivy/jai.vim",
    {
      "folke/todo-comments.nvim",
      reuqires = "nvim-lua/plenary.nvim",
    },
    "tpope/vim-surround",
    "junegunn/vim-easy-align",
    {
      "numToStr/Comment.nvim",
    },
    "windwp/nvim-autopairs",
    { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*", requires = "rafamadriz/friendly-snippets" },
    "junegunn/goyo.vim",
  }, require'jasvim.editor.treesitter'.plugins())
end

function M.configs()
  require "jasvim.editor.treesitter".configs()
  require("todo-comments").setup()
  require("Comment").setup {
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

  require("luasnip.loaders.from_vscode").lazy_load()

  require("nvim-autopairs").setup {}
end

-- Integrate Tmux and neovim pane and window switching
return M
