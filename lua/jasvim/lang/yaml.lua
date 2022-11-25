local M = {}

function M.configs()
  jvim.treesitter.ensure "yaml"
  jvim.lsp.config("yamlls", {
    on_attach = jvim.lsp.on_attach,
  })
end

function M.plugins()
  return { "cuducos/yaml.nvim" }
end

return M
