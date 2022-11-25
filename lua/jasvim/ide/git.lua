local M = {}

function M.plugins()
  return {
    "tpope/vim-fugitive",
    "junegunn/gv.vim",
    "cohama/agit.vim",
    {
      "lewis6991/gitsigns.nvim",
    },
    {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
    },
  }
end

function M.configs()
  jvim.with("neogit", function(neogit)
    neogit.setup {}
  end)
  jvim.with("gitsigns", function(gitsigns)
    gitsigns.setup {}
  end)
end

return M
