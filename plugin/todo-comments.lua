use {
  "folke/todo-comments.nvim",
  reuqires = "nvim-lua/plenary.nvim",
}

function configs.todo_comments()
  require("todo-comments").setup {}
end
