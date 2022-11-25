local M = {}
function M.plugins()
  return { "jayp0521/mason-nvim-dap.nvim" }
end

function M.configs()
  jasvim.with("mason-nvim-dap", function(mason_nvim_dap)
    mason_nvim_dap.setup {
      automatic_installation = false,
    }
  end)
end

return M
