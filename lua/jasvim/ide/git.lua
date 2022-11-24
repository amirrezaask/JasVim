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
  if jvim.plugin_exists "neogit" then
    require("neogit").setup()
  end
  if jvim.plugin_exists "gitsigns" then
    require("gitsigns").setup()
  end
end

return M
