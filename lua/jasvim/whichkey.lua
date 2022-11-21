local M = {}

function M.configs()
  require("which-key").setup()
end

M.plugins = {
  "folke/which-key.nvim",
}

return M
