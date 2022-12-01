use {
  "williamboman/mason.nvim",
  requires = {
    "jayp0521/mason-nvim-dap.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
}

local mason_install_path = require("mason-core.path").concat { vim.fn.stdpath "data", "mason" }

local ok, _ = pcall(require, "mason")
if ok then
  require("mason").setup {
    install_root_dir = mason_install_path,
  }
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

function _G.MasonBinExists(name)
  return vim.fn.filereadable(require("mason-core.path").concat { mason_install_path, "bin", name }) == 1
end

function _G.MasonInstall(to_install)
  local missing = {}

  for _, name in pairs(to_install) do
    if not MasonBinExists(name) then
      table.insert(missing, name)
    end
  end
  require("mason.api.command").MasonInstall(missing)
end
