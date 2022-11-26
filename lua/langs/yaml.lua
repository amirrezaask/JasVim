plugin { "cuducos/yaml.nvim" }
treesitter.ensure "yaml"
lsp.config("yamlls", {
  on_attach = lsp.on_attach,
})
