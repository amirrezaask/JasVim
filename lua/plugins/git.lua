use {
  "lewis6991/gitsigns.nvim",
}

use {
  "junegunn/gv.vim",
}

use {
  "cohama/agit.vim",
}

use {
  "TimUntersberger/neogit",
  requires = "nvim-lua/plenary.nvim",
}


function configs.gitsigns()
  require("gitsigns").setup {}
  require("neogit").setup {
    kind = "vsplit",
  }
  nnoremap("<leader>g", "<cmd>Neogit<cr>")
end
