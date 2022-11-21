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
  require("neogit").setup()
  require("gitsigns").setup()
end

return M
