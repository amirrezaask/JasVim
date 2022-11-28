plugin {
  "williamboman/mason.nvim",
  requires = {
    "jayp0521/mason-nvim-dap.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
}

local ok, _ = pcall(require, "mason")
if ok then
  require("mason").setup {}
end

ok, _ = pcall(require, "mason-lspconfig")
if ok then
  require("mason-lspconfig").setup {
    automatic_installation = true,
  }
end

ok, _ = pcall(require, "mason-nvim-dap")
if ok then
  require("mason-nvim-dap").setup {
    automatic_installation = false,
  }
end
