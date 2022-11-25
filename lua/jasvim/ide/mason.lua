local M = {}

function M.configs()
  jasvim.with("mason", function(mason)
    mason.setup {}
  end)
end

function M.plugins()
  return {
    {
      "williamboman/mason.nvim",
    },
  }
end

return M
