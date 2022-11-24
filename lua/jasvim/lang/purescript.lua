local M = {}

function M.plugins()
  return {}
end

function M.configs()
  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").purescriptls.setup {
      on_attach = lsp.on_attach,
    }
  end
end

return M
