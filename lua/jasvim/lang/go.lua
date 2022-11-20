local M = {}

function M.plugins()
  return {}
end

function M.configs()
  require("nvim-treesitter.install").ensure_installed "go"

  require("lspconfig").gopls.setup {
    on_attach = lsp.on_attach,
  }

  jasvim.onsave("*.go", function()
    vim.lsp.buf.format()
  end)
end

return M
