plugin {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {}
  end,
}

plugin {
  "tpope/vim-fugitive",
}

plugin {
  "junegunn/gv.vim",
}

plugin {
  "cohama/agit.vim",
}

plugin {
  "TimUntersberger/neogit",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("neogit").setup {}
  end,
}
