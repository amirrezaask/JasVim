local M = {}

function M.plugins()
  return {}
end


function M.configs()
  require("lspconfig").purescriptls.setup {
    on_attach = lsp.on_attach,
  }
end


return M

