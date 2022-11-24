local M = {}

function M.configs()
  if jvim.plugin_exists "which-key" then
    require("which-key").setup()
  end
end

M.plugins = {
  "folke/which-key.nvim",
}

return M
