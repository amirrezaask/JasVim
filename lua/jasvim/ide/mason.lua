local M = {}

function M.configs()
  jvim.with("mason", function(mason)
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
