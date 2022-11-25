local M = {}

function M.plugins()
  return {}
end

function M.configs()
  -- TODO: is there a purescript treesitter grammer ?
  -- if jasvim.lang.has_treesitter "purescript" then
  --   jasvim.treesitter.ensure "purescript"
  -- end
  if jasvim.lang.has_lsp "purescript" then
    jasvim.lsp.config("purescriptls", {
      on_attach = lsp.on_attach,
    })
  end
end

return M
