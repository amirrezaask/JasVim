local M = {}

function M.plugins()
  return {}
end
function M.configs()
  if jasvim.lang.has_treesitter "elixir" then
    jasvim.treesitter.ensure "elixir"
  end

  if jasvim.lang.has_lsp "elixir" then
    jasvim.lsp.config("elixirls", {
      on_attach = lsp.on_attach,
    })
  end
end

return M
