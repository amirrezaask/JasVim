plugin {
  "williamboman/mason.nvim",
  requires = {
    "jayp0521/mason-nvim-dap.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
}

local ok, _ = pcall(require, "mason")

if not ok then
  return
end

require("mason").setup {}

require("mason-lspconfig").setup {
  automatic_installation = true,
}

require("mason-nvim-dap").setup {
  automatic_installation = false,
}
