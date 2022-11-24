local M = {}

function M.configs()
  jvim.L("mason").setup {}
end

function M.plugins()
  return {
    {
      "williamboman/mason.nvim",
    },
  }
end

return M
