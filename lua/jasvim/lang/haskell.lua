local M = {}
function M.configs()
  jvim.treesitter.ensure "haskell"
  jvim.lsp.config("hls", {
    on_attach = lsp.on_attach,
  })
end

function M.plugins()
  return {}
end

return M
