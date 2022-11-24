local M = {}

function M.configs()
  if jvim.plugin_exists "mason" then
    require("mason").setup {}
  end
end

function M.plugins()
  return {
    {
      "williamboman/mason.nvim",
    },
  }
end

return M
