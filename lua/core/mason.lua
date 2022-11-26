plugin {
  "williamboman/mason.nvim",
  requires = {
    "jayp0521/mason-nvim-dap.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup {}
    require'mason-lspconfig'.setup {
      automatic_installation = false
    }
    require("mason-nvim-dap").setup()
  end,
}

