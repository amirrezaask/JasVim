use { "cuducos/yaml.nvim" }
function configs.yaml()
  treesitter.ensure "yaml"
  lsp.config("yamlls", {
    on_attach = lsp.on_attach,
  })
end
