local M = {}

function M.configs()
  require("toggleterm").setup {
    size = function(term)
      if term.direction == "horizontal" then
        return 20
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    direction = "horizontal",
    float_opts = {
      border = "single",
      height = math.ceil(jasvim.window_height() * 0.5),
      width = math.ceil(jasvim.window_width() * 0.3),
      winblend = 3,
    },
  }
end
function M.plugins()
  jasvim.plugin {
    "akinsho/toggleterm.nvim",
    tag = "*",
  }
end

return M
