local M = {}

function M.plugins()
  return {}
end

function M.configs()
  if jasvim.lang.has_treesitter "php" then
    jasvim.treesitter.ensure "php"
  end

  if jasvim.lang.has_lsp "php" then
    jasvim.lsp.config("intelephense", {
      on_attach = lsp.on_attach,
    })
  end
end

return M
