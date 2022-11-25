local M = {}

function M.plugins()
  return {}
end

function M.configs()
  jvim.lsp.config("purescriptls", {
    on_attach = lsp.on_attach,
  })
end

return M
