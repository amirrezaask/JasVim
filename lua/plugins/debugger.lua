plugin {
  "jayp0521/mason-nvim-dap.nvim",
  config = function()
    require("mason-nvim-dap").setup {
      automatic_installation = false,
    }
  end,
}
