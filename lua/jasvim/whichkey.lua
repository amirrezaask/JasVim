local M = {}

function M.configs()
  jvim.with("which-key", function(wk)
    wk.setup()
  end)
end

M.plugins = {
  "folke/which-key.nvim",
}

return M
