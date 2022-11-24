local M = {}

function M.plugins()
  return {}
end

function M.configs()
  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "php"
  end
  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").intelephense.setup {
      on_attach = lsp.on_attach,
    }
  end
end

return M
