local M = {}
function M.configs()
  require("nvim-treesitter.install").ensure_installed "haskell"
  require("lspconfig").hls.setup {
    on_attach = lsp.on_attach,
  }
end

function M.plugins()
  return {}
end

return M
