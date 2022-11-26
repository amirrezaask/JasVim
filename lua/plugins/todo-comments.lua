plugin {
  "folke/todo-comments.nvim",
  reuqires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {}
  end,
}
