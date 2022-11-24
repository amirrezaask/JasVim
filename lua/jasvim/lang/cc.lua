local M = {}

function M.plugins()
  return {}
end

function M.configs()
  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "c"
    require("nvim-treesitter.install").ensure_installed "cpp"
  end
  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").clangd.setup {
      on_attach = lsp.on_attach,
    }
  end
end

return M
