local M = {}

function M.plugins()
  return {}
end

function M.configs()
  jvim.treesitter.ensure "c"
  jvim.treesitter.ensure "cpp"

  jvim.lsp.config("clangd", {
    on_attach = lsp.on_attach,
  })
end

return M
