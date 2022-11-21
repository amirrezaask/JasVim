local M = {}

function M.configs()
  require("which-key").setup()
end

function M.plugins()
      return {
        "folke/which-key.nvim",
      }

end



return M
