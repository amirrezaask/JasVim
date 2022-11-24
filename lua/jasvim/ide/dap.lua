local M = {}
function M.plugins()
  return { "jayp0521/mason-nvim-dap.nvim" }
end

function M.configs()
  if jvim.plugin_exists "masvon-nvim-dap" then
    require("mason-nvim-dap").setup {
      automatic_installation = false,
    }
  end
end

return M
