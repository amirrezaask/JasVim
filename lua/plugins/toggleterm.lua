use {
  "akinsho/toggleterm.nvim",
}
function configs.toggleterm()
  require("toggleterm").setup {
    size = function(term)
      if term.direction == "horizontal" then
        return math.ceil(vim.o.lines * 0.3)
      elseif term.direction == "vertical" then
        return math.ceil(vim.o.columns * 0.4)
      end
    end,
    direction = "vertical",
  }

  bind {
    n = {
      ["<C-`>"] = "<cmd>ToggleTerm<CR>",
    },
    t = {
      ["<C-`>"] = "<cmd>ToggleTerm<CR>",
    },
  }
end
