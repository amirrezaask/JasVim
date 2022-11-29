plugin {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {}
  end,
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
    require("neogit").setup {
      kind = "vsplit",
    }
    nnoremap("<leader>g", "<cmd>Neogit<cr>")
  end,
}
