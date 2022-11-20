local M = {}
function M.plugins()
  return { "jayp0521/mason-nvim-dap.nvim" }
end

function M.configs()
  require("mason-nvim-dap").setup {
    automatic_installation = false,
  }
end

return M
