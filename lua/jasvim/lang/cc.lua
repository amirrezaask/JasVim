local M = {}

function M.plugins()
  return {}
end

function M.configs()
  if jasvim.lang.has_treesitter "cc" then
    jasvim.treesitter.ensure "c"
    jasvim.treesitter.ensure "cpp"
  end

  if jasvim.lang.has_lsp "cc" then
    jasvim.lsp.config("clangd", {
      on_attach = lsp.on_attach,
    })
  end
end

return M
