jasvim.plugin "tpope/vim-fugitive"
jasvim.plugin "junegunn/gv.vim"
jasvim.plugin "cohama/agit.vim"
jasvim.plugin {
  "lewis6991/gitsigns.nvim",
}
jasvim.plugin {
  "TimUntersberger/neogit",
  requires = "nvim-lua/plenary.nvim",
}

require("neogit").setup()
require("gitsigns").setup()
