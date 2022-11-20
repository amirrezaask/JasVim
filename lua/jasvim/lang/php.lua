local M = {}

function M.plugins()
  return {}
end

function M.configs()
  require("nvim-treesitter.install").ensure_installed "php"
  require("lspconfig").intelephense.setup {
    on_attach = lsp.on_attach,
  }
end

return M
