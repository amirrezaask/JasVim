local M = {}

M.plugins = {
  {
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}

function M.configs() end

return M
