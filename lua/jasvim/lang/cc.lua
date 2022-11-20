local M = {}

function M.plugins()
  return {}
end

function M.configs()
  require("nvim-treesitter.install").ensure_installed "c"
  require("nvim-treesitter.install").ensure_installed "cpp"

  require("lspconfig").clangd.setup {
    on_attach = lsp.on_attach,
  }
end

return M
