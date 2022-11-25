local M = {}

function M.configs()
  if not jasvim.plugin_exists "toggleterm" then
    return
  end
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

  jasvim.bind {
    n = {
      ["<C-`>"] = "<cmd>ToggleTerm<CR>",
    },
    t = {
      ["<C-`>"] = "<cmd>ToggleTerm<CR>",
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
