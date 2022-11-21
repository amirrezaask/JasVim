local M = {}

function M.configs()
  jasvim.L("mason").setup {}
end

function M.plugins()
  return {
    {
      "williamboman/mason.nvim",
    },
  }
end

return M
