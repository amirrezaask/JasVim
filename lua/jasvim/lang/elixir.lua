local M = {}

function M.plugins()
  return {}
end
function M.configs()
  jvim.treesitter.ensure "elixir"

  jvim.lsp.config("elixirls", {
    on_attach = lsp.on_attach,
  })
end

return M
