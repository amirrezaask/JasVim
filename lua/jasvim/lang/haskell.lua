local M = {}
function M.configs()
  if jasvim.lang.has_treesitter "haskell" then
    jasvim.treesitter.ensure "haskell"
  end
  if jasvim.lang.has_lsp "haskell" then
    jasvim.lsp.config("hls", {
      on_attach = lsp.on_attach,
    })
  end
end

function M.plugins()
  return {}
end

return M
