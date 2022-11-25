local M = {}

function M.configs()
  if jasvim.lang.has_treesitter "yaml" then
    jasvim.treesitter.ensure "yaml"
  end
  if jasvim.lang.has_lsp "yaml" then
    jasvim.lsp.config("yamlls", {
      on_attach = jasvim.lsp.on_attach,
    })
  end
end

function M.plugins()
  return { "cuducos/yaml.nvim" }
end

return M
